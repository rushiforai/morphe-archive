"""Verify reviewed callback bodies before masking the original class digests.

The independent ART probes establish behavior. This oracle checks transformation
fidelity: instructions, register mapping and typed catches must match reviewed
production code before only that method body may be masked. Original class,
parameter and field metadata remain pinned independently of the production list.
"""
import hashlib
from pathlib import Path
import re
import textwrap

SOURCE = Path(__file__).resolve().parents[1] / 'patches/src/main/kotlin/patches/flitsmeister/RuntimeCallbacks.kt'


def metadata_digest(text):
    """Retain structural metadata while discarding method implementations."""
    lines = []
    in_method = annotation_depth = 0
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith('#'):
            continue
        if line.startswith('.method '):
            in_method = 1
            lines.append(line)
        elif line == '.end method':
            in_method = 0
            lines.append(line)
        elif not in_method:
            lines.append(line)
        elif line.startswith('.annotation '):
            annotation_depth += 1
            lines.append(line)
        elif annotation_depth:
            lines.append(line)
            if line == '.end annotation':
                annotation_depth -= 1
        elif line.startswith(('.param ', '.parameter ', '.end param')):
            lines.append(line)
    assert not in_method and not annotation_depth, 'Malformed callback class metadata'
    return hashlib.sha256('\n'.join(lines).encode()).hexdigest()


# Frozen from the original 14.17/1287 APK. Do not update existing golden class
# hashes when adding a reviewed restoration. Values are constant, program,
# signature, register count and original structural-metadata hash.
RESTORATIONS = {'Landroidx/appcompat/app/AppCompatDelegateImpl$AutoNightModeManager$1;': ('nightModeCallbackCode',
                                                                           'QqEacfrxxNH2xR2o',
                                                                           'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                           8,
                                                                           '99f6a18caa18319eb3b1619081a37e063243abe2c977b5e29000b84db41f8a25'),
 'Landroidx/car/app/connection/CarConnectionTypeLiveData$CarConnectionBroadcastReceiver;': ('carConnectionCallbackCode',
                                                                                            'Dr4dBbMVL1fUdwh9',
                                                                                            'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                                            8,
                                                                                            '6ae16ad7ae374700ff3022da174e7b5d4a892f55654dc168ed95d77b90a7db5e'),
 'Landroidx/compose/ui/adaptive/MediaQuery_androidKt$obtainUiMediaScope$4$1$receiver$1;': ('dockCallbackCode',
                                                                                           'ng3GOCaNqhRVl8Cc',
                                                                                           'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                                           8,
                                                                                           'bf11430a93281ec61bee171106e8c4aeedb3733b374689a1427767a40b599877'),
 'Landroidx/core/content/pm/ShortcutManagerCompat$1;': ('shortcutCallbackCode',
                                                        'Du2QUEGNa6vaWkHX',
                                                        'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                        8,
                                                        '5e31de994c1075458e12d916f2bbd8cd07e7c060337cc69c3835498aafe2c703'),
 'Landroidx/media3/common/util/NetworkTypeObserver$Receiver;': ('mediaNetworkCallbackCode',
                                                                '4Ef7LqTtG2McIaQc',
                                                                'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                8,
                                                                'aa2476d5067fab5c28ffe812290618e598110576eb1aa84db432fd0adc59f55b'),
 'Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;': ('mediaVolumeCallbackCode',
                                                                          'nQul9qCZs3mKlESl',
                                                                          'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                          8,
                                                                          '2da6238da930c96d8ad22e1b7972927a329fe9eaca1a269ba30236661c5db44d'),
 'Landroidx/media3/exoplayer/scheduler/RequirementsWatcher$DeviceStatusChangeReceiver;': ('mediaRequirementsCallbackCode',
                                                                                          'TZCDiOLf8RNWmCmn',
                                                                                          'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                                          8,
                                                                                          'd18bc3bde37448a30e9170e9be179121e73c19fa2a9f8126f94097729db85147'),
 'Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker$broadcastReceiver$1;': ('workTrackerCallbackCode',
                                                                                                      'I2W18NGJ4P3J9qN4',
                                                                                                      'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                                                      8,
                                                                                                      'e8d0fdd4da5e40b28dc60cc1c9f11f8cf4e324d51dd60684fcdfaecffa95f3cb'),
 'Landroidx/work/impl/workers/CombineContinuationsWorker;': ('continuationWorkCode',
                                                             'vXbKgkAw57upg5rB',
                                                             'doWork()Landroidx/work/ListenableWorker$Result;',
                                                             6,
                                                             'f42c6f8d5557129243f2d67952d492c4067aba5741a6a6e321ac5824dcec7075'),
 'Lhza;': ('locationModeCallbackCode',
           'nb4te9nJow5cnABc',
           'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
           8,
           '60149809d376927d4886f04930a31753ee259b02e35959e6fd7435daa6be986f'),
 'Lnet/danlew/android/joda/TimeZoneChangedReceiver;': ('timeZoneCallbackCode',
                                                       'Nr6fU41sFaWlDulA',
                                                       'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                       8,
                                                       '49ee5314d43506898ebaa880f5b867feb399f2352d012917541500ba4b28e4a9'),
 'Lorg/maplibre/android/net/ConnectivityReceiver;': ('mapConnectivityCallbackCode',
                                                     'gSATlwyF4ppHnjJ3',
                                                     'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                     8,
                                                     '0de5ea5f719a654e36b894c9cf0e387988a85341f96dac21c3110e5269c9b32a'),
 'Lorg/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification$1;': ('navigationEndCallbackCode',
                                                                                                 'K0NpSU0GTpBB8KFs',
                                                                                                 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
                                                                                                 8,
                                                                                                 'a16dec6dc846bcf3cb803987f72b21b1d7ed7a68c28b8379a2459cdee163c3b5')}


