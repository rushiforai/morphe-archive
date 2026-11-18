"""Verify library lifecycle restoration against original publisher 15.0 smali.

Check exact wrapper guards, complete ordered delegates, all allocation/cast
identities from native encrypted records, window-cache provider semantics,
member signatures, command dispatch, payloads and exception regions.
Android runtime acceptance remains separate.
"""
import argparse
import hashlib
from pathlib import Path
import re

SOURCE = Path(__file__).resolve().parents[1] / 'patches/src/main/kotlin/patches/flitsmeister/LibraryLifecycleRuntime15.kt'
METHOD = re.compile(r'^\.method[^\n]* ([^\s]+)\n(.*?)^\.end method', re.M | re.S)
CALL = re.compile(r'invoke-(?:virtual|interface|super|direct)(?:/range)? [^\n]*, (L[^\n]+)')
REFERENCE = re.compile(r'(?<![\w$])L[A-Za-z0-9_$/]+;->[^\s,\n]+')

PROFILES = {'download': {'symbol': 'downloadServiceOnStartCommand', 'descriptor': 'Landroidx/media3/exoplayer/offline/DownloadService;->onStartCommand(Landroid/content/Intent;II)I', 'registers': 11, 'executable': 166, 'dex_instructions': 168, 'ordered_calls': 34, 'wrapper_full_sha256': 'c6d189e0632515d6257eaeb04e4e5cefcbaf91c742301a1c3a934b53b8b7aec5', 'body_sha256': '0baba2b98f4a441cccb1ce593fd6dc2d9cc39f9b4a5a4e4fd478642e7c2d6771', 'wrapper_registers': 9, 'wrapper_count': 21}, 'notification': {'symbol': 'playerNotificationReceiverOnReceive', 'descriptor': 'Landroidx/media3/ui/PlayerNotificationManager$NotificationBroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V', 'registers': 5, 'executable': 112, 'dex_instructions': 112, 'ordered_calls': 24, 'wrapper_full_sha256': 'd04fddf5b6d365d9fc2cfbcb83ffb2dcc99532310f27356f8e4dc76b9b028129', 'body_sha256': '02c9dfcacbcb1abd1bcf3ac5fdce98f2c733f1d479dd09aa5c0232993fa046de', 'wrapper_registers': 8, 'wrapper_count': 12}, 'overlay': {'symbol': 'standOutWindowOnStartCommand', 'descriptor': 'Lwei/mark/standout/StandOutWindow;->onStartCommand(Landroid/content/Intent;II)I', 'registers': 10, 'executable': 170, 'dex_instructions': 170, 'ordered_calls': 41, 'wrapper_full_sha256': '201f170c39408b396cdf05c6177b99ee1737ea1f0f81123e7d6f1389b94d0903', 'body_sha256': '96db4d9c7bc416436aeb556aa898d4447162acf2efebbd4edbe7690c963c01ab', 'wrapper_registers': 9, 'wrapper_count': 21}}

NATIVE = {'download': {'asset': '8mSuPMx3MPD7iDZw', 'sha256': 'adeceb7a1e7113dbc418afa02e5d33ab9060b75c8547ebe1394e0fbb950f220e', 'records': {'androidx/media3/exoplayer/scheduler/Requirements': [4424, 5], 'androidx/media3/exoplayer/offline/DownloadRequest': [34799, 73], 'lastStartId': [7255, 71], 'taskRemoved': [10744, 75], 'startedInForeground': [2196, 173], 'downloadManagerHelper': [6892, 168], 'isStopped': [28212, 97], 'foregroundNotificationUpdater': [51051, 148]}}, 'notification': {'asset': '45SSFJsyXBEwWtgz', 'sha256': '472a9100553f37b1e73d8a505795b52def735dd601f27b65159d7ac9913c6fc2', 'records': {'this$0': [27124, 24]}}, 'overlay': {'asset': 'J2vU3MI3gmqrWyZ6', 'sha256': '072ce722b10b00bf5e0d42fc4f5924e3f56d794735b3d520f5c273ab0efc73a2', 'records': {'buk': [94265, 146], 'fi5': [47111, 27], 'java/util/HashMap': [30968, 87], 'java/lang/RuntimeException': [1155, 117], 'android/util/SparseArray': [37019, 58], 'java/lang/Class': [8975, 17], 'b': [16889, 4], 'q': [86008, 36], 'a': [38889, 158], 'd': [68712, 174], 'Ljava/lang/Object;': [63092, 173], 'java/lang/StringBuilder': [62576, 63], 'bk0': [5011, 78], '(Lwei/mark/standout/StandOutWindow;I)V': [42842, 60]}}}

