# V29 named fixtures - intended output changes vs v28d (loop-review record)

Gate: zero segment-lock DECISION changes on the v28d regression corpus except the
fixtures named here. "Decision change" = a segment that stayed Latin under v28d
converting under V29, or vice versa. Spelling changes inside already-locked Bangla
segments are Tier-1 emission changes, not decision changes.

## A. Tier-1 spelling emission (15 battery cases + 3 adversarial + 3 matrix + 4 driver + 2 hardening)
All inside segments that locked Bangla under BOTH builds. Before -> after:
office অফফিকে->অফিস, lunch লুনচ->লাঞ্চ, project প্রযেকত->প্রোজেক্ট, bus বুস->বাস,
call কালল->কল, and আনড->অ্যান্ড, samsung সামসুং->স্যামসাঙ, phone ফনে->ফোন,
site সিটে->সাইট, mail মাইল->মেইল, next নেকস্ত->নেক্সট, thikmoto থিকমতো->ঠিকমত,
keyboard কিবোর্ড->কীবোর্ড, type টয়পে->টাইপ, english এংলিশ->ইংলিশ, taratari তাড়়াতাড়়ি->তাড়াতাড়ি.
Cases: battery [long-multi x3, rapid x1, h6-init, h6-final, entities x3, protected,
homograph x2, floor-bn x2], adversarial [A, D1, D2], matrix [3], driver 19-line [4],
hardening [H-homographs, H-time]. Lock decisions byte-identical in every case.

## B. A2 garble demotion (the field-incident fix)
Named fixtures where v28d LOCKED and V29 correctly stays English:
1. "rigarding the rambler bangla project is it in the profeshional github repo"
   v28d: ঋগারদিং থে রাম্বলের বাংলা project is it in the প্রফেশিওনাল গিথুব রেপো
   v29 : unchanged (rigarding/profeshional demoted, rambler/github/repo <3 strong)
2. "so hwen i'm in bilingual keyboard it's autputted the whole ting in bangla"
   v28d: (locks when garble density >=3 strong)  v29: unchanged (hwen/ting allowlist, autputted allowlist)
3. "outputted" alone: v28d ঔতপুত্তেদ -> v29 unchanged (morphology: outputted->output, English)
4. "i outputted the file and stopped the running process": v29 all English (stopped->stop, running->run)

## C. Demotion measurement (published collision review)
- 795 corpus tokens + 2,247 Tier-1 keys screened against the live 20,010-word English set.
- 108 ED1 collisions found; 101 native-Bangla protected via PROTECT_BN (129 words);
  7 remain demotable, all English/artifact: bandage->bondage, choke->chose, humility->humidity,
  radon->ramon, rayon->ramon, nfail(artifact)->nail, stdout(artifact)->stout.
- Zero false demotions on: battery pools, adversarial/matrix/hardening corpora,
  19-line field corpus, Tier-1 key set, 58+71-word Bangla strong corpus. Each corpus
  measured separately (no aggregation).
- Full 108-row collision list: v29/collisions.json (rig-generated).

## D. EN pin passthrough (hard-question proof)
14/14 byte-exact under EN pin: punctuation, apostrophes/contractions, emoji (incl.
surrogate pairs), @handles, URLs, emails, mixed Bengali+Latin script, leading/trailing/
internal whitespace, numbers/dates/times/currency, ALLCAPS, single chars, versions,
tabs, C++/C#/node.js tokens. Suite: /tmp/passthrough.txt (archived to v29/passthrough-suite.txt).

## E. Spelling corpus (docs/spelling-corpus-v1.tsv, 52 entries)
35/36 WRONG fixed byte-exact (only "but" unreachable: discourse-marker isolation keeps
it a lone English segment - documented artifact). Zero regressions on OK/DIALECT entries;
2 corrections vs v28d (office অফিস, taratari তাড়াতাড়ি) both canon-consistent.
Seed additions/overrides sourced from this corpus (maintainer soak spellings win conflicts:
install ইনস্টল overrides Avro ইন্সটল). Composition byte-verified against the shipped
build 2026-09-23: 2,265 pairs total = 2,247 Avro-derived + 18 maintainer-corpus
additions + 19 maintainer-corpus value overrides on conflict.

## F. Known host-gate note (pre-existing, not a V29 change)
The v27/v28 host voice path returns text unchanged when it already contains Bengali
script ("skip:has-bengali" double-conversion guard). This binds the BN pin too in this
build: a mixed-script ASR result passes through whole. AUTO is byte-identical to v28d.
Pin UI + gate refinement are V29.1 workstream items.
