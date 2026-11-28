.class public final Le/e/a/NgCommentSettings;
.super Ljava/lang/Object;
.source "NgCommentSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NgCommentSettings$ListDialog;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final URL:Ljava/lang/String; = "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client"

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/NgCommentSettings;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/NgCommentSettings;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 5
    sget-object v0, Le/e/a/NgCommentSettings;->WORK:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1()Landroid/os/Handler;
    .registers 1

    .line 5
    sget-object v0, Le/e/a/NgCommentSettings;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static addFixedCheck(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/widget/SeekBar;)V
    .registers 8

    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v1, "\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8\u3082\u5236\u9650\u5bfe\u8c61\u306b\u542b\u3081\u308b"

    const-string v2, "Include fixed comments in the limit"

    const-string v3, "\u56fa\u5b9a\u7559\u8a00\u4e5f\u7d0d\u5165\u5b57\u6578\u9650\u5236"

    invoke-static {p0, v1, v2, v3}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {v1}, Le/e/a/NgCommentSettings;->readFixed(Landroid/content/SharedPreferences;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    const/4 v2, 0x2

    new-array v3, v2, [[I

    const/4 v4, 0x1

    new-array v2, v4, [I

    const/4 v4, 0x0

    const v1, 0x10100a0

    aput v1, v2, v4

    aput-object v2, v3, v4

    const/4 v1, 0x1

    new-array v2, v4, [I

    aput-object v2, v3, v1

    const/4 v1, 0x2

    new-array v2, v1, [I

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v1

    aput v1, v2, v4

    const/4 v1, 0x1

    const v4, -0x777778

    aput v4, v2, v1

    new-instance v1, Landroid/content/res/ColorStateList;

    invoke-direct {v1, v3, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/widget/SeekBar;->setTag(Ljava/lang/Object;)V

    return-void
.end method

.method static checkedFixed(Landroid/widget/SeekBar;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of p0, v0, Landroid/widget/CheckBox;

    if-eqz p0, :cond_0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method static exceedsLength(Ljava/lang/String;I)Z
    .registers 5

    const/4 v0, 0x0

    if-lez p1, :cond_0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, p1, :cond_0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->codePointCount(II)I

    move-result v2

    if-le v2, p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method static install(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 6

    .line 7
    const-string v0, "nicoid_ng_comments"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "NG comment list"

    const-string v2, "NG \u7559\u8a00\u6e05\u55ae"

    const-string v3, "NG\u30b3\u30e1\u30f3\u30c8\u30ea\u30b9\u30c8"

    invoke-static {p0, v3, v0, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Manage blocked words, users and commands"

    const-string/jumbo v2, "\u7ba1\u7406\u5c01\u9396\u6587\u5b57\u3001\u4f7f\u7528\u8005\u8207\u6307\u4ee4"

    const-string v3, "NG\u30ef\u30fc\u30c9\u30fbNG\u30e6\u30fc\u30b6\u30fc\u30fbNG\u30b3\u30de\u30f3\u30c9\u3092\u7ba1\u7406"

    invoke-static {p0, v3, v0, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/NgCommentSettings$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method static installLength(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 11

    const-string v2, "nicoid_scrolling_comment_max_chars"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-nez v0, :cond_0

    move-object v0, p0

    move-object v1, p1

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u6587\u5b57\u6570\u5236\u9650"

    const/4 v4, 0x1

    const/16 v5, 0x65

    const/16 v6, 0x65

    invoke-static {p0}, Le/e/a/NgCommentSettings;->sliderValue(Landroid/content/Context;)I

    move-result v7

    const-string v8, "max_chars"

    invoke-static/range {v0 .. v8}, Le/e/a/CommentOptions;->slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V

    :cond_0
    invoke-static {p0}, Le/e/a/NgCommentSettings;->refreshLength(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static items(Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 1

    .line 8
    invoke-static {p0}, Le/e/a/NgCommentData;->items(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 7
    invoke-static {p0}, Le/e/a/NgCommentSettings;->show(Landroid/preference/PreferenceActivity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static lengthLabel(Landroid/content/Context;I)Ljava/lang/String;
    .registers 6

    const/16 v0, 0x65

    if-ge p1, v0, :cond_0

    const-string/jumbo v0, "\u6587\u5b57"

    const-string v1, " chars"

    const-string v2, "\u5b57"

    invoke-static {p0, v0, v1, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, "\u7121\u5236\u9650"

    const-string v1, "Unlimited"

    const-string/jumbo v2, "\u7121\u9650\u5236"

    invoke-static {p0, v0, v1, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static lengthSummary(Landroid/content/Context;I)Ljava/lang/String;
    .registers 7

    invoke-static {p0, p1}, Le/e/a/NgCommentSettings;->lengthLabel(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {v1}, Le/e/a/NgCommentSettings;->readFixed(Landroid/content/SharedPreferences;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "\uff1a\u6307\u5b9a\u6587\u5b57\u6570\u3092\u8d85\u3048\u308b\u30b3\u30e1\u30f3\u30c8\u3092\u975e\u8868\u793a"

    const-string v2, ": Hide comments exceeding the limit"

    const-string/jumbo v3, "\uff1a\u96b1\u85cf\u8d85\u904e\u6307\u5b9a\u5b57\u6578\u7684\u7559\u8a00"

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "\uff1a\u6307\u5b9a\u6587\u5b57\u6570\u3092\u8d85\u3048\u308b\u6d41\u308c\u308b\u30b3\u30e1\u30f3\u30c8\u3092\u975e\u8868\u793a"

    const-string v2, ": Hide scrolling comments exceeding the limit"

    const-string/jumbo v3, "\uff1a\u96b1\u85cf\u8d85\u904e\u6307\u5b9a\u5b57\u6578\u7684\u6efe\u52d5\u7559\u8a00"

    :goto_0
    invoke-static {p0, v1, v2, v3}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static lengthTitle(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u306e\u6587\u5b57\u6570\u5236\u9650"

    const-string v1, "Comment length limit"

    const-string/jumbo v2, "\u7559\u8a00\u5b57\u6578\u9650\u5236"

    invoke-static {p0, v0, v1, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static lengthValues()[Ljava/lang/String;
    .registers 4

    const/16 v0, 0x69

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x64

    if-gt v1, v2, :cond_0

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-string v2, "150"

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    const-string v2, "200"

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    const-string v2, "300"

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    const-string v2, "500"

    aput-object v2, v0, v1

    return-object v0
.end method

.method static parseLength(Ljava/lang/String;)I
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-gt v1, v2, :cond_2

    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v1, :cond_2

    const/16 v2, 0x64

    if-le v1, v2, :cond_1

    const/16 v3, 0x96

    if-eq v1, v3, :cond_0

    const/16 v3, 0xc8

    if-eq v1, v3, :cond_0

    const/16 v3, 0x12c

    if-eq v1, v3, :cond_0

    const/16 v3, 0x1f4

    if-ne v1, v3, :cond_2

    :cond_0
    return v2

    :cond_1
    return v1

    :catch_0
    move-exception v1

    :cond_2
    return v0
.end method

.method static readFixed(Landroid/content/SharedPreferences;)Z
    .registers 3

    const-string v0, "nicoid_comment_length_include_fixed"

    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    return v1
.end method

.method static readLength(Landroid/content/SharedPreferences;)I
    .registers 4

    :try_start_0
    const-string v0, "nicoid_scrolling_comment_max_chars"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/NgCommentSettings;->parseLength(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return v0
.end method

.method static refreshLength(Landroid/preference/PreferenceActivity;)V
    .registers 4

    const-string v0, "nicoid_scrolling_comment_max_chars"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/NgCommentSettings;->lengthTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/NgCommentSettings;->sliderValue(Landroid/content/Context;)I

    move-result v1

    invoke-static {p0, v1}, Le/e/a/NgCommentSettings;->lengthSummary(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method static resetFixed(Landroid/widget/SeekBar;)V
    .registers 2

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of p0, v0, Landroid/widget/CheckBox;

    if-eqz p0, :cond_0

    check-cast v0, Landroid/widget/CheckBox;

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_0
    return-void
.end method

.method static saveLength(Landroid/content/Context;ILandroid/preference/Preference;Z)V
    .registers 9

    const/16 v0, 0x65

    if-ne p1, v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    move v0, p1

    :goto_0
    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "nicoid_scrolling_comment_max_chars"

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "nicoid_comment_length_include_fixed"

    invoke-interface {v2, v3, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p0, p1}, Le/e/a/NgCommentSettings;->lengthSummary(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-static {v1}, Le/e/a/NgCommentSettings;->readLength(Landroid/content/SharedPreferences;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "saved="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " readback="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " includeFixed="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Le/e/a/NgCommentSettings;->readFixed(Landroid/content/SharedPreferences;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "nicoid-comment-length"

    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static show(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 10
    new-instance v0, Le/e/a/NgCommentSettings$ListDialog;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$ListDialog;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0}, Le/e/a/NgCommentSettings$ListDialog;->show()V

    return-void
.end method

.method static sliderValue(Landroid/content/Context;)I
    .registers 2

    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {v0}, Le/e/a/NgCommentSettings;->readLength(Landroid/content/SharedPreferences;)I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x65

    :cond_0
    return v0
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 6
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static typeLabel(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 9
    const-string v0, "word"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "Blocked word"

    const-string v0, "\u5c01\u9396\u6587\u5b57"

    const-string v1, "NG\u30ef\u30fc\u30c9"

    :goto_0
    invoke-static {p0, v1, p1, v0}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_0
    const-string v0, "id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "Blocked user"

    const-string v0, "\u5c01\u9396\u4f7f\u7528\u8005"

    const-string v1, "NG\u30e6\u30fc\u30b6\u30fc"

    goto :goto_0

    :cond_1
    const-string v0, "command"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "Blocked command"

    const-string v0, "\u5c01\u9396\u6307\u4ee4"

    const-string v1, "NG\u30b3\u30de\u30f3\u30c9"

    goto :goto_0

    :cond_2
    :goto_1
    return-object p1
.end method
