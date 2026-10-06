"""Check the restored-fragment callback route in an apktool-decoded APK."""
import pathlib
import re
import sys

root = pathlib.Path(sys.argv[1])
path = next(root.glob('smali*/androidx/viewpager/widget/ViewPager.smali'))
text = path.read_text()
method = re.search(r'\.method public a\(II\).*?\.end method', text, re.S).group()
restored = method.split('->a(Ljava/lang/String;)Landroidx/fragment/app/Fragment;')[1]
restored = restored.split('goto/16')[0]
assert 'instance-of v5, v1, Le/e/a/k3;' in restored
assert 'instance-of v5, v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;' in restored
labels = re.findall(r'if-eqz v5, (:\w+)', restored)
assert len(labels) == 2 and labels[0] == labels[1]
callback = 'iput-object v5, v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->a0:Le/e/a/l3/g;'
attach = '->a(Landroidx/fragment/app/Fragment;)Ld/k/a/o;'
assert restored.index('Le/e/a/k3;->k:Le/e/a/l3/g;') < restored.index(callback)
assert restored.index(callback) < restored.index('\n    '+labels[0]+'\n') < restored.index(attach)
assert method.count('->a0:Le/e/a/l3/g;') == 2, 'Keep both new and restored fragment routes'
menu = next(root.glob('smali*/com/sauzask/nicoid/NicoidVideoPlayerMenuFragment.smali')).read_text()
for button in ('NicoidVideoPlayerMenuFragment$g;', 'NicoidVideoPlayerMenuFragment$h;'):
    assert button in menu, 'Background and popup buttons must remain present'
print('PASS: current callback precedes restored menu attachment; other fragments bypass binding; new menu route and playback buttons preserved')
