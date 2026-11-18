"""Native Sentry admissions with explicit SDK/Android boundaries, no uploads."""
from rtl_vm import Reference
from tvgids_android_vm import AdViewFixture
from tvgids_sentry_contracts import SENTRY_CONTRACTS

SENTRY = 'Lio/sentry/Sentry;'
OPTIONS = 'Lio/sentry/SentryOptions;'
ANDROID = 'Lio/sentry/android/core/SentryAndroid;'
PERFORMANCE = 'Lio/sentry/android/core/SentryPerformanceProvider;'
NDK = 'Lio/sentry/ndk/SentryNdkPreloadProvider;'
PREINIT = 'preInitConfigurations(Lio/sentry/SentryOptions;)Z'
INIT = 'init(Landroid/content/Context;Lio/sentry/ILogger;Lio/sentry/Sentry$OptionsConfiguration;)V'


class NativeSentryAdmission(Exception):
    pass


class SentryFixture(AdViewFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in SENTRY_CONTRACTS})
        self.native.update(r[:2] for r in SENTRY_CONTRACTS)
        self.calls = []
        self.preload = False
        self.context = self.new('Landroid/content/Context;')
        self.memory.statics[ANDROID+'->staticLock:Lio/sentry/util/AutoClosableReentrantLock;'] = self.new('Lio/sentry/util/AutoClosableReentrantLock;')

    def invoke(self, target, args):
        if target == SENTRY+'->close()V': self.calls.append('close'); return None
        if target == OPTIONS+'->retrieveParsedDsn()Lio/sentry/Dsn;':
            self.calls.append('parse-dsn'); return self.new('Lio/sentry/Dsn;')
        if target == 'Ljava/lang/String;->isEmpty()Z': return int(not args[0])
        if target == 'Lio/sentry/config/PropertiesProviderFactory;->create()Lio/sentry/config/PropertiesProvider;':
            raise NativeSentryAdmission('external configuration')
        if target == 'Lio/sentry/util/AutoClosableReentrantLock;->acquire()Lio/sentry/ISentryLifecycleToken;':
            self.calls.append('lock'); return self.new('Lio/sentry/util/AutoClosableReentrantLock$AutoClosableToken;')
        if target == 'Lio/sentry/android/core/SentryAndroidOptionsContainer;-><init>()V':
            raise NativeSentryAdmission('android options setup')
        if target == 'Lio/sentry/android/core/performance/AppStartMetrics;->getInstance()Lio/sentry/android/core/performance/AppStartMetrics;':
            raise NativeSentryAdmission('performance provider')
        if target == 'Landroid/content/ContentProvider;->getContext()Landroid/content/Context;': return self.context
        if target == 'Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;': return self.new('Landroid/content/pm/PackageManager;')
        if target == 'Landroid/content/Context;->getPackageName()Ljava/lang/String;': return 'nl.tvgids'
        if target == 'Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;':
            assert args[1:] == ['nl.tvgids', 128]
            return self.new('Landroid/content/pm/ApplicationInfo;', {'Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;': self.new('Landroid/os/Bundle;')})
        if target == 'Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z':
            assert args[1:] == ['io.sentry.ndk.preload', 0]
            return int(self.preload)
        if target == 'Lio/sentry/ndk/SentryNdk;->preload()V': self.calls.append('preload'); return None
        if target == 'Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I': return 0
        return super().invoke(target, args)


def verify_sentry_android(f, disabled, group):
    if group == 'config':
        for dsn, enabled in (('', True), ('fixture-dsn', True), ('fixture-dsn', False)):
            f.calls.clear()
            options = f.new(OPTIONS, {OPTIONS+'->dsn:Ljava/lang/String;': dsn,
                OPTIONS+'->enabled:Z': int(enabled), OPTIONS+'->enableExternalConfiguration:Z': 0})
            result = f.run(SENTRY, PREINIT, (options,))
            expected = not disabled and bool(dsn) and enabled
            assert result == int(expected)
            assert f.calls == (['parse-dsn'] if expected else ['close'])
            assert options.value[OPTIONS+'->enabled:Z'] == (0 if disabled else int(enabled))
        options.value[OPTIONS+'->enableExternalConfiguration:Z'] = 1
        f.calls.clear()
        try: result = f.run(SENTRY, PREINIT, (options,))
        except NativeSentryAdmission as e: assert not disabled and str(e) == 'external configuration'
        else: assert disabled and result == 0 and f.calls == ['close']
    elif group == 'init':
        f.calls.clear()
        try: f.run(ANDROID, INIT, (f.context, f.new('Lio/sentry/android/core/AndroidLogger;'), f.new('Lio/sentry/android/core/g;')))
        except NativeSentryAdmission as e: assert not disabled and str(e) == 'android options setup'
        else: assert disabled and not f.calls
    elif group == 'providers':
        try: result = f.run(PERFORMANCE, 'onCreate()Z', (f.new(PERFORMANCE),))
        except NativeSentryAdmission as e: assert not disabled and str(e) == 'performance provider'
        else: assert disabled and result == 0
        for configured in (False, True):
            f.preload = configured; f.calls.clear()
            result = f.run(NDK, 'onCreate()Z', (f.new(NDK),))
            assert result == (0 if disabled else 1)
            assert f.calls == (['preload'] if configured and not disabled else [])
    else: raise AssertionError('Unknown native Sentry proof group')
    print('PASS Sentry Android', group, 'disabled' if disabled else 'original')
