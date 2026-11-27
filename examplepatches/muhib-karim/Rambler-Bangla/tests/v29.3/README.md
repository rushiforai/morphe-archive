# V29.3 golden corpus and scorer

- corpus.tsv: 292 cases. Golden.java runs each case through processVoice (voice) and process (typing) on layouts k1/k2/k3 and pins AUTO/BN/EN.
- golden-baseline-rc2.tsv: V29 (rc2) output. golden-v29.3.tsv: shipped V29.3 output.
- score.py golden-v29.3.tsv --baseline golden-baseline-rc2.tsv prints LOCK/LANG/RS/WF/REGRESS and the package/release gates.
