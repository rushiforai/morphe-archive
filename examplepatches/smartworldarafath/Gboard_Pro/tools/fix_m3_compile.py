with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Fix while (p != null && !(p instanceof Activity))
old_while = 'while (p != null && !(p instanceof Activity)) {'
new_while = 'while (p != null) {'
text = text.replace(old_while, new_while)

# 2. Add resolveActivityTheme
resolve_theme = '''    public static int resolveActivityTheme(Activity activity) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return android.R.style.Theme_DeviceDefault_DayNight;
        }
        boolean nightMode = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return nightMode
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
    }
'''

if 'resolveActivityTheme' not in text:
    # insert before public static int dp
    text = text.replace('public static int dp(Context context', resolve_theme + '\n    public static int dp(Context context')

with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java', 'w', encoding='utf-8') as f:
    f.write(text)
print("Updated GboardM3Helper.java with fixes!")
