"""Fetch exact framework source commits; never update an existing directory."""
from pathlib import Path
import subprocess

root = Path(__file__).resolve().parents[1]
deps = root.parent / 'build-dependencies'
pins = {
    'morphe-patches-gradle-plugin': 'a230c33f7eca1e18b07bf1114ca850421520f98d',
    'morphe-patcher': '70f20fcb1bc4cdaed639674d8757f57674d5764a',
}
for name, commit in pins.items():
    target = deps / name
    if target.exists():
        actual = subprocess.check_output(['git','-C',str(target),'rev-parse','HEAD'],text=True).strip()
        dirty = subprocess.check_output(['git','-C',str(target),'status','--porcelain'],text=True).strip()
        if actual != commit or dirty:
            raise SystemExit(f'Refusing a mismatched or modified dependency: {target}')
    else:
        target.mkdir(parents=True)
        subprocess.run(['git','init',str(target)],check=True)
        subprocess.run(['git','-C',str(target),'fetch','--depth=1',f'https://github.com/MorpheApp/{name}.git',commit],check=True)
        subprocess.run(['git','-C',str(target),'checkout','--detach',commit],check=True)
    print(f'{name}: {commit}')
