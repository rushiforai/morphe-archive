with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'r', encoding='utf-8') as f:
    code = f.read()

# 1. Add action constants and standaloneFeatureMode field
target_field = '    private static final String TAG = "GboardPatchesSettingsActivity";'
replacement_field = '''    private static final String TAG = "GboardPatchesSettingsActivity";
    public static final String ACTION_UPDATES = "com.akshaykadam.pixelboard.action.UPDATES";
    public static final String ACTION_APPEARANCE = "com.akshaykadam.pixelboard.action.APPEARANCE";
    public static final String ACTION_BOARD_UI = "com.akshaykadam.pixelboard.action.BOARD_UI";
    public static final String ACTION_ABOUT = "com.akshaykadam.pixelboard.action.ABOUT";
    private boolean standaloneFeatureMode = false;'''

code = code.replace(target_field, replacement_field)

# 2. Add enforceHighRefreshRate in configureWindow
target_config = '    private void configureWindow() {'
replacement_config = '''    private void configureWindow() {
        GboardM3Helper.enforceHighRefreshRate(getWindow());'''

code = code.replace(target_config, replacement_config)

# 3. Update onBackPressed
target_back_press = '''    @SuppressLint("GestureBackNavigation")
    public void onBackPressed() {
        if (!navigateBack()) {
            return;
        }
        super.onBackPressed();
    }'''

replacement_back_press = '''    @SuppressLint("GestureBackNavigation")
    public void onBackPressed() {
        if (standaloneFeatureMode) {
            finish();
            return;
        }
        if (!navigateBack()) {
            return;
        }
        super.onBackPressed();
    }'''

code = code.replace(target_back_press, replacement_back_press)

# 4. Update goBackOrFinish
target_goback = '''    private void goBackOrFinish() {
        if (navigateBack()) {
            finish();
        }
    }'''

replacement_goback = '''    private void goBackOrFinish() {
        if (standaloneFeatureMode || navigateBack()) {
            finish();
        }
    }'''

code = code.replace(target_goback, replacement_goback)

# 5. Update navigateBack
target_navback = '''    private boolean navigateBack() {
        GboardPatchesSettingsOrchestrator.State<GboardPatchesSettingsContract.Feature> state =
                settingsOrchestrator.snapshot();'''

replacement_navback = '''    private boolean navigateBack() {
        if (standaloneFeatureMode) {
            finish();
            return false;
        }
        GboardPatchesSettingsOrchestrator.State<GboardPatchesSettingsContract.Feature> state =
                settingsOrchestrator.snapshot();'''

code = code.replace(target_navback, replacement_navback)

# 6. Update openInitialFeatureFromIntentIfNeeded
target_initial = '''    private boolean openInitialFeatureFromIntentIfNeeded() {
        if (initialFeatureFromIntentHandled) {
            return false;
        }
        initialFeatureFromIntentHandled = true;
        Intent intent = getIntent();
        if (intent == null) {
            return false;
        }
        if (restoreNavigationPathFromIntent(intent)) {
            return true;
        }
        return false;
    }'''

replacement_initial = '''    private boolean openInitialFeatureFromIntentIfNeeded() {
        if (initialFeatureFromIntentHandled) {
            return false;
        }
        initialFeatureFromIntentHandled = true;
        Intent intent = getIntent();
        if (intent == null) {
            return false;
        }

        String action = intent.getAction();
        Class<?> targetFeatureClass = null;
        if (ACTION_UPDATES.equals(action)) {
            targetFeatureClass = com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateFeature.class;
        } else if (ACTION_APPEARANCE.equals(action)) {
            targetFeatureClass = GboardAppearanceFeature.class;
        } else if (ACTION_BOARD_UI.equals(action)) {
            targetFeatureClass = GboardBoardUiFeature.class;
        } else if (ACTION_ABOUT.equals(action)) {
            targetFeatureClass = GboardAboutFeature.class;
        }

        if (targetFeatureClass != null) {
            standaloneFeatureMode = true;
            for (GboardPatchesSettingsContract.Feature feature : features) {
                if (targetFeatureClass.isInstance(feature)) {
                    List<GboardPatchesSettingsContract.Feature> path =
                            Collections.singletonList(feature);
                    runOnUiThread(() -> {
                        scrollState.resetForDirectPath(0);
                        requestScrollPositionOnNextScreenApply(0);
                        applyOrchestration(settingsOrchestrator.accept(
                                GboardPatchesSettingsOrchestrator.Event.replacePath(path)));
                    });
                    return true;
                }
            }
        } else {
            standaloneFeatureMode = false;
        }

        if (restoreNavigationPathFromIntent(intent)) {
            return true;
        }
        return false;
    }'''

code = code.replace(target_initial, replacement_initial)

with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'w', encoding='utf-8') as f:
    f.write(code)

print("GboardPatchesSettingsActivity patched successfully!")
