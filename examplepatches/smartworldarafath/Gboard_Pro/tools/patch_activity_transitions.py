path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java'
with open(path, 'r', encoding='utf-8') as f:
    text = f.read()

# 1. In configureWindow, add applyActivityEnterTransition(this)
target_config = 'GboardM3Helper.enforceHighRefreshRate(getWindow());'
repl_config = 'GboardM3Helper.enforceHighRefreshRate(getWindow());\n        GboardM3Helper.applyActivityEnterTransition(this);'

if target_config in text and 'applyActivityEnterTransition(this)' not in text:
    text = text.replace(target_config, repl_config, 1)
    print("Added applyActivityEnterTransition to configureWindow")

# 2. Add finish() override
if '@Override\n    public void finish()' not in text and 'public void finish()' not in text:
    target_destroy = '    @Override\n    protected void onDestroy() {'
    finish_code = '''    @Override
    public void finish() {
        super.finish();
        GboardM3Helper.applyActivityExitTransition(this);
    }

'''
    text = text.replace(target_destroy, finish_code + target_destroy, 1)
    print("Added finish() with applyActivityExitTransition to GboardPatchesSettingsActivity")

with open(path, 'w', encoding='utf-8') as f:
    f.write(text)

print("GboardPatchesSettingsActivity transitions updated!")