CATCH_TYPES = {
    'timeZoneCallbackCode': ('Ljava/lang/IllegalArgumentException;',),
    'shortcutCallbackCode': ('Landroid/content/IntentSender$SendIntentException;',),
}


def production_code(text, constant):
    matches = re.findall(r'\bval\s+' + re.escape(constant) +
                         r'\s*=\s*"""(.*?)"""\.trimIndent\(\)', text, re.S)
    assert len(matches) == 1, 'Expected one reviewed callback constant: ' + constant
    return textwrap.dedent(matches[0]).strip().replace("${'$'}", '$')


def original_vm_code(program, signature):
    count = 1 if signature.startswith('doWork(') else 3
    rows = ['const v0, 0x' + str(count), 'new-array v2, v0, [Ljava/lang/Object;']
    for index in range(count):
        rows += ['const v0, 0x' + str(index), f'aput-object p{index}, v2, v0']
    rows += [f'const-string v1, "{program}"',
             'invoke-static {v1, v2}, Lcom/pairip/VMRunner;->invoke(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;',
             'move-result-object v1']
    if count == 1:
        rows += ['check-cast v1, Landroidx/work/ListenableWorker$Result;', 'return-object v1']
    else:
        rows += ['return-void']
    return '\n'.join(rows)


def verified_body(body, expected, constant, canonical):
    wanted_types = CATCH_TYPES.get(constant, ())
    for label, code in [('production', expected), ('emitted', body)]:
        types = tuple(re.findall(r'^\s*\.catch\s+(L[^;]+;)', code, re.M))
        assert types == wanted_types and not re.search(r'^\s*\.catchall\b', code, re.M), (
            f'{constant}: {label} must retain exactly the reviewed typed catch table')
    assert canonical(body) == canonical('.locals 5\n' + expected), (
        constant + ': emitted callback instructions/branches/typed catch ranges differ')


def class_overrides(root, enabled, read_class, read_method, canonical):
    """Verify changes before returning narrowly scoped original-body masks."""
    production = SOURCE.read_text() if enabled else ''
    result = {}
    for owner, (constant, program, signature, registers, metadata) in RESTORATIONS.items():
        text = read_class(root, owner)
        assert metadata_digest(text) == metadata, owner + ': original class/parameter metadata changed'
        if not enabled:
            continue  # No masks: original whole-class hashes apply.
        body = read_method(root, owner + '->' + signature)
        verified_body(body, production_code(production, constant), constant, canonical)
        parameter_registers = 1 if signature.startswith('doWork(') else 3
        original = '.locals ' + str(registers - parameter_registers) + '\n' + original_vm_code(program, signature)
        result[owner] = {signature: canonical(original)}
    return result
