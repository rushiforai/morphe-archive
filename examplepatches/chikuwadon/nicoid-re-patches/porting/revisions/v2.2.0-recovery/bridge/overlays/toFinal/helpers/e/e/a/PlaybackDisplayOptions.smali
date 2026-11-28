.class final Le/e/a/PlaybackDisplayOptions;
.super Ljava/lang/Object;
.source "PlaybackDisplayOptions.java"


# static fields
.field static final SPREAD:Ljava/lang/String; = "nicoid_ambient_full_spread"

.field static final STRICT:Ljava/lang/String; = "comment_avoid_overlap"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addCheck(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .registers 5

    .line 67
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 68
    new-instance v1, Landroid/widget/CheckBox;

    invoke-direct {v1, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 69
    invoke-virtual {v1, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 70
    invoke-static {v1}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 71
    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 72
    invoke-virtual {v1, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    const/16 p1, 0x30

    .line 73
    invoke-static {v0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/CheckBox;->setMinHeight(I)V

    .line 74
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 v0, -0x2

    invoke-direct {p1, p2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v1
.end method

.method static ambient(Landroid/widget/LinearLayout;Landroid/content/SharedPreferences;Landroid/view/View;)Landroid/widget/CheckBox;
    .registers 7

    .line 20
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 22
    const-string v1, "Spread across the entire screen"

    const-string/jumbo v2, "\u64f4\u6563\u81f3\u6574\u500b\u756b\u9762"

    const-string v3, "\u5e83\u304c\u308a\u3092\u753b\u9762\u5168\u4f53\u306b\u3059\u308b"

    invoke-static {v0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 23
    const-string v1, "nicoid_ambient_full_spread"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 21
    invoke-static {p0, v0, p1}, Le/e/a/PlaybackDisplayOptions;->addCheck(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object p0

    .line 24
    new-instance p1, Le/e/a/PlaybackDisplayOptions$0;

    invoke-direct {p1, p2}, Le/e/a/PlaybackDisplayOptions$0;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-object p0
.end method

.method static category(Ljava/lang/String;)[I
    .registers 3

    .line 33
    const-string v0, "video_background_presentation"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x8

    if-eqz v0, :cond_0

    const/4 p0, 0x6

    filled-new-array {v1, p0}, [I

    move-result-object p0

    return-object p0

    .line 34
    :cond_0
    const-string v0, "comment_avoid_overlap"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p0, 0xb

    const/4 v0, 0x4

    filled-new-array {p0, v0}, [I

    move-result-object p0

    return-object p0

    .line 35
    :cond_1
    const-string v0, "nicolive_resume_chase"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/16 v1, 0x12

    const/4 p0, 0x0

    filled-new-array {v1, p0}, [I

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static checkbox(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Landroid/preference/Preference;
    .registers 3

    .line 57
    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 59
    :cond_0
    new-instance v0, Landroid/preference/CheckBoxPreference;

    invoke-direct {v0, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 60
    invoke-virtual {v0, p1}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 61
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 62
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    return-object v0
.end method

.method static installPreferences(Landroid/preference/PreferenceActivity;)V
    .registers 5

    if-eqz p0, :cond_0

    .line 40
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 41
    const-string v0, "comment_avoid_overlap"

    invoke-static {p0, v0}, Le/e/a/PlaybackDisplayOptions;->checkbox(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Landroid/preference/Preference;

    move-result-object v0

    .line 43
    const-string v1, "Prevent comments from overlapping"

    const-string/jumbo v2, "\u907f\u514d\u5f48\u5e55\u91cd\u758a"

    .line 42
    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u91cd\u306a\u308a\u3092\u9632\u3050"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 46
    const-string v1, "Scrolling comments avoid overlapping. When crowded, some will be omitted after a short wait. Fixed comments may overlap"

    .line 47
    const-string/jumbo v2, "\u8dd1\u99ac\u71c8\u7559\u8a00\u6703\u907f\u514d\u4e92\u76f8\u91cd\u758a\uff1b\u64c1\u64e0\u6642\u77ed\u66ab\u7b49\u5f85\u5f8c\uff0c\u90e8\u5206\u7559\u8a00\u53ef\u80fd\u4e0d\u986f\u793a\uff0c\u56fa\u5b9a\u7559\u8a00\u53ef\u80fd\u91cd\u758a"

    .line 44
    const-string/jumbo v3, "\u6d41\u308c\u308b\u30b3\u30e1\u30f3\u30c8\u540c\u58eb\u306e\u91cd\u306a\u308a\u3092\u6291\u3048\u307e\u3059\u3002\u6df7\u96d1\u6642\u306f\u77ed\u6642\u9593\u5f85\u6a5f\u3057\u3001\u7a7a\u304d\u304c\u306a\u3051\u308c\u3070\u4e00\u90e8\u3092\u8868\u793a\u3057\u307e\u305b\u3093"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 48
    const-string v0, "nicolive_resume_chase"

    invoke-static {p0, v0}, Le/e/a/PlaybackDisplayOptions;->checkbox(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Landroid/preference/Preference;

    move-result-object v0

    .line 50
    const-string v1, "Resume catch-up playback in Niconico Live"

    const-string/jumbo v2, "\u5f9e\u4e0a\u6b21\u4f4d\u7f6e\u7e7c\u7e8c Niconico \u76f4\u64ad\u8ffd\u770b"

    .line 49
    const-string v3, "\u30cb\u30b3\u751f\u306e\u8ffd\u3063\u304b\u3051\u518d\u751f\u3092\u524d\u56de\u306e\u4f4d\u7f6e\u304b\u3089\u518d\u958b"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 52
    const-string v1, "Resume at the previous position when reopening the same programme if it is still available."

    .line 53
    const-string/jumbo v2, "\u91cd\u65b0\u958b\u555f\u540c\u4e00\u7bc0\u76ee\u6642\uff0c\u82e5\u4e0a\u6b21\u4f4d\u7f6e\u4ecd\u53ef\u64ad\u653e\uff0c\u4fbf\u5f9e\u8a72\u4f4d\u7f6e\u7e7c\u7e8c"

    .line 51
    const-string v3, "\u540c\u3058\u756a\u7d44\u3092\u958b\u3044\u305f\u3068\u304d\u3001\u8996\u8074\u3067\u304d\u308b\u7bc4\u56f2\u5185\u3067\u524d\u56de\u306e\u4f4d\u7f6e\u306b\u623b\u308a\u307e\u3059"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$0(Landroid/view/View;Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method static spread(Landroid/view/View;IZ)I
    .registers 3

    if-eqz p2, :cond_0

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    invoke-static {p2, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0

    :cond_0
    return p1
.end method
