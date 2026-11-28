.class public final Le/e/a/Dev114;
.super Ljava/lang/Object;
.source "Dev114.java"


# static fields
.field public static final UNLIMITED:I = -0x1


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)I
    .registers 2
    .param p0, "x0"    # I

    .line 15
    invoke-static {p0}, Le/e/a/Dev114;->fromProgress(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Landroid/content/Context;I)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # I

    .line 15
    invoke-static {p0, p1}, Le/e/a/Dev114;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static effectiveLimit(I)I
    .registers 2
    .param p0, "original"    # I

    .line 34
    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    const v0, 0x7fffffff

    return v0

    .line 35
    :cond_0
    if-lez p0, :cond_1

    const/16 v0, 0x2710

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static fromProgress(I)I
    .registers 2
    .param p0, "p"    # I

    .line 31
    const/16 v0, 0x15

    if-lt p0, v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    mul-int/lit16 v0, p0, 0x1f4

    :goto_0
    return v0
.end method

.method public static installSettings(Landroid/preference/PreferenceActivity;)V
    .registers 7
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 44
    const-string v0, "comment_fetch_limit"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 45
    .local v1, "option":Landroid/preference/Preference;
    if-nez v1, :cond_0

    return-void

    .line 46
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 47
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const/4 v3, 0x0

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 48
    .local v0, "current":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, v0}, Le/e/a/Dev114;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\u53d6\u5f97\u53ef\u80fd\u306a\u7bc4\u56f2\u3067\u30b3\u30e1\u30f3\u30c8\u3092\u8aad\u307f\u8fbc\u307f\u307e\u3059\u3002\u5b9f\u969b\u306e\u53d6\u5f97\u6570\u306f\u52d5\u753b\u306b\u3088\u3063\u3066\u7570\u306a\u308a\u307e\u3059"

    const-string v5, "Load comments where available. The actual number varies by video."

    invoke-static {p0, v4, v5}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 51
    new-instance v3, Le/e/a/Dev114$2;

    invoke-direct {v3, p0, v2, v1}, Le/e/a/Dev114$2;-><init>(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Landroid/preference/Preference;)V

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 86
    return-void
.end method

.method private static label(Landroid/content/Context;I)Ljava/lang/String;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "limit"    # I

    .line 23
    if-nez p1, :cond_0

    const-string/jumbo v0, "\u6a19\u6e96\uff08\u8ffd\u52a0\u53d6\u5f97\u306a\u3057\uff09"

    const-string v1, "Standard (no extra requests)"

    invoke-static {p0, v0, v1}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 24
    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    const-string/jumbo v0, "\u7121\u5236\u9650"

    const-string v1, "Unlimited"

    invoke-static {p0, v0, v1}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 25
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u4ef6"

    const-string v2, " comments"

    invoke-static {p0, v1, v2}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$installSettings$0(Landroid/widget/SeekBar;Landroid/content/SharedPreferences;Landroid/preference/Preference;Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;I)V
    .registers 10
    .param p0, "slider"    # Landroid/widget/SeekBar;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "option"    # Landroid/preference/Preference;
    .param p3, "activity"    # Landroid/preference/PreferenceActivity;
    .param p4, "d"    # Landroid/content/DialogInterface;
    .param p5, "w"    # I

    .line 76
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-static {v0}, Le/e/a/Dev114;->fromProgress(I)I

    move-result v0

    .line 77
    .local v0, "selected":I
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "comment_fetch_limit"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p3, v0}, Le/e/a/Dev114;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u53d6\u5f97\u53ef\u80fd\u306a\u7bc4\u56f2\u3067\u30b3\u30e1\u30f3\u30c8\u3092\u8aad\u307f\u8fbc\u307f\u307e\u3059\u3002\u5b9f\u969b\u306e\u53d6\u5f97\u6570\u306f\u52d5\u753b\u306b\u3088\u3063\u3066\u7570\u306a\u308a\u307e\u3059"

    const-string v3, "Load comments where available. The actual number varies by video."

    invoke-static {p3, v2, v3}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 81
    return-void
.end method

.method static synthetic lambda$installSettings$1(Landroid/preference/PreferenceActivity;Landroid/content/SharedPreferences;Landroid/preference/Preference;Landroid/preference/Preference;)Z
    .registers 13
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "option"    # Landroid/preference/Preference;
    .param p3, "v"    # Landroid/preference/Preference;

    .line 52
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 53
    .local v0, "content":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 54
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x41c00000    # 24.0f

    mul-float v2, v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 55
    .local v2, "pad":I
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 56
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 57
    .local v3, "value":Landroid/widget/TextView;
    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 58
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 59
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    new-instance v4, Landroid/widget/SeekBar;

    invoke-direct {v4, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 61
    .local v4, "slider":Landroid/widget/SeekBar;
    const/16 v7, 0x15

    invoke-virtual {v4, v7}, Landroid/widget/SeekBar;->setMax(I)V

    .line 62
    const-string v7, "comment_fetch_limit"

    const/4 v8, 0x0

    invoke-interface {p1, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    invoke-static {v7}, Le/e/a/Dev114;->toProgress(I)I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 63
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v5

    invoke-static {v5}, Le/e/a/Dev114;->fromProgress(I)I

    move-result v5

    invoke-static {p0, v5}, Le/e/a/Dev114;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    new-instance v5, Le/e/a/Dev114$1;

    invoke-direct {v5, v3, p0}, Le/e/a/Dev114$1;-><init>(Landroid/widget/TextView;Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 72
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 73
    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570"

    const-string v7, "Comments to load"

    invoke-static {p0, v6, v7}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 74
    invoke-virtual {v5, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 75
    const-string v6, "OK"

    invoke-static {p0, v6, v6}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Le/e/a/Dev114$0;

    invoke-direct {v7, v4, p1, p2, p0}, Le/e/a/Dev114$0;-><init>(Landroid/widget/SeekBar;Landroid/content/SharedPreferences;Landroid/preference/Preference;Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 82
    const-string v6, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v7, "Cancel"

    invoke-static {p0, v6, v7}, Le/e/a/Dev114;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    .line 83
    .local v5, "dialog":Landroid/app/AlertDialog;
    invoke-static {v5}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 84
    return v1
.end method

.method public static memoryAvailable()Z
    .registers 6

    .line 39
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    .line 40
    .local v0, "vm":Ljava/lang/Runtime;
    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 41
    .local v1, "free":J
    const-wide/32 v3, 0x2000000

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3
.end method

.method private static toProgress(I)I
    .registers 3
    .param p0, "limit"    # I

    .line 28
    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    const/16 v0, 0x15

    goto :goto_0

    :cond_0
    div-int/lit16 v0, p0, 0x1f4

    const/16 v1, 0x14

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_0
    return v0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ja"    # Ljava/lang/String;
    .param p2, "en"    # Ljava/lang/String;

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ja"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    return-object v0
.end method
