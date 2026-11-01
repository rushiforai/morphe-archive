#!/usr/bin/env python3
"""Generate a narrow compile-only view of the pinned app ABI from decoded DEX."""
import re
import argparse
import hashlib
import json
from pathlib import Path

MODEL_ROOTS = [
    "com/medium/android/graphql/fragment/ParagraphData$Iframe",
    "com/medium/android/graphql/fragment/IframeData",
    "com/medium/android/graphql/fragment/IframeData$MediaResource",
    "com/medium/android/graphql/fragment/MediaResourceData",
    "com/medium/android/graphql/FullPostQuery$Data", "com/medium/android/graphql/FullPostQuery$Post",
    *["com/medium/android/graphql/fragment/" + name for name in [
        "FullPostData", "FullPostData$Content", "FullPostData$BodyModel", "PostBodyData",
        "PostBodyData$Paragraph", "PostBodyData$Section", "ParagraphData", "ParagraphData$Metadata",
        "ParagraphData$Markup", "ParagraphData$CodeBlockMetadata", "MarkupData", "ImageMetadataData", "SectionData",
        "PostMetaData",
    ]],
]

ABI_CLASSES = {
    "qye": (["a(Ljava/lang/Object;Lyl2;)Ljava/lang/Object;"], {}),
    "k7b": (["<init>(Ljava/lang/String;)V"], {}),
    "jd5": (["b(Lld5;Lyl2;)Ljava/lang/Object;"], {}),
    "ld5": (["a(Ljava/lang/Object;Lyl2;)Ljava/lang/Object;"], {}),
    "yl2": (["getContext()Lho2;", "resumeWith(Ljava/lang/Object;)V"], {}),
    "ho2": (["k0(Lho2;)Lho2;"], {}),
    "h16": ([], {}),
    "z06": (["invoke(Ljava/lang/Object;)Ljava/lang/Object;"], {"interfaces": ["h16"]}),
    "l16": ([], {"interfaces": ["h16"]}),
    "cr0": (["<init>(Lyl2;)V", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", "resumeWith(Ljava/lang/Object;)V"], {"interfaces": ["yl2"]}),
    "am2": (["<init>(Lyl2;)V", "getContext()Lho2;"], {"superclass": "cr0", "parent_argument": 0}),
    "ra1": (["<init>(ILyl2;)V", "r()V", "t(Lz06;)V", "p()Ljava/lang/Object;", "c(Ljava/lang/Object;Ll16;)Ld4j;", "A(Ljava/lang/Object;)V"], {}),
    "ppk": (["H(Lyl2;)Lyl2;"], {}),
    "d4j": ([], {}),
    "no6": (["<init>(Landroid/os/Handler;)V"], {}),
    "pa2": (["<init>()V"], {}),
    "rm7": (["l(Ljava/util/concurrent/CancellationException;)V", "isCancelled()Z"], {}),
}


def descriptor_types(descriptor):
    result = []
    offset = 0
    while offset < len(descriptor):
        start = offset
        while offset < len(descriptor) and descriptor[offset] == "[":
            offset += 1
        if offset >= len(descriptor):
            raise ValueError("Truncated array descriptor")
        if descriptor[offset] == "L":
            end = descriptor.find(";", offset)
            if end < 0:
                raise ValueError("Unterminated class descriptor")
            offset = end + 1
        elif descriptor[offset] in "VZBSCIJFD":
            offset += 1
        else:
            raise ValueError("Invalid descriptor")
        result.append(descriptor[start:offset])
    return result


def java_type(descriptor):
    if descriptor.startswith("["):
        return java_type(descriptor[1:]) + "[]"
    if descriptor.startswith("L") and descriptor.endswith(";"):
        return descriptor[1:-1].replace("/", ".")
    return {"V": "void", "Z": "boolean", "B": "byte", "S": "short", "C": "char", "I": "int",
            "J": "long", "F": "float", "D": "double"}[descriptor]


def parse_class(source):
    declaration = re.search(r"^\.class\s+(.+?)\s+(L[^;]+;)$", source, re.MULTILINE)
    if not declaration:
        raise ValueError("Missing class declaration")
    result = {"descriptor": declaration.group(2), "flags": declaration.group(1).split(), "fields": {}, "methods": []}
    for field in re.finditer(r"^\.field\s+(.+?)\s+([^\s:]+):(\S+?)(?:\s+=.*)?$", source, re.MULTILINE):
        result["fields"][field.group(2)] = {"flags": field.group(1).split(), "type": field.group(3)}
    for method in re.finditer(r"^\.method\s+([^\n]+)\n(.*?)^\.end method", source, re.MULTILINE | re.DOTALL):
        flags, signature = method.group(1).rsplit(" ", 1)
        name, rest = signature.split("(", 1)
        arguments, returns = rest.split(")", 1)
        parameters = descriptor_types(arguments)
        member = {"name": name, "parameters": parameters, "returns": returns, "flags": flags.split(),
                  "assignments": {}, "nonnull": [], "field": None}
        registers = {"p0": -1}
        slot = 1
        for index, parameter in enumerate(parameters):
            registers["p" + str(slot)] = index
            slot += 2 if parameter in ("D", "J") else 1
        for line in method.group(2).splitlines():
            move = re.search(r"\bmove(?:-object|-wide)?(?:/from16|/16)?\s+(\w+),\s*(\w+)", line)
            if move:
                if move.group(2) in registers:
                    registers[move.group(1)] = registers[move.group(2)]
                else:
                    registers.pop(move.group(1), None)
            check = re.search(r"invoke-virtual\s+\{(\w+)\}, Ljava/lang/Object;->getClass\(", line)
            if check and registers.get(check.group(1), -1) >= 0:
                member["nonnull"].append(registers[check.group(1)])
            assignment = re.search(r"iput(?:-[a-z]+)?\s+(\w+),\s*(\w+),\s*(L[^;]+;)->([^:]+):", line)
            if assignment and assignment.group(3) == result["descriptor"] and registers.get(assignment.group(2)) == -1:
                parameter = registers.get(assignment.group(1), -1)
                if parameter >= 0:
                    member["assignments"][assignment.group(4)] = parameter
            getter = re.search(r"iget(?:-[a-z]+)?\s+\w+,\s*\w+,\s*(L[^;]+;)->([^:]+):(\S+)", line)
            if getter and getter.group(1) == result["descriptor"] and getter.group(3) == returns and not parameters:
                member["field"] = getter.group(2)
        member["nonnull"] = sorted(set(member["nonnull"]))
        result["methods"].append(member)
    return result


def model_source(model):
    package, _, name = model["descriptor"][1:-1].rpartition("/")
    lines = ["// Generated compile-only ABI view. Never include this definition in the extension."]
    if package:
        lines.append("package " + package.replace("/", ".") + ";")
    if "enum" in model["flags"]:
        constants = [name for name, item in model["fields"].items() if "enum" in item["flags"] and "static" in item["flags"]]
        if not constants:
            raise ValueError("Enum has no constants")
        lines.append("public enum " + name + " { " + ", ".join(constants) + " }")
        return "\n".join(lines) + "\n"
    fields = {name: item for name, item in model["fields"].items() if "static" not in item["flags"]}
    constructors = [method for method in model["methods"] if method["name"] == "<init>" and
                    "public" in method["flags"] and ("synthetic" not in method["flags"] or model.get("allow_synthetic_constructor")) and
                    set(method["assignments"]) == set(fields)]
    lines.append("public " + ("final " if "final" in model["flags"] else "") + "class " + name + " {")
    for field, item in fields.items():
        visibility = "public" if "public" in item["flags"] else "private"
        lines.append("    " + visibility + " " + ("final " if constructors else "") + java_type(item["type"]) + " " + field + ";")
    if not constructors:
        lines.append("    private " + name + "() { }")
    for constructor in constructors:
        params = ", ".join(java_type(item) + " arg" + str(i) for i, item in enumerate(constructor["parameters"]))
        lines.append("    public " + name + "(" + params + ") {")
        for index in constructor["nonnull"]:
            lines.append("        java.util.Objects.requireNonNull(arg" + str(index) + ");")
        for field, index in constructor["assignments"].items():
            lines.append("        this." + field + " = arg" + str(index) + ";")
        lines.append("    }")
    for method in model["methods"]:
        field = method["field"]
        if field in fields and "public" in method["flags"] and method["name"].startswith(("get", "is")):
            lines.append("    public " + java_type(method["returns"]) + " " + method["name"] + "() { return this." + field + "; }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def abi_source(model, signatures, superclass="java/lang/Object", interfaces=(), parent_argument=None):
    package, _, name = model["descriptor"][1:-1].rpartition("/")
    lines = ["// Generated compile-only coroutine ABI. No runtime implementation is provided here."]
    if package:
        lines.append("package " + package.replace("/", ".") + ";")
    methods = []
    for signature in signatures:
        matches = [item for item in model["methods"] if item["name"] + "(" + "".join(item["parameters"]) + ")" + item["returns"] == signature]
        if len(matches) != 1:
            raise ValueError("Missing or ambiguous ABI method: " + model["descriptor"] + signature)
        methods.append(matches[0])
    is_interface = "interface" in model["flags"]
    declaration = "public " + ("interface " if is_interface else ("abstract " if "abstract" in model["flags"] else "") + "class ") + name
    if not is_interface and superclass != "java/lang/Object":
        declaration += " extends " + superclass.replace("/", ".")
    if interfaces:
        declaration += (" extends " if is_interface else " implements ") + ", ".join(item.replace("/", ".") for item in interfaces)
    lines.append(declaration + " {")
    if not is_interface and not any(item["name"] == "<init>" for item in methods):
        lines.append("    private " + name + "() { }")
    for method in methods:
        params = ", ".join(java_type(value) + " arg" + str(index) for index, value in enumerate(method["parameters"]))
        if method["name"] == "<init>":
            lines.append("    public " + name + "(" + params + ") {")
            if parent_argument is not None:
                lines.append("        super(arg" + str(parent_argument) + ");")
            lines.append('        throw new UnsupportedOperationException("Compile-only app ABI");\n    }')
            continue
        declaration = "    public "
        if "static" in method["flags"]:
            declaration += "static "
        elif "final" in method["flags"] and not is_interface:
            declaration += "final "
        declaration += java_type(method["returns"]) + " " + method["name"] + "(" + params + ")"
        lines.append(declaration + (";" if is_interface else ' { throw new UnsupportedOperationException("Compile-only app ABI"); }'))
    lines.append("}")
    return "\n".join(lines) + "\n"


def generate(smali, output, manifest):
    models = {}

    def load(descriptor):
        paths = list(smali.glob("smali*/" + descriptor[1:-1] + ".smali"))
        if len(paths) != 1:
            raise ValueError("Expected one original class: " + descriptor)
        source = paths[0].read_text()
        parsed = parse_class(source)
        parsed["source_sha256"] = hashlib.sha256(source.encode()).hexdigest()
        return parsed

    for name in MODEL_ROOTS:
        descriptor = "L" + name + ";"
        parsed = load(descriptor)
        parsed["mode"] = "model"
        models[descriptor] = parsed
    for name in ["l0e", "m0e", "s4b"]:
        descriptor = "L" + name + ";"
        parsed = load(descriptor)
        parsed["mode"] = "model"
        parsed["allow_synthetic_constructor"] = name == "m0e"
        models[descriptor] = parsed
    for name, (signatures, options) in ABI_CLASSES.items():
        descriptor = "L" + name + ";"
        parsed = load(descriptor)
        parsed.update({"mode": "abi", "selected_signatures": signatures, "abi_options": options})
        models[descriptor] = parsed
    for name in ["so2", "tzg"]:
        descriptor = "L" + name + ";"
        parsed = load(descriptor)
        parsed["mode"] = "singleton" if name == "tzg" else "enum"
        models[descriptor] = parsed
    references = set()
    for model in models.values():
        if model["mode"] != "model":
            continue
        for field in model["fields"].values():
            if "static" not in field["flags"]:
                references.add(field["type"].lstrip("["))
    for descriptor in sorted(references):
        if descriptor in models or not descriptor.startswith("L") or descriptor.startswith(("Ljava/", "Landroid/")):
            continue
        original = load(descriptor)
        if "enum" in original["flags"]:
            original["mode"] = "enum"
            models[descriptor] = original
        else:
            models[descriptor] = {"descriptor": descriptor, "mode": "opaque", "flags": original["flags"],
                                  "fields": {}, "methods": [], "source_sha256": original["source_sha256"]}
    for model in models.values():
        path = output / (model["descriptor"][1:-1] + ".java")
        path.parent.mkdir(parents=True, exist_ok=True)
        if model["mode"] == "abi":
            source = abi_source(model, model["selected_signatures"], **model["abi_options"])
        elif model["mode"] == "singleton":
            name = model["descriptor"][1:-1]
            source = "// Compile-only singleton field ABI.\npublic final class " + name + " { public static final " + name + " a = new " + name + "(); private " + name + "() {} }\n"
        else:
            source = model_source(model)
        path.write_text(source)
    manifest.parent.mkdir(parents=True, exist_ok=True)
    manifest.write_text(json.dumps({"target_package": "com.medium.reader", "target_version": "4.5.1784911033",
                                    "purpose": "Compile-only consumed ABI view; never bundle into extension",
                                    "classes": models}, indent=2) + "\n")
    return len(models)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--smali", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()
    print("Generated", generate(args.smali, args.output, args.manifest), "compile-only ABI classes")
