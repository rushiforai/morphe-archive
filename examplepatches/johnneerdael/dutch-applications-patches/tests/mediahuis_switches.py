"""Independently preserve DEX switch keys and true executable case targets."""
import re

from mediahuis_emitted import method_source


def switch_semantics(root, cls, sig, removals=()):
    """Parse payload rows as data, never as definitions of executable labels.

    Return case keys and instruction-index targets for each real switch call.
    Remove only owned mutation ranges and proven unreferenced alignment padding.
    Keep this separate from historical instruction hashes and their old parser.
    """
    body = method_source(root, cls, sig)[1]
    instructions, labels, payloads, pending_labels = [], {}, {}, []
    mode, payload, annotations = None, None, 0
    for raw in body.splitlines():
        line = raw.strip().split("    #", 1)[0]
        if line.startswith(".annotation"):
            annotations += 1
        if line.startswith(".end annotation"):
            annotations -= 1
            continue
        if annotations or not line or line.startswith("#"):
            continue
        if mode:
            if line.startswith(".end " + mode):
                mode, payload = None, None
            elif mode == "packed-switch":
                assert re.fullmatch(r":[\w]+", line), (cls, sig, "packed case row", line)
                payload["cases"].append([payload["first"] + len(payload["cases"]), line])
            elif mode == "sparse-switch":
                match = re.fullmatch(r"(-?0x[0-9a-fA-F]+|-?\d+)\s*->\s*(:[\w]+)", line)
                assert match, (cls, sig, "sparse case row", line)
                payload["cases"].append([int(match[1], 0), match[2]])
            # Array payload bytes are data too, so never executable labels/indexes.
            continue
        match = re.fullmatch(r"\.(packed-switch|sparse-switch|array-data)(?: (\S+))?", line)
        if match:
            mode = match[1]
            assert pending_labels, (cls, sig, "payload label")
            payload = {"kind": mode, "index": len(instructions), "cases": []}
            if mode == "packed-switch":
                payload["first"] = int(match[2], 0)
            for label in pending_labels:
                assert label not in payloads
                payloads[label] = payload
                del labels[label]
            pending_labels = []
        elif line.startswith(":"):
            assert line not in labels, (cls, sig, "duplicate executable label", line)
            labels[line] = len(instructions)
            pending_labels.append(line)
        elif not line.startswith("."):
            instructions.append(line)
            pending_labels = []
    assert mode is None, (cls, sig, "unterminated payload")

    switches = []
    for index, line in enumerate(instructions):
        match = re.fullmatch(r"(packed-switch|sparse-switch)\s+[vp]\d+,\s*(:[\w]+)", line)
        if match:
            assert match[2] in payloads, (cls, sig, "missing switch payload")
            data = payloads[match[2]]
            assert data["kind"] == match[1]
            switches.append((index, data))
    padding = None
    if len(instructions) >= 2 and instructions[-1] == "nop":
        terminal = instructions[-2].split()[0]
        no_fallthrough = terminal in {"return", "return-object", "return-wide", "return-void", "throw", "goto", "goto/16", "goto/32"}
        if no_fallthrough and any(data["index"] == len(instructions) and data["kind"] in {"packed-switch", "sparse-switch"} for data in payloads.values()):
            padding = len(instructions) - 1
    removed = list(removals) + ([(padding, 1)] if padding is not None else [])

    def normalize(index):
        assert not any(start <= index < start + count for start, count in removed), (cls, sig, "branch/case enters owned instructions or alignment padding")
        return index - sum(count for start, count in removed if start + count <= index)

    # Protect padding against both direct branches and real switch case entries.
    for line in instructions:
        if line.split()[0].startswith(("if-", "goto")):
            label = line.split()[-1]
            assert label in labels, (cls, sig, "branch target is executable")
            normalize(labels[label])
    result = []
    for index, data in switches:
        cases = []
        for key, label in data["cases"]:
            assert label in labels and labels[label] < len(instructions), (cls, sig, "case target is executable", label)
            cases.append([key, normalize(labels[label])])
        assert len({key for key, _ in cases}) == len(cases), (cls, sig, "unique switch keys")
        result.append({"at": normalize(index), "kind": data["kind"], "cases": cases})
    return result
