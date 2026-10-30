"""Owned native Sentry prefixes, independently restored before graph checks."""
from tvgids_sentry_android_vm import SENTRY, PREINIT, ANDROID, INIT, PERFORMANCE, NDK

SENTRY_EDITS = [
    dict(owner=ANDROID, signature=INIT, index=0, original=[], replacement=['return-void']),
    dict(owner=SENTRY, signature=PREINIT, index=0, original=[], replacement=[
        'const/4 v0, 0x0', 'invoke-virtual {p0, v0}, Lio/sentry/SentryOptions;->setEnabled(Z)V',
        'const/4 v2, 0x0', 'goto/32 @32']),
    *[dict(owner=owner, signature='onCreate()Z', index=0, original=[], replacement=[
        'const/4 v0, 0x0', 'return v0']) for owner in (PERFORMANCE, NDK)],
]


def restore_sentry_resources(manifest):
    ns = '{http://schemas.android.com/apk/res/android}'
    for name in ('io.sentry.android.core.SentryPerformanceProvider', 'io.sentry.ndk.SentryNdkPreloadProvider'):
        matches = [p for p in manifest.findall('application/provider') if p.get(ns+'name') == name]
        assert len(matches) == 1 and matches[0].get(ns+'enabled') == 'false', 'Missing Sentry provider policy'
        del matches[0].attrib[ns+'enabled']
