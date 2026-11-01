"""Check all five Projectivy 4.73 effects in a real emitted APK decode."""
import argparse
from pathlib import Path
import re
from brabant_smali import canonical
from rtl_vm import Memory, Reference, execute, parse

TARGETS = [
    ("com/spocky/projengmenu/utils/PTUtils", "e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", None),
    ("yg1", "a(Z)V", None),
    ("t7", "c()V", None),
    ("ng1", "a(Ljava/lang/String;)Ljava/net/URL;", "https://firebaseinstallations.googleapis.com/v1/"),
    ("pt3", "a()Ljava/net/URL;", "firebase-settings.crashlytics.com"),
]


def body(root, owner, signature):
    files = list(root.glob("smali*/" + owner + ".smali"))
    assert len(files) == 1, owner
    methods = re.findall(r"^\.method .*?^\.end method", files[0].read_text(), re.M | re.S)
    return next(m for m in methods if m.splitlines()[0].endswith(" " + signature))


APP = "Lcom/spocky/projengmenu/PTApplication;"
OWNER = "com/spocky/projengmenu/PTApplication"
NAMES = {"Disable tracking", "Unlock Premium"}


def verify_state(constructor, setter, unlocked):
    """Execute emitted constructor/setter code against explicit StateFlow boundaries."""
    true, false = Reference(1, "Ljava/lang/Boolean;"), Reference(0, "Ljava/lang/Boolean;")
    memory = Memory(parents={"Ljava/lang/Long;": ("Ljava/lang/Number;",)}, statics={
        "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;": true,
        "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;": false,
        "Lrz0;->a:Ltu0;": Reference({}, "Ltu0;"),
        "Lmj3;->a:Lmj3;": Reference({}, "Lmj3;"),
        "Lmj3;->l:Lfi3;": Reference({}, "Lfi3;"),
    })
    app = Reference({}, APP)
    state = {"timestamp": 0, "updates": []}

    def invoke(method, args):
        if method in {"Landroid/app/Application;-><init>()V", "Lna2;-><init>()V"}:
            return None
        if method == "Lar0;->x(Loj0;Lqj0;)Lqj0;":
            return Reference({}, "Lqj0;")
        if method == "Lqs1;->d(Lqj0;)Laj0;":
            return Reference({}, "Laj0;")
        if method == "Lts1;->a(Ljava/lang/Object;)Llf4;":
            return Reference({"value": args[0].value}, "Llf4;")
        if method == "Lzv4;->c(Llf4;)Liq3;":
            return Reference({"Liq3;->t:Llf4;": args[0]}, "Liq3;")
        if method == "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;":
            return Reference(args[0], "Ljava/lang/Integer;")
        if method == "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;":
            return true if args[0] else false
        if method == "Ljava/lang/Object;->getClass()Ljava/lang/Class;":
            return Reference(args[0].descriptor, "Ljava/lang/Class;")
        if method == "Lfi3;->b(Ljava/lang/Object;)Ljava/lang/Object;":
            return Reference(state["timestamp"], "Ljava/lang/Long;")
        if method == "Ljava/lang/Number;->longValue()J":
            return args[0].value
        if method == "Ljava/lang/System;->currentTimeMillis()J":
            return 2_000_000_000
        if method == "Llf4;->h(Ljava/lang/Object;)V":
            args[0].value["value"] = args[1].value
            state["updates"].append(args[1].value)
            return None
        raise AssertionError("Unexpected Projectivy state boundary: " + method)

    execute(parse(constructor), {"p0": app}, invoke, memory=memory)
    flow = memory.get(app, APP + "->x:Llf4;")
    view = memory.get(app, APP + "->y:Liq3;")
    assert flow.value["value"] == int(not unlocked), "Cold start has wrong premium state"
    assert view.value["Liq3;->t:Llf4;"] is flow, "Premium observers lost their flow"
    other = memory.get(app, APP + "->z:Llf4;")
    assert other.value["value"] == 0
    assert memory.get(app, APP + "->A:Liq3;").value["Liq3;->t:Llf4;"] is other
    # Reuse the same flow across callbacks: paid, unpaid, recent, expired and missing timestamps.
    for locked in (0, 1, 0, 1):
        for timestamp in (0, 1_900_000_000, 1_000_000_000):
            state["timestamp"] = timestamp
            execute(parse(setter), {"p0": app, "p1": locked}, invoke, memory=memory)
            expected = 0 if unlocked else int(locked and (timestamp <= 0 or 2_000_000_000 - timestamp > 691_200_000))
            assert state["updates"][-1] == expected, "Premium update re-locked local features"
            assert flow.value["value"] == expected
            assert memory.get(app, APP + "->x:Llf4;") is flow
    assert len(state["updates"]) == 12


