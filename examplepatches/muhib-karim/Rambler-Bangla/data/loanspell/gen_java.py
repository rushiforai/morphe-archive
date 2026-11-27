# Regenerates GboardRamblerLoanTable.java from data/loanspell/loan-table.tsv and the OVERRIDE block in GboardRamblerLoanSpell.java from data/loanspell/overrides.tsv.
import re
D='extension-src/com/akshaykadam/pixelboard/extension/rambler/'
def jesc(s): return ''.join('\\n' if c=='\n' else '\\t' if c=='\t' else c if 32<=ord(c)<127 and c not in '"\\' else '\\u%04x'%ord(c) for c in s)
rows=[l.rstrip('\n') for l in open('data/loanspell/loan-table.tsv')]
chunks=[];cur=[];size=0
for r in rows:
    b=len(r.encode())+1
    if size+b>60000: chunks.append(cur);cur=[];size=0
    cur.append(r);size+=b
chunks.append(cur)
o=['package com.akshaykadam.pixelboard.extension.rambler;','','/** Generated table: English word -> Bangla loan spelling, rows "word\\tbangla\\n". Spellings are produced by a rule mapper from CMU Pronouncing Dictionary pronunciations (BSD licence; see NOTICE). */','final class GboardRamblerLoanTable {','  private GboardRamblerLoanTable() {}']
for i,c in enumerate(chunks): o.append(f'  static String c{i}() {{ return "{jesc(chr(10).join(c)+chr(10))}"; }}')
o.append('  static String[] chunks() { return new String[] {'+', '.join(f'c{i}()' for i in range(len(chunks)))+'}; }'); o.append('}')
open(D+'GboardRamblerLoanTable.java','w').write('\n'.join(o)+'\n')
ov=[l.rstrip('\n').split('\t') for l in open('data/loanspell/overrides.tsv') if l.strip()]
body=',\n      '.join(f'"{w}", "{jesc(b)}"' for w,b in ov)
p=D+'GboardRamblerLoanSpell.java'; s=open(p).read()
s2=re.sub(r'(OVERRIDE = map\(\n      ).*?(\);)', lambda m: m.group(1)+body+m.group(2), s, count=1, flags=re.S)
assert s2!=s or body in s; open(p,'w').write(s2); print('rows',len(rows),'chunks',len(chunks),'ov',len(ov))
