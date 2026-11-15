./gradlew :patches:test --no-daemon
./gradlew :patches:ktlintCheck --no-daemon
./gradlew :patches:generatePatchesList --no-daemon
python3 -c "import json;d=json.load(open('patches-list.json',encoding='utf-8'));print('patches:',len(d['patches']));print('apps:',sorted({c['name'] for p in d['patches'] for c in (p.get('compatiblePackages') or [])}))"
python3 .github/scripts/generate_patches_readme.py sqzass/lustx-patches dev patches-list.json README.md
./gradlew :patches:buildAndroid --no-daemon