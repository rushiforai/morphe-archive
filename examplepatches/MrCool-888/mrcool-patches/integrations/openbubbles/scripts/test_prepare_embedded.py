import hashlib
import importlib.util
from pathlib import Path
import struct
import sys
import tempfile
import unittest
import zipfile


SCRIPT = Path(__file__).with_name("prepare-embedded.py")
SPEC = importlib.util.spec_from_file_location("prepare_embedded", SCRIPT)
prepare = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
sys.modules[SPEC.name] = prepare
SPEC.loader.exec_module(prepare)


class ClassFile:
    def __init__(self):
        self.entries = [None]
        self.indices = {}

    def add(self, key, encoded):
        if key not in self.indices:
            self.indices[key] = len(self.entries)
            self.entries.append(encoded)
        return self.indices[key]

    def utf8(self, value):
        data = value.encode("utf-8")
        return self.add(("utf8", value), b"\x01" + struct.pack(">H", len(data)) + data)

    def clazz(self, name):
        return self.add(("class", name), b"\x07" + struct.pack(">H", self.utf8(name)))

    def member_ref(self, tag, owner, name, descriptor):
        name_type = self.add(("nt", name, descriptor),
                             b"\x0c" + struct.pack(">HH", self.utf8(name), self.utf8(descriptor)))
        return self.add(("ref", tag, owner, name, descriptor),
                        bytes([tag]) + struct.pack(">HH", self.clazz(owner), name_type))


def class_bytes(name, super_name="java/lang/Object", interfaces=(), fields=(), methods=(), refs=(), access=0x0021):
    cp = ClassFile()
    this_class = cp.clazz(name)
    super_class = cp.clazz(super_name) if super_name else 0
    interface_indexes = [cp.clazz(value) for value in interfaces]
    field_indexes = [(0x0001, cp.utf8(member_name), cp.utf8(descriptor))
                     for member_name, descriptor in fields]
    method_indexes = [(0x0001, cp.utf8(member_name), cp.utf8(descriptor))
                      for member_name, descriptor in methods]
    for tag, owner, member_name, descriptor in refs:
        cp.member_ref(tag, owner, member_name, descriptor)
    pool = struct.pack(">H", len(cp.entries)) + b"".join(cp.entries[1:])

    def members(items):
        return struct.pack(">H", len(items)) + b"".join(
            struct.pack(">HHHH", flags, name_index, descriptor_index, 0)
            for flags, name_index, descriptor_index in items
        )

    return (b"\xca\xfe\xba\xbe" + struct.pack(">HH", 0, 52) + pool +
            struct.pack(">HHH", access, this_class, super_class) +
            struct.pack(">H", len(interface_indexes)) + b"".join(struct.pack(">H", item) for item in interface_indexes) +
            members(field_indexes) + members(method_indexes) + struct.pack(">H", 0))


def write_jar(path, classes):
    with zipfile.ZipFile(path, "w") as archive:
        for name, data in classes.items():
            archive.writestr(name + ".class", data)


def write_aar(path, classes):
    with tempfile.TemporaryDirectory(dir=SCRIPT.parent) as directory:
        nested = Path(directory) / "classes.jar"
        write_jar(nested, classes)
        with zipfile.ZipFile(path, "w") as archive:
            archive.write(nested, "classes.jar")
            archive.writestr("res/values/strings.xml", "<resources/>")


def info(name, **kwargs):
    return prepare.parse_class(class_bytes(name, **kwargs), name)


