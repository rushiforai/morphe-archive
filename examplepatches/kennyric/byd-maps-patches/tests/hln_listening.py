"""Verify HLN's loading guard and preserve its complete original listening path.

Pins include control flow, switch targets, catches, access flags and locals.
They are captured from the supplied publisher APK, never a patched artifact.
"""
import json
from pathlib import Path
import re

from ad_onboarding import digest, method, source

CONTROL = 'Hide empty listening carousel'
RENDERER = ('s09', 'k(Lix;IZLxe7;ZLtg3;I)V')
ORIGINALS = json.loads(Path(__file__).with_name('hln_listening_originals.json').read_text())


def array_payloads(text):
    # The shared CFG parser handles switch maps, but omits array-data values.
    return [[int(width), [line.split('#', 1)[0].strip() for line in body.splitlines()
                         if line.strip() and not line.strip().startswith(('.', '#'))]]
            for width, body in re.findall(r'^\s*\.array-data (\d+)\n(.*?)^\s*\.end array-data',
                                          text, re.M | re.S)]


def original_body(m, enabled):
    if not enabled:
        return m.canonical()
    prefix = [re.sub(r'\bp(\d+)\b', lambda match: 'v' + str(m.locals + int(match[1])), line)
              for line in m.instructions[:2]]
    assert prefix[0].startswith('if-eqz v24, :'), 'HLN guard must test only loading p4'
    assert prefix[1] == 'return-void', 'HLN loading cards must return before Compose'
    label = prefix[0].rsplit(', ', 1)[1]
    assert m.labels[label] == 2, 'HLN real history must enter the first original instruction'
    return m.canonical(remove={0, 1})


def verify_listening(root, selected):
    for cls, expected in ORIGINALS['arrays'].items():
        assert array_payloads(source(root, cls)) == expected, f'HLN listening array data changed: {cls}'
    for cls, signature, expected in ORIGINALS['methods']:
        m = method(root, cls, signature)
        body = original_body(m, CONTROL in selected) if (cls, signature) == RENDERER else m.canonical()
        assert digest(body) == expected, f'HLN listening behavior changed: {cls}->{signature}'
