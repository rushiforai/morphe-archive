"""Evaluate the shipped shortcut-array builder's emitted Hermes instructions."""
import struct

FUNCTION_ID = 33434
OFFSET = 7133029
SIZE = 360
STRINGS = {
    5304: 'moreFeed.shortcuts.news.title', 11417: 'moreFeed.shortcuts.news.ctaText',
    19244: 'moreFeed.shortcuts.puzzles.title', 12731: 'moreFeed.shortcuts.puzzles.description',
    14571: 'moreFeed.shortcuts.puzzles.ctaText', 19246: 'moreFeed.shortcuts.videos.title',
    19245: 'moreFeed.shortcuts.videos.description', 17048: 'moreFeed.shortcuts.videos.ctaText',
    19243: 'moreFeed.shortcuts.podcasts.title', 2483: 'moreFeed.shortcuts.podcasts.description',
    17046: 'moreFeed.shortcuts.podcasts.ctaText',
    160: 'images', 24842: 'shortcutNewsPapers', 30538: 'shortcutPuzzles',
    35488: 'shortcutVideos', 32648: 'shortcutPodcasts', 11: 'AppPages', 30083: 'KIOSK',
    32245: 'NewsTopTabsPages', 31192: 'PUZZLES', 26578: 'VIDEO', 27219: 'AUDIO',
}
LITERALS = {152203: 'paper', 152207: 'puzzles', 152211: 'videos', 152215: 'podcasts'}
FORMATS = {0x34: 'BB', 0x02: 'BII', 0x3b: 'BBB', 0x90: 'BH',
           0x93: 'B', 0x6e: 'BBBB', 0x52: 'BBB', 0x44: 'BBBB', 0x45: 'BBBH',
           0x08: 'BH', 0x5a: 'BBB', 0x76: 'B'}


def shortcut_items(data, locale='nl', publication_date='31 oktober'):
    translate = lambda key: locale + ':' + key
    parent = {1: translate, 2: {'images': {name: 'image:' + name for name in
              ('shortcutNewsPapers', 'shortcutPuzzles', 'shortcutVideos', 'shortcutPodcasts')}},
              3: publication_date}
    outer = {6: {'AppPages': {'KIOSK': 'kiosk'}},
             7: {'NewsTopTabsPages': {'PUZZLES': 'puzzles', 'VIDEO': 'video', 'AUDIO': 'audio'}}}
    regs, slots, position = {}, {}, 0
    code = data[OFFSET:OFFSET + SIZE]
    while position < len(code):
        op = code[position]
        assert op in FORMATS, (position, 'unmodeled shortcut instruction')
        fmt = FORMATS[op]
        args = struct.unpack_from('<' + fmt, code, position + 1)
        position += 1 + struct.calcsize('<' + fmt)
        if op == 0x34:
            regs[args[0]] = {0: parent, 1: outer}[args[1]]
        elif op == 0x02:
            item = {'id': LITERALS[args[2]]}
            slots[id(item)] = ['id', 'title', 'description', 'ctaText', 'imageUrl',
                               'appScreen' if item['id'] == 'paper' else 'screen']
            regs[args[0]] = item
        elif op == 0x3b:
            regs[args[0]] = regs[args[1]][args[2]]
        elif op == 0x90:
            regs[args[0]] = STRINGS[args[1]]
        elif op == 0x93:
            regs[args[0]] = None
        elif op == 0x6e:
            regs[args[0]] = regs[args[1]](regs[args[3]])
        elif op == 0x52:
            item = regs[args[0]]
            item[slots[id(item)][args[2]]] = regs[args[1]]
        elif op in (0x44, 0x45):
            regs[args[0]] = regs[args[1]][STRINGS[args[3]]]
        elif op == 0x08:
            regs[args[0]] = [None] * args[1]
        elif op == 0x5a:
            items = regs[args[0]]
            assert args[2] < len(items), 'Shortcut write outside allocated array'
            items[args[2]] = regs[args[1]]
        elif op == 0x76:
            result = regs[args[0]]
            assert all(item is not None for item in result), 'No blank shortcut slots'
            return result
    raise AssertionError('Shortcut builder did not return')


def verify_newspaper_shortcut(data, hidden):
    checks = 0
    for locale in ('nl', 'fr'):
        for date in ('', '31 oktober'):
            items = shortcut_items(data, locale, date)
            expected_ids = ['puzzles', 'videos', 'podcasts']
            if not hidden:
                expected_ids.insert(0, 'paper')
            assert [item['id'] for item in items] == expected_ids, 'Only the newspaper shortcut is removed'
            for item in items:
                key = 'news' if item['id'] == 'paper' else item['id']
                assert item['title'] == locale + ':moreFeed.shortcuts.' + key + '.title'
                assert item['ctaText'] == locale + ':moreFeed.shortcuts.' + key + '.ctaText'
                assert item['description'] == (date if key == 'news' else locale + ':moreFeed.shortcuts.' + key + '.description')
                route = {'paper': 'kiosk', 'puzzles': 'puzzles', 'videos': 'video', 'podcasts': 'audio'}[item['id']]
                assert item.get('appScreen', item.get('screen')) == route, 'Retain each shortcut destination'
                image = {'paper': 'shortcutNewsPapers', 'puzzles': 'shortcutPuzzles',
                         'videos': 'shortcutVideos', 'podcasts': 'shortcutPodcasts'}[item['id']]
                assert item['imageUrl'] == 'image:' + image, 'Retain each shortcut image'
            checks += 1
    return checks
