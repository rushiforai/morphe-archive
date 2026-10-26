#!/usr/bin/env python3
"""Check a decoded standalone Penguin output. Uses synthetic test options only.
Usage: check_custom_client.py DECODED_APK CLIENT_ID USER_AGENT
"""
from pathlib import Path
import re, sys
root, client, agent = Path(sys.argv[1]), sys.argv[2], sys.argv[3]
# An empty value would make the substring checks below pass trivially.
assert client.strip() and agent.strip(), 'CLIENT_ID and USER_AGENT must be nonempty'
api = next(root.glob('smali*/ml/docilealligator/infinityforreddit/utils/APIUtils.smali')).read_text()
getter = re.search(r'^\.method[^\n]* getId\(\)Ljava/lang/String;.*?^\.end method', api, re.M|re.S).group()
assert ' native ' not in getter and '"'+client+'"' in getter, 'Client ID getter not replaced'
old_agent = 'android:ml.docilealligator.infinityforreddit:8.3.4 (by /u/Hostilenemy)'
text = '\n'.join(p.read_text() for p in root.glob('smali*/**/*.smali'))
assert old_agent not in text, 'Original API user-agent remains'
assert '"'+agent+'"' in text, 'Configured user agent missing'
assert 'Lapp/morphe/extension/infinity/APIUtils;' not in text, 'Unexpected dependency on Breal extension'
print('PASS: standalone client getter and API user-agent, without Breal extension')