def verify(original, patched, selected):
    assert selected <= NAMES
    for owner, signature, host in TARGETS:
        before = body(original, owner, signature)
        after = body(patched, owner, signature)
        if "Disable tracking" not in selected:
            assert canonical(after).digest() == canonical(before).digest(), "Unselected tracking edit"
        elif host is None:
            assert canonical(before).code[0] != "return-void", "Original already patched"
            assert canonical(after).code[0] == "return-void", owner + " still collects"
        else:
            assert before.count('"' + host + '"') == 1, "Original URL changed"
            expected = before.replace('"' + host + '"', '"localhost"')
            assert canonical(after).digest() == canonical(expected).digest(), owner + " URL edit differs"
    premium = "Unlock Premium" in selected
    ctor = body(original, OWNER, "<init>()V")
    setter = body(original, OWNER, "d(Z)V")
    native = body(original, OWNER, "f()Z")
    actual_ctor = body(patched, OWNER, "<init>()V")
    actual_setter = body(patched, OWNER, "d(Z)V")
    actual_native = body(patched, OWNER, "f()Z")
    assert APP + "->vs(Z)Z" in native
    assert ctor.count("Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;") == 1
    expected_ctor = ctor.replace("Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;", "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;") if premium else ctor
    expected_setter = "const/4 p1, 0x0\n" + setter if premium else setter
    assert canonical(actual_ctor).digest() == canonical(expected_ctor).digest(), "Constructor differs beyond premium initializer"
    assert canonical(actual_setter).digest() == canonical(expected_setter).digest(), "Setter differs beyond premium argument"
    if premium:
        def reject_native(method, args):
            raise AssertionError("Premium bypass still calls native code: " + method)
        assert execute(parse(actual_native), {}, reject_native) == 1
    else:
        assert canonical(actual_native).digest() == canonical(native).digest(), "Unselected premium bypass"
    verify_state(ctor, setter, False)
    verify_state(actual_ctor, actual_setter, premium)
    # Retain the actual feature entry points, including their reads of the same premium-state view.
    for activity in ["ImportThemeActivity", "SetBackgroundActivity", "ToggleParentalControlActivity"]:
        owner = "com/spocky/projengmenu/ui/launcherActivities/" + activity
        files = list(original.glob("smali*/" + owner + ".smali"))
        text = files[0].read_text()
        for method in re.findall(r"^\.method .*?^\.end method", text, re.M | re.S):
            if APP + "->y:Liq3;" not in method:
                continue
            signature = method.splitlines()[0].split()[-1]
            assert canonical(body(patched, owner, signature)).digest() == canonical(method).digest(), "Feature entry point changed"
    print("PASS: Projectivy 4.73", sorted(selected), "tracking, premium bypass, cold start, repeated updates and retained feature gates")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original", type=Path)
    parser.add_argument("patched", type=Path)
    parser.add_argument("--patch", action="append", choices=sorted(NAMES | {"none"}))
    args = parser.parse_args()
    selected = NAMES if args.patch is None else set(args.patch) - {"none"}
    verify(args.original, args.patched, selected)
