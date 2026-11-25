"""Original native Sentry boundaries/DEX ABIs; no publisher payloads."""
SENTRY_CONTRACTS = [
    ('Lio/sentry/Sentry;', 'preInitConfigurations(Lio/sentry/SentryOptions;)Z', 10, 4, 30, '3c2158590493e7e29252f5499777800c7c92c45de244e02c94eac8dbec240ccb'),
    ('Lio/sentry/Sentry;', 'close()V', 9, 3, 23, '896366b7b8fa79dd86f1cedc63e3c7a68bba84f2d935ce342d02961e097dcca3'),
    ('Lio/sentry/Sentry;', '<clinit>()V', 65544, 2, 24, '2b5aae594229961cabc0f4dd42c3971cb7a28464464474f6ad7095acb7077d39'),
    ('Lio/sentry/SentryOptions;', 'setEnabled(Z)V', 1, 2, 2, 'a90cb079a2a185bd960ddc2ecdc2a4e1ee290602fb8e7dd7ba51305c9d412bf6'),
    ('Lio/sentry/SentryOptions;', 'isEnabled()Z', 1, 1, 2, '30c821bb6172ff302c8712622b87c5ea6ca4ad9d739fe52a3d638a8780461ef1'),
    ('Lio/sentry/SentryOptions;', 'getDsn()Ljava/lang/String;', 1, 1, 2, '1077f03a5ff6ac60effa90d26b361cab47a74392f6a01bd586624d800a0eb209'),
    ('Lio/sentry/SentryOptions;', 'isEnableExternalConfiguration()Z', 1, 1, 2, '3a3b556b86be020666857b9eb55c2e9258b332fabd8481ad3cddcde8d64165f9'),
    ('Lio/sentry/android/core/SentryPerformanceProvider;', 'onCreate()Z', 1, 3, 8, '6a2e2b33364886eebf0d52fe830f71c9f6b31d024ce47b8a8003a39cecc7de08'),
    ('Lio/sentry/ndk/SentryNdkPreloadProvider;', 'onCreate()Z', 1, 5, 30, '7864f6d7726e5df9de5c019c27bac65d90af9a6bb4625665506b63783abaa20c'),
    ('Lio/sentry/android/core/SentryAndroid;', '<clinit>()V', 65544, 2, 7, '577b2cb5fe5b51bad7327423ae9d67692b80022e10f9b6d8c73d1de228a58077'),
    ('Lio/sentry/android/core/SentryAndroid;', 'init(Landroid/content/Context;)V', 9, 2, 4, 'd3d6784005e6c436418af18e206542e109be977b19b7e818b5c01bd164276f14'),
    ('Lio/sentry/android/core/SentryAndroid;', 'init(Landroid/content/Context;Lio/sentry/ILogger;)V', 9, 4, 5, 'a8cdfe5eba32d3075b60f99f3934eba08ddaeaccbab929127d451eb595228e1b'),
    ('Lio/sentry/android/core/SentryAndroid;', 'init(Landroid/content/Context;Lio/sentry/ILogger;Lio/sentry/Sentry$OptionsConfiguration;)V', 9, 8, 74, '31c1b199de030e067c7b8d67fd066bdb6ff3a784a26c2563bceb8193efa028c9'),
    ('Lio/sentry/android/core/SentryAndroid;', 'init(Landroid/content/Context;Lio/sentry/Sentry$OptionsConfiguration;)V', 9, 3, 4, '61ee92cb589e5edb1afdb967eb7e7af8fef62da96f93abd9a75219a48c65b15c'),
]
