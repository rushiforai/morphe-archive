"""Exercise emitted pre-load routing around the pinned original native router.

The old router is an explicit boundary recorder; its full original body remains
independently hash-pinned by verify_ftm. No publisher content or state is copied.
"""
NAVIGATION = 'shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z'
LEGACY_NAVIGATION = 'shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z'


def verify_start_navigation(root, consent, execute, client_source):
    has_callback = ' ' + NAVIGATION in client_source
    cases = 0
    for host in ['www.ftm.nl', 'www.ftm.eu']:
        origin = 'https://' + host
        source = origin + '/start/locale-switcher'
        target = origin + '/start/splash'
        negatives = [None, '', 'invalid', origin + '/', origin + '/app-login', origin + '/start/trial',
            origin + '/start/splash/', origin + '/start%2Fsplash', origin + '/start/splash?x=1',
            origin + '/start/splash#login', 'http://' + host + '/start/splash',
            origin + ':443/start/splash', 'https://user:pass@' + host + '/start/splash',
            origin + '.example/start/splash', 'https://example.test/start/splash',
            'https://' + ('www.ftm.eu' if host.endswith('.nl') else 'www.ftm.nl') + '/start/splash']
        bad_sources = [None, '', origin + '/', origin + '/app-login', origin + '/start/splash',
            source + '?x=1', source + '#edition', source + '/', 'http://' + host + '/start/locale-switcher',
            'https://example.test/start/locale-switcher',
            'https://' + ('www.ftm.eu' if host.endswith('.nl') else 'www.ftm.nl') + '/start/locale-switcher']
        scenarios = [(source, target, True, 'GET', True)]
        scenarios += [(source, value, True, 'GET', False) for value in negatives]
        scenarios += [(value, target, True, 'GET', False) for value in bad_sources]
        scenarios += [(source, target, False, 'GET', False), (source, target, True, 'POST', False),
            (source, target, True, 'HEAD', False), (source, target, True, None, False)]
        for current, url, main_frame, method, positive in scenarios:
            for native_consumes in [False, True]:
                for signed_in in [False, True]:
                    view = {'url': current, 'loads': [], 'nativeCalls': [], 'nativeConsumes': native_consumes,
                        'account': {'loggedIn': signed_in}, 'preferences': {'edition': host, 'consent': False}}
                    state = repr((view['account'], view['preferences']))
                    client = {'view': view}
                    request = {'url': url, 'mainFrame': main_frame, 'method': method}
                    args = [client, view, request]
                    expected_super = ('super', 'Landroid/webkit/WebViewClient;->' + NAVIGATION, args)
                    actual = execute(root, NAVIGATION, args) if has_callback else expected_super
                    if positive and consent:
                        assert actual == 1, 'Account page must be cancelled before load; got ' + str(actual)
                        assert view['nativeCalls'] == [origin + '/skip-start'], view
                        assert view['loads'] == ([] if native_consumes else [origin + '/skip-start']), view
                    else:
                        assert actual == expected_super, (current, url, main_frame, method, actual)
                        assert not view['loads'] and not view['nativeCalls'], view
                    assert repr((view['account'], view['preferences'])) == state, view
                    cases += 1
        if has_callback:
            for args in [[{'view': {}}, None, {'url': target, 'mainFrame': True, 'method': 'GET'}],
                         [{'view': {}}, {'url': source}, None]]:
                assert execute(root, NAVIGATION, args) == ('super', 'Landroid/webkit/WebViewClient;->' + NAVIGATION, args)
    print('PASS FTM emitted pre-load navigation:', cases, 'cases; edition pairs, main frame/GET, router branches and unchanged modeled state')
