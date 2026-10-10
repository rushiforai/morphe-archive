// Removing the startup credits is a build-time change (res/drawable-nodpi-v4/loading_bg.webp, the
// activity window background shown while the engine boots, is replaced by its own gradient without
// the wordmark), so the settings screen only reports it.
bb.feature('noSplash', {
    title: 'Startup',
    settings: [
        { key: 'state', type: 'info', label: 'Hungry Studio credits removed from this build', value: 'patched' },
    ],
});
