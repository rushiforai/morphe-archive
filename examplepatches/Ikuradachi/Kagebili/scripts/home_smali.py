"""Bounded evaluator for emitted Bstation 3.83.1 Home helpers; no Android runtime claim."""
import re

PAGER, TABS, SEARCH = 0x7F0A0B23, 0x7F0A0FC8, 0x7F0A0E34


def method(text, name):
    matches = re.findall(r"(?ms)^\.method [^\n]* " + re.escape(name) + r"\([^\n]*\n.*?^\.end method", text)
    assert len(matches) == 1, (name, len(matches))
    return matches[0]


def code(text, labels=True):
    return [s for line in text.splitlines() if (s := line.strip()) and not s.startswith((".", "#"))
            and (labels or not s.startswith(":"))]


def instance_of(value, typename):
    view_types = {
        'Landroid/widget/FrameLayout;', 'Landroidx/viewpager2/widget/ViewPager2;',
        'Lcom/bilibili/magicasakura/widgets/TintFrameLayout;',
        'Lcom/bilibili/magicasakura/widgets/TintLinearLayout;',
    }
    return isinstance(value, dict) and (value.get('type') == typename or
        (typename == 'Landroid/view/View;' and value.get('type') in view_types))


def run(body, state, hide_body, registers=None):
    """Interpret only helper opcodes; native setters/getters use explicit mocks."""
    lines = code(body)
    labels = {line: i for i, line in enumerate(lines) if line.startswith(":")}
    regs, result, pc = (registers or {"p0": state}), None, 0
    for _ in range(200):
        line = lines[pc]
        pc += 1
        if line.startswith(":"):
            continue
        if line == "return-void":
            return
        if line.startswith("if-eqz "):
            reg, label = line[7:].split(", ")
            if regs[reg] is None or regs[reg] == 0:
                pc = labels[label]
        elif line.startswith(("if-eq ", "if-ne ")):
            op, rest = line.split(" ", 1)
            a, b, label = rest.split(", ")
            if (regs[a] == regs[b]) == (op == "if-eq"):
                pc = labels[label]
        elif line.startswith("const"):
            _, rest = line.split(" ", 1)
            reg, value = rest.split(", ")
            regs[reg] = int(value, 0)
        elif line.startswith("move-result"):
            regs[line.split()[1]] = result
        elif line.startswith("instance-of "):
            a, b, typename = line[12:].split(", ")
            regs[a] = instance_of(regs[b], typename)
        elif line.startswith("check-cast "):
            reg, typename = line[11:].split(", ")
            assert instance_of(regs[reg], typename)
        elif line.startswith("iget-boolean "):
            a, b, _ = line[13:].split(", ")
            regs[a] = regs[b]["hidden"]
        elif line.startswith("iput-boolean "):
            a, b, _ = line[13:].split(", ")
            regs[b]["hidden"] = bool(regs[a])
        elif line.startswith("invoke-static "):
            match = re.fullmatch(r"invoke-static \{(v\d+)\}, .*;->hideHomeSearchBar\(Landroid/view/View;\)V", line)
            assert match, line
            run(hide_body, state, hide_body, {"p0": regs[match[1]]})
        elif line.startswith("invoke-virtual "):
            match = re.match(r"invoke-virtual \{([^}]+)\}, .*;->([^ (]+)\(", line)
            args = [regs[r] for r in match[1].split(", ")]
            obj, name = args[0], match[2]
            if name == "getView":
                result = obj["root"]
            elif name == "findViewById":
                result = obj["views"].get(args[1])
            elif name == "getAdapter":
                result = obj["adapter"]
            elif name == "getItemCount":
                result = obj["count"]
            elif name == "getVisibility":
                result = obj["visibility"]
            elif name == "getParent":
                result = obj["parent"]
            elif name == "setVisibility":
                obj["visibility"] = args[1]
                state["events"].append((obj["name"], args[1]))
            elif name == "n7":
                state["events"].append(("select", args[1]))
                if state["nativeSync"]:
                    state["stored"] = args[1]
            elif name == "O6":
                result = state["stored"]
            elif name == "a7":
                state["events"].append(("callback", args[1]))
                state["stored"] = args[1]
            else:
                raise AssertionError(line)
        else:
            raise AssertionError(line)
    raise AssertionError("helper did not terminate")


def state(count=1, visibility=0, stored=0, native_sync=False):
    adapter = {"count": count}
    pager = {"type": "Landroidx/viewpager2/widget/ViewPager2;", "adapter": adapter}
    tabs = {"type": "Landroid/widget/FrameLayout;", "name": "tabs", "visibility": visibility}
    parent = {"type": "Lcom/bilibili/magicasakura/widgets/TintFrameLayout;", "name": "parent", "visibility": 8}
    search = {"type": "Lcom/bilibili/magicasakura/widgets/TintLinearLayout;", "name": "search", "visibility": 8, "parent": parent}
    return {"root": {"views": {PAGER: pager, TABS: tabs, SEARCH: search}}, "hidden": False,
            "events": [], "stored": stored, "nativeSync": native_sync}
