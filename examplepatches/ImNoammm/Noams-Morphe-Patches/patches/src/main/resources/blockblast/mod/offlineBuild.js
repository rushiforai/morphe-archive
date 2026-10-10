// Block online access is a build-time change (the INTERNET permission is removed from the APK), so the
// settings screen only reports it.
bb.feature('offlineBuild', {
    title: 'Online',
    settings: [
        { key: 'state', type: 'info', label: 'Internet permission removed from this build', value: 'patched' },
    ],
});
