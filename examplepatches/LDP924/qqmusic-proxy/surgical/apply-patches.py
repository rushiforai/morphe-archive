#!/usr/bin/env python3
"""把 smali-patches 应用到 baksmali 输出（emua 整方法替换 + cyclone 三处 + AboutFragment 插入）。"""
import re
import sys

BASE = '/home/z/my-project/qqmusic-proxy/surgical'


def patch_emua(main_dir):
    f = main_dir + '/com/tencent/qqmusic/emua/b$b.smali'
    src = open(f).read()
    new_method = open(BASE + '/smali-patches/emua_b_b_getHost.smali').read()
    start = src.index('.method public getHost()Ljava/lang/String;')
    end = src.index('.end method', start) + len('.end method')
    src = src[:start] + new_method + src[end:]
    open(f, 'w').write(src)
    print('emua getHost 替换完成')


def patch_cyclone(c21_dir):
    f = c21_dir + '/com/tencent/qqmusiccommon/appconfig/cyclone/n.smali'
    src = open(f).read()
    hits = []
    for m in re.finditer(r'const-string(?:/jumbo)? (v\d+), "vc\.y\.qq\.com"', src):
        hits.append((m.start(), m.group(1)))
    assert len(hits) >= 2, 'vc.y.qq.com 命中不足: %d' % len(hits)
    # 倒序替换（净增指令防索引偏移）
    for pos, reg in reversed(hits):
        m = re.compile(r'const-string(?:/jumbo)? %s, "vc\.y\.qq\.com"' % reg).search(src, pos, pos + 80)
        src = src[:m.start()] + (
            'invoke-static {}, Lapp/patches/qqmusic/ldp924/ServerHost;->vc_y_qq_com()Ljava/lang/String;\n'
            '    move-result-object ' + reg) + src[m.end():]
    open(f, 'w').write(src)
    print('cyclone vc 替换完成: %d 处' % len(hits))


def patch_about(c6_dir):
    f = c6_dir + '/com/tencent/qqmusic/fragment/morefeatures/AboutFragment.smali'
    src = open(f).read()
    anchor = 'Lcom/tencent/qqmusic/ui/BannerTips;->o(Landroid/content/Context;ILjava/lang/String;)V'
    idx = src.index(anchor) + len(anchor)
    inject = ('\n\n    invoke-static {p0}, '
              'Lapp/patches/qqmusic/ldp924/ServerSettingsDialog;->show(Ljava/lang/Object;)V')
    src = src[:idx] + inject + src[idx:]
    open(f, 'w').write(src)
    print('AboutFragment 注入完成')


if __name__ == '__main__':
    patch_emua(sys.argv[1])
    patch_about(sys.argv[2])
    patch_cyclone(sys.argv[3])