PROVIDERS = {'Lwei/mark/standout/StandOutWindow;': {'<clinit>()V': 'c4e199679551836288099a80817cee37712c092ed6248060f884cdd306f433bc', 'm(I)Lbuk;': 'e11d45108f518a064c72450b2b4a9279b9907c45af7df565a4b26e6e00086d9c'}, 'Lbuk;': {'<init>(Lwei/mark/standout/StandOutWindow;I)V': '33e413e3cc08f0a4f6925c26d037a44fc165d9bd5b19a1d113f78bba6ba16081'}, 'Lbk0;': {'b(Ljava/lang/String;)V': 'ecdaa94742a799c3732c48cfc5bb77e2da274cea1c0cf15458b75f373c263a52'}}


def shape(body):
    executable = []
    payloads = []
    mode = None
    for line in body.splitlines():
        line = line.strip()
        start = re.match(r'\.(sparse-switch|packed-switch|array-data)(?:\s|$)', line)
        if start:
            assert mode is None
            mode = start[1]
            payloads.append([])
            continue
        if mode:
            if line == '.end ' + mode:
                mode = None
            elif line:
                payloads[-1].append(line)
            continue
        if line and line[0] not in '.:#':
            executable.append(line)
    assert mode is None, 'Unterminated payload'
    return executable, payloads


