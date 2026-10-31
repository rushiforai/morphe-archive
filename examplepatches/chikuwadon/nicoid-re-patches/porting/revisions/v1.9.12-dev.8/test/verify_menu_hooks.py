#!/usr/bin/env python3
"""Reject menu hooks that read an overwritten Menu argument, including p/v aliases.
This is a focused regression guard, not an ART verifier.
"""
from pathlib import Path
import re,sys
root=Path(sys.argv[1]);failures=[];hooks=0
for f in root.rglob('*.smali'):
 for m in re.finditer(r'(?ms)^\.method[^\n]*onCreateOptionsMenu\(Landroid/view/Menu;\)Z\n(.*?)^\.end method',f.read_text()):
  body=m.group(1);match=re.search(r'\.registers (\d+)',body)
  if not match:continue
  registers=int(match.group(1));overwritten=set()
  def actual(s):return int(s[1:])+(registers-2 if s.startswith('p') else 0)
  for raw in body.splitlines():
   line=raw.strip()
   if 'TabRecovery244;->menu(' in line:
    hooks+=1
    if registers-1 in overwritten or registers-2 in overwritten:failures.append(f.name+': argument overwritten before menu hook')
   # All destination-writing instructions relevant to these native menu methods.
   if re.match(r'(move(?:-result|-exception)?(?:-object|-wide)?|const(?:[/\w-]*)?|[is]get(?:-[\w]+)?|new-instance|new-array|check-cast|or-int/2addr)\s',line):
    dest=re.search(r'\s([pv]\d+)',line)
    if dest:overwritten.add(actual(dest.group(1)))
assert hooks==5,('Expected five refresh hooks',hooks)
if failures:
 print('\n'.join(failures));sys.exit(1)
print('PASS: all five menu hooks read original Activity/Menu arguments')
