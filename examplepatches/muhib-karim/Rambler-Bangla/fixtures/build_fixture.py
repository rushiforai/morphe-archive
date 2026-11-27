#!/usr/bin/env python3
"""Generate fixture smali + fixture profile from strings.json (single source)."""
import hashlib
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))


def smali_escape(s):
    out = []
    for ch in s:
        if ch == "\\":
            out.append("\\\\")
        elif ch == '"':
            out.append('\\"')
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\t":
            out.append("\\t")
        else:
            out.append(ch)
    return "".join(out)


def sha(s):
    return hashlib.sha256(s.encode("utf-8")).hexdigest()


def main():
    strings = json.load(open(os.path.join(HERE, "strings.json"), encoding="utf-8"))
    prompt = strings["fixture_big_prompt"]
    rule = strings["fixture_stock_rule"]
    langs = strings["fixture_enabled_languages"]

    src = os.path.join(HERE, "src")
    os.makedirs(src, exist_ok=True)

    kfd = """.class public Lkfd;
.super Ljava/lang/Object;

# Fixture stand-in for the stock cleanup builder:
#   Lkfd;->d(Lhrl;Ljava/lang/String;ILqqi;Laebb;Ljava/lang/String;
#            Laugd;Ljava/util/concurrent/atomic/AtomicBoolean;)V
# p1 plays the role of the cleanup prompt assembled by the caller.
.method public static d(Lhrl;Ljava/lang/String;ILqqi;Laebb;Ljava/lang/String;Laugd;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 3

    const-string v1, "{ENABLED_LANGUAGES}"
    const-string v2, "%s"
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "{HINGLISH_OVERRIDE_RULE}"
    const-string v2, "%s"
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v0

    invoke-static {v0}, Lkew;->a(Ljava/lang/String;)V
    return-void
.end method
""" % (smali_escape(langs), smali_escape(rule))

    kew = """.class public Lkew;
.super Ljava/lang/Object;

# Fixture stand-in for the stock prompt owner: Lkew;->b(Ljava/lang/Object;)V
.method public static b(Ljava/lang/Object;)V
    .locals 1

    const-string/jumbo v0, "%s"
    invoke-static {v0}, Lkew;->a(Ljava/lang/String;)V
    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 0
    return-void
.end method
""" % smali_escape(prompt)

    stubs = {"Lhrl;": "hrl", "Lqqi;": "qqi", "Laebb;": "aebb", "Laugd;": "augd"}
    stub = ".class public %s\n.super Ljava/lang/Object;\n"

    with open(os.path.join(src, "kfd.smali"), "w", encoding="utf-8") as fh:
        fh.write(kfd)
    with open(os.path.join(src, "kew.smali"), "w", encoding="utf-8") as fh:
        fh.write(kew)
    for cls, fn in stubs.items():
        with open(os.path.join(src, fn + ".smali"), "w", encoding="utf-8") as fh:
            fh.write(stub % cls)

    profile = {
        "profile": "fixture-v1",
        "note": "Self-built synthetic fixture. Mirrors the documented 18.3.1 "
                "anchors with authored test strings; proves the patching "
                "pipeline end-to-end without any Google bytes.",
        "methods": {
            "cleanup_builder": {
                "class": "Lkfd;", "name": "d",
                "signature": "(Lhrl;Ljava/lang/String;ILqqi;Laebb;"
                             "Ljava/lang/String;Laugd;"
                             "Ljava/util/concurrent/atomic/AtomicBoolean;)V",
            },
            "prompt_owner": {
                "class": "Lkew;", "name": "b", "signature": "(Ljava/lang/Object;)V",
            },
        },
        "fingerprints": {
            "hinglish_override_rule": {"sha256": sha(rule),
                                       "bytes": len(rule.encode("utf-8"))},
            "lite_cleanup_prompt": {"sha256": sha(prompt),
                                    "bytes": len(prompt.encode("utf-8"))},
        },
        "anchors": {
            "enabled_languages_placeholder": "{ENABLED_LANGUAGES}",
            "hinglish_placeholder": "{HINGLISH_OVERRIDE_RULE}",
        },
        "extension_class": ("Lcom/akshaykadam/pixelboard/extension/ramblerlite/"
                            "GboardRamblerLiteScriptRuntime;"),
    }
    with open(os.path.join(HERE, "fixture-profile.json"), "w",
              encoding="utf-8") as fh:
        json.dump(profile, fh, indent=2, ensure_ascii=False)
    print("fixture sources + profile generated")
    print("  rule sha256:   %s" % profile["fingerprints"]["hinglish_override_rule"]["sha256"])
    print("  prompt sha256: %s" % profile["fingerprints"]["lite_cleanup_prompt"]["sha256"])


if __name__ == "__main__":
    main()
