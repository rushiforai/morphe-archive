"""Run with python3 scripts/test_rustore_upstream.py; no APK or Android SDK needed."""

import argparse
import copy
import json
import tempfile
from pathlib import Path

from rustore_upstream import inventory_diff, promote, readable_packages, verify_device_identifier_stub, verify_google_ad_id_stub, verify_instruction_prefix, push_service_cleanup_prefix


def main() -> None:
    unit_stub = ["sget-object v0, Ltt0/e0;->a:Ltt0/e0;", "return-object v0"]
    for expected in (unit_stub, ["return-void"], push_service_cleanup_prefix()):
        code = (".method public test\n.registers 4\n"
                ".annotation system Ldalvik/annotation/Signature;\n"
                'value = { "Ljava/util/List;" }\n.end annotation\n' + "\n".join(expected))
        verify_instruction_prefix(code, expected, "telemetry")
        for broken in ("invoke-static {}, Lsdk;->send()V\n" + code, "return-object v1",
                       code.replace(expected[0], "return-void", 1) if len(expected) > 1 else "nop"):
            try:
                verify_instruction_prefix(broken, expected, "telemetry")
            except RuntimeError:
                pass
            else:
                raise AssertionError("Active or invalid telemetry stub passed")
    info = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;"
    stub = f'''\n.method public static getAdvertisingIdInfo
    .registers 17
    new-instance v0, {info}
    const-string v1, "00000000-0000-0000-0000-000000000000"
    const/4 v2, 0x1
    invoke-direct {{v0, v1, v2}}, {info}-><init>(Ljava/lang/String;Z)V
    return-object v0
    '''
    verify_google_ad_id_stub(stub)
    for broken in (stub.replace("0x1", "0x0"), "invoke-static {}, Lsdk;->init()V\n" + stub):
        try:
            verify_google_ad_id_stub(broken)
        except RuntimeError:
            pass
        else:
            raise AssertionError("Invalid or late advertising-ID stub passed")
    device_stub = ('\n.method public static a\n    .registers 3\n'
                   '    const-string v0, "00000000-0000-0000-0000-000000000000"\n'
                   '    return-object v0\n')
    verify_device_identifier_stub(device_stub, "device identifier")
    for broken in ("invoke-static {}, Lsdk;->read()Ljava/lang/String;\n" + device_stub,
                   device_stub.replace("00000000-0000-0000", "11111111-1111-1111")):
        try:
            verify_device_identifier_stub(broken, "device identifier")
        except RuntimeError:
            pass
        else:
            raise AssertionError("Invalid device-identifier stub passed")
    baseline = {
        "apk_sha256": "audited-apk",
        "native_libraries": {
            "lib/arm64-v8a/libbridge_helper.so": "reviewed-code",
            "lib/arm64-v8a/libplain.so": "other-library",
        },
        "manifest_components": ["service:com.vk.push.ExistingService"],
        "readable_packages": ["com.vk.push"],
    }
    assert not inventory_diff(baseline, copy.deepcopy(baseline))["review_required"]
    for field, addition in (
        ("manifest_components", "service:com.vk.push.VkpnsWorkerService"),
        ("readable_packages", "com.newvendor.tracker"),
    ):
        changed = copy.deepcopy(baseline)
        changed[field].append(addition)
        assert inventory_diff(baseline, changed)["review_required"], field
    for name in baseline["native_libraries"]:
        changed = copy.deepcopy(baseline)
        del changed["native_libraries"][name]
        assert inventory_diff(baseline, changed)["review_required"], name
    changed = copy.deepcopy(baseline)
    changed["native_libraries"]["lib/x86_64/libbridge_helper.so"] = "new-abi"
    assert inventory_diff(baseline, changed)["review_required"]
    changed = copy.deepcopy(baseline)
    changed["native_libraries"]["lib/arm64-v8a/libbridge_helper.so"] = "changed-outside-patch"
    assert inventory_diff(baseline, changed)["review_required"]
    changed = copy.deepcopy(baseline)
    changed["native_libraries"]["lib/arm64-v8a/libplain.so"] = "ordinary-rebuild"
    diff = inventory_diff(baseline, changed)
    assert not diff["review_required"]
    assert diff["native_libraries"]["changed"] == ["lib/arm64-v8a/libplain.so"]
    assert readable_packages(
        "P d 1\t2\t3\tcom.vk\nP d 1 2 3 a42\nC d 1 2 3 com.vk.Class\n"
        "P d 4 5 6 com.vk\nP d 1 2 3 io.newvendor\n"
    ) == ["com.vk", "io.newvendor"]
    try:
        readable_packages("changed tool output")
    except RuntimeError:
        pass
    else:
        raise AssertionError("Unparseable package output must fail closed")

    # A valid inventory from another APK must not authorize promotion.
    with tempfile.TemporaryDirectory() as directory:
        root = Path(directory)
        data = {
            "metadata": {}, "inspection": {"sha256": "different-apk"},
            "state": {}, "baseline": baseline, "inventory": baseline,
        }
        for name, value in data.items():
            (root / name).write_text(json.dumps(value), encoding="utf-8")
        constants = root / "constants"
        constants.write_text('const val AUDITED_VERSION = "old"', encoding="utf-8")
        args = argparse.Namespace(
            **{name: root / name for name in data}, constants=constants, github_output=None,
        )
        try:
            promote(args)
        except RuntimeError as error:
            assert "different APKs" in str(error)
        else:
            raise AssertionError("Mismatched inventory authorized promotion")
        assert constants.read_text() == 'const val AUDITED_VERSION = "old"'
        assert (root / "state").read_text() == "{}"
        (root / "inspection").write_text(json.dumps({
            "sha256": "audited-apk", "version_name": "new",
        }))
        unreviewed = copy.deepcopy(baseline)
        unreviewed["manifest_components"].append("service:com.vk.push.NewService")
        (root / "inventory").write_text(json.dumps(unreviewed))
        try:
            promote(args)
        except RuntimeError as error:
            assert "unreviewed inventory" in str(error)
        else:
            raise AssertionError("Unreviewed component authorized promotion")
        assert constants.read_text() == 'const val AUDITED_VERSION = "old"'
        assert (root / "state").read_text() == "{}"
        (root / "inventory").write_text(json.dumps(baseline))
        (root / "metadata").write_text(json.dumps({
            "url": "https://example.invalid/app.apk", "content_length": 1,
            "etag": "reviewed", "last_modified": "reviewed",
        }))
        promote(args)
        assert constants.read_text() == 'const val AUDITED_VERSION = "new"'
        assert json.loads((root / "state").read_text())["apk"]["sha256"] == "audited-apk"
        assert json.loads((root / "baseline").read_text()) == baseline
    print("Inventory review gates passed")


if __name__ == "__main__":
    main()