def verify(decoded, source=SOURCE):
    text = source.read_text()
    cache = {}

    def class_text(cls):
        if cls not in cache:
            paths = list(decoded.glob('smali*/' + cls[1:-1] + '.smali'))
            assert len(paths) <= 1, f'Ambiguous publisher class {cls}'
            cache[cls] = paths[0].read_text() if paths else None
        return cache[cls]

    def member_exists(cls, signature, seen=()):
        if cls in seen:
            return False
        value = class_text(cls)
        if value is None:
            return False
        kind = 'method' if '(' in signature else 'field'
        if re.search(r'^\.' + kind + r'[^\n]* ' + re.escape(signature) + r'(?:\s|$)', value, re.M):
            return True
        if signature.startswith('<init>'):
            return False
        return any(member_exists(parent, signature, seen + (cls,))
                   for parent in re.findall(r'^\.(?:super|implements) (L[^;]+;)', value, re.M))

    # These exact publisher methods establish that fi5.a is the window HashMap,
    # buk is a StandOut FrameLayout, and bk0.b throws the intended exception.
    for cls, expected in PROVIDERS.items():
        methods = dict(METHOD.findall(class_text(cls)))
        for signature, digest in expected.items():
            assert hashlib.sha256(methods[signature].encode()).hexdigest() == digest, f'Changed provider semantics {cls}->{signature}'
    assert '.super Landroid/widget/FrameLayout;' in class_text('Lbuk;')

    key = (decoded / 'assets/Fxz6YV9Xh1xFSXmr').read_bytes()[0x2026C:0x2036C]
    assert hashlib.sha256(key).hexdigest() == '576ae8c04c641dae5864b64503b62b0a4cf3df5f4c5abe12f02a8830afdc28a1'
    references = set()
    restored = {}
    for name, profile in PROFILES.items():
        symbol = profile['symbol']
        match = re.search(r'internal val ' + symbol + r'15 = """\n(.*?)\n"""', text, re.S)
        assert match, f'Missing {symbol}'
        body = '\n'.join(line.strip() for line in match[1].replace("${'$'}", '$').splitlines())
        restored[name] = body
        assert f'{symbol}RegisterCount15 = {profile["registers"]}' in text
        assert hashlib.sha256(body.encode()).hexdigest() == profile['body_sha256'], f'Changed verified {name} body'
        executable, payloads = shape(body)
        assert len(executable) == profile['executable']
        assert len(executable) + len(payloads) == profile['dex_instructions']
        assert 'Lcom/pairip/VMRunner;' not in body
        owner, signature = profile['descriptor'].split('->')
        publisher = class_text(owner)
        full = next(m[0] for m in re.finditer(r'^\.method[^\n]* ' + re.escape(signature) + r'\n.*?^\.end method', publisher, re.M | re.S))
        assert hashlib.sha256(full.encode()).hexdigest() == profile['wrapper_full_sha256'], f'Changed {name} wrapper'
        methods = dict(METHOD.findall(publisher))
        wrapper = methods[signature]
        parameters = 3 if name == 'notification' else 4
        assert int(re.search(r'\.locals (\d+)', wrapper)[1]) + parameters == profile['wrapper_registers']
        assert len(shape(wrapper)[0]) == profile['wrapper_count']
        assert not re.search(r'^\s*\.catch', wrapper, re.M)
        assert re.findall(r'const-string(?:/jumbo)? \w+, "([^"\n]+)"', wrapper) == [NATIVE[name]['asset']]

        delegates = {}
        for sig, code in methods.items():
            ordinal = re.search(r'\$(\d{3})\(', sig)
            if not ordinal or sig.startswith('access$'):
                continue
            calls = CALL.findall(code)
            assert len(calls) == 1, f'Changed delegate {sig}'
            delegates[int(ordinal[1])] = calls[0]
        calls = [call for call in CALL.findall(body) if '-><init>' not in call]
        assert len(calls) == profile['ordered_calls']
        assert sorted(delegates) == list(range(1, len(calls) + 1))
        assert calls == [delegates[i] for i in range(1, len(calls) + 1)], f'Changed {name} ordered delegates'

        native = NATIVE[name]
        data = (decoded / 'assets' / native['asset']).read_bytes()
        assert hashlib.sha256(data).hexdigest() == native['sha256']
        for expected, (offset, phase) in native['records'].items():
            length = (data[offset] ^ key[phase]) | ((data[offset + 1] ^ key[(phase + 1) % 256]) << 8)
            value = bytes(data[offset + i] ^ key[(phase + i) % 256] for i in range(2, length + 2))
            assert value == expected.encode(), f'Changed native binding {name}:{offset:x}'
        for cls in re.findall(r'(?:new-instance|check-cast) \w+, L([^;]+);', body):
            assert cls in native['records'], f'Unverified allocation/cast identity {name}: {cls}'

        for reference in REFERENCE.findall(body):
            cls, sig = reference.split('->')
            external = class_text(cls) is None and cls.startswith(('Ljava/', 'Landroid/'))
            assert external or member_exists(cls, sig), f'Unresolved publisher member: {reference}'
            references.add(reference)

    download = restored['download']
    assert [len(p) for p in shape(download)[1]] == [9, 9]
    assert 'nop\n:sswitch_data_0' in download
    assert download.index(':sswitch_data_0\n.sparse-switch') > download.index('return v0')
    assert '->pauseDownloads()V' in download and '->resumeDownloads()V' in download
    assert '->addDownload(' in download and '->setRequirements(' in download
    assert '->setStopReason(' in download and '->removeAllDownloads()V' in download
    notification = restored['notification']
    for action in ('play', 'pause', 'prev', 'rewind', 'ffwd', 'next', 'stop', 'dismiss'):
        assert '"androidx.media3.ui.notification.' + action + '"' in notification
    assert '->onCustomAction(' in notification and '->isCommandAvailable(I)Z' in notification
    overlay = restored['overlay']
    assert len(re.findall(r'^\.catch', overlay, re.M)) == 8
    assert len(re.findall(r'^\.catchall', overlay, re.M)) == 7
    assert '.catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0' in overlay
    assert overlay.count('check-cast') == 6
    assert overlay.count('Lfi5;->a:Ljava/lang/Object;\ncheck-cast') == 2
    for action in ('SHOW', 'RESTORE', 'HIDE', 'CLOSE', 'CLOSE_ALL', 'SEND_DATA'):
        assert '"' + action + '"' in overlay
    assert 'monitor-enter p0' in overlay and 'monitor-exit p0' in overlay
    assert 'Lbk0;->b(Ljava/lang/String;)V' in overlay
    assert 'const/4 p0, 0x2\nreturn p0' in overlay
    return {'callbacks': 3, 'ordered_calls': sum(p['ordered_calls'] for p in PROFILES.values()),
            'resolved_references': len(references),
            'native_bindings': sum(len(n['records']) for n in NATIVE.values()),
            'executable_instructions': [p['executable'] for p in PROFILES.values()],
            'dex_instructions': [p['dex_instructions'] for p in PROFILES.values()],
            'overlay_exception_entries': 8, 'overlay_catchall_entries': 7}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--source', type=Path, default=SOURCE)
    args = parser.parse_args()
    print(verify(args.decoded, args.source))