class PrepareEmbeddedTests(unittest.TestCase):
    def test_primitive_parameters_do_not_hide_following_reference_types(self):
        self.assertEqual(("java/util/List", "java/lang/Long"),
                         prepare._descriptor_classes("(IJLjava/util/List;[Ljava/lang/Long;)V"))

    def test_parser_extracts_hierarchy_descriptors_and_member_references(self):
        parsed = prepare.parse_class(class_bytes(
            "bridge/Root", super_name="bridge/Base", interfaces=("bridge/Face",),
            fields=(("items", "[Ldep/Item;"),), methods=(("make", "()Ldep/Result;"),),
            refs=((10, "host/Api", "send", "(Ldep/Request;)V"),),
        ))
        self.assertEqual("bridge/Base", parsed.super_name)
        self.assertEqual(("bridge/Face",), parsed.interfaces)
        self.assertTrue({"dep/Item", "dep/Result", "dep/Request", "host/Api"}.issubset(parsed.class_refs))
        self.assertEqual(prepare.MemberRef("host/Api", "send", "(Ldep/Request;)V", True), parsed.member_refs[0])

    def test_closure_adds_only_referenced_candidate_classes_and_resolves_inherited_host_method(self):
        root = info("bridge/Root", refs=((10, "dep/Child", "run", "()V"),))
        child = info("dep/Child", super_name="host/Base")
        host_base = info("host/Base", methods=(("run", "()V"),))
        host = {"host/Base": host_base}
        candidates = {"bridge/Root": root, "dep/Child": child, "dep/Unused": info("dep/Unused")}
        selected = prepare.select_and_audit(["bridge/Root"], candidates, host, {"java/lang/Object": info("java/lang/Object", super_name=None)})
        self.assertEqual({"bridge/Root", "dep/Child"}, selected)

    def test_missing_member_on_host_class_fails_even_when_owner_class_exists(self):
        root = info("bridge/Root", refs=((10, "host/Api", "absent", "()V"),))
        host = {"host/Api": info("host/Api", methods=(("present", "()V"),))}
        platform = {"java/lang/Object": info("java/lang/Object", super_name=None)}
        with self.assertRaisesRegex(prepare.AuditError, "Unresolved method host/Api->absent"):
            prepare.select_and_audit(["bridge/Root"], {"bridge/Root": root}, host, platform)

    def test_method_and_field_references_resolve_through_inherited_interfaces(self):
        root = info("bridge/Root", refs=((10, "dep/Child", "run", "()V"),
                                         (9, "dep/Child", "VALUE", "I")))
        child = info("dep/Child", interfaces=("host/Api",))
        api = info("host/Api", methods=(("run", "()V"),), fields=(("VALUE", "I"),), access=0x0601)
        platform = {"java/lang/Object": info("java/lang/Object", super_name=None)}
        selected = prepare.select_and_audit(["bridge/Root"], {"bridge/Root": root, "dep/Child": child},
                                            {"host/Api": api}, platform)
        self.assertEqual({"bridge/Root", "dep/Child"}, selected)

    def test_missing_referenced_class_fails_closed(self):
        root = info("bridge/Root", refs=((10, "missing/Library", "run", "()V"),))
        platform = {"java/lang/Object": info("java/lang/Object", super_name=None)}
        with self.assertRaisesRegex(prepare.AuditError, "Missing referenced classes:.*missing/Library"):
            prepare.select_and_audit(["bridge/Root"], {"bridge/Root": root}, {}, platform)

    def test_missing_resource_class_requires_resource_integration(self):
        root = info("bridge/Root", refs=((9, "com/openbubbles/wear/R$drawable", "icon", "I"),))
        resource_stub = info("com/openbubbles/wear/R$drawable")
        platform = {"java/lang/Object": info("java/lang/Object", super_name=None)}
        with self.assertRaisesRegex(prepare.AuditError, "resource integration is required"):
            prepare.select_and_audit(["bridge/Root"], {"bridge/Root": root,
                                                       "com/openbubbles/wear/R$drawable": resource_stub}, {}, platform)

    def test_conflicting_dependency_class_bytes_fail(self):
        target = {}
        prepare._add_candidates(target, {"dep/Helper": class_bytes("dep/Helper")}, "one.jar")
        with self.assertRaisesRegex(prepare.AuditError, "Conflicting candidate class dep/Helper"):
            prepare._add_candidates(target, {"dep/Helper": class_bytes("dep/Helper", methods=(("different", "()V"),))}, "two.jar")

    def test_malformed_classfile_fails_closed(self):
        with self.assertRaisesRegex(prepare.AuditError, "Malformed classfile"):
            prepare.parse_class(b"not a class")

    def test_builder_emits_deterministic_class_only_closure_and_rejects_host_overlap(self):
        with tempfile.TemporaryDirectory(dir=SCRIPT.parent) as directory:
            root = Path(directory)
            host = root / "host.jar"
            android = root / "android.jar"
            bridge = root / "bridge.aar"
            protocol = root / "protocol.jar"
            wearable = root / "play-services-wearable-19.0.0.aar"
            transitive = root / "extra.jar"
            write_jar(host, {"host/Api": class_bytes("host/Api", methods=(("send", "()V"),))})
            write_jar(android, {"java/lang/Object": class_bytes("java/lang/Object", super_name=None),
                                "android/content/Context": class_bytes("android/content/Context")})
            write_aar(bridge, {"bridge/Root": class_bytes("bridge/Root", refs=((10, "host/Api", "send", "()V"),))})
            write_jar(protocol, {"protocol/Model": class_bytes("protocol/Model")})
            write_aar(wearable, {"wear/Root": class_bytes("wear/Root", refs=((10, "dep/Needed", "go", "()V"),))})
            write_jar(transitive, {"dep/Needed": class_bytes("dep/Needed", methods=(("go", "()V"),)),
                                   "dep/Extra": class_bytes("dep/Extra")})
            out1, out2 = root / "one.jar", root / "two.jar"
            args = (host, android, bridge, protocol, [wearable, transitive])
            count1, hash1 = prepare.build_payload(*args, out1)
            count2, hash2 = prepare.build_payload(*args, out2)
            self.assertEqual(4, count1)
            self.assertEqual((count1, hash1), (count2, hash2))
            self.assertEqual(hashlib.sha256(out1.read_bytes()).hexdigest(), hash1)
            with zipfile.ZipFile(out1) as archive:
                entries = archive.namelist()
                self.assertEqual(sorted(entries), entries)
                self.assertEqual({"bridge/Root.class", "protocol/Model.class", "wear/Root.class", "dep/Needed.class"}, set(entries))
                self.assertTrue(all(archive.getinfo(name).date_time == (1980, 1, 1, 0, 0, 0) for name in entries))

            write_aar(bridge, {"host/Api": class_bytes("host/Api")})
            with self.assertRaisesRegex(prepare.AuditError, "overlaps host"):
                prepare.build_payload(*args, root / "overlap.jar")


if __name__ == "__main__":
    unittest.main()
