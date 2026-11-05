.class public final Le/e/a/HistoryLimit120;
.super Ljava/lang/Object;
.source "HistoryLimit120.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/HistoryLimit120$Pending;
    }
.end annotation


# static fields
.field private static final KEY:Ljava/lang/String; = "local_watch_history_limit"

.field private static final MAX_STEP:I = 0x32

.field private static final pending:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Le/e/a/HistoryLimit120$Pending;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 20
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/HistoryLimit120;->pending:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;I)Ljava/lang/String;
    .registers 2

    .line 36
    invoke-static {p0, p1}, Le/e/a/HistoryLimit120;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static adjust(ILorg/json/JSONArray;Landroid/content/Context;)Lorg/json/JSONArray;
    .registers 12

    .line 96
    if-eqz p0, :cond_8b

    if-nez p1, :cond_6

    goto/16 :goto_8b

    .line 97
    :cond_6
    sget-object p0, Le/e/a/HistoryLimit120;->pending:Ljava/lang/ThreadLocal;

    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/HistoryLimit120$Pending;

    .line 98
    sget-object v0, Le/e/a/HistoryLimit120;->pending:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 99
    invoke-static {p2}, Le/e/a/HistoryLimit120;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v0, "local_watch_history_limit"

    const/4 v1, -0x1

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    .line 100
    if-ltz p2, :cond_8a

    if-eqz p0, :cond_8a

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Le/e/a/HistoryLimit120$Pending;->time:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x7d0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_8a

    .line 101
    iget-object v0, p0, Le/e/a/HistoryLimit120$Pending;->id:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Le/e/a/HistoryLimit120;->id(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_41

    goto :goto_8a

    .line 102
    :cond_41
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 103
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 104
    iget-object p0, p0, Le/e/a/HistoryLimit120$Pending;->prior:Lorg/json/JSONArray;

    const/4 v3, 0x2

    new-array v4, v3, [Lorg/json/JSONArray;

    aput-object p1, v4, v1

    const/4 p1, 0x1

    aput-object p0, v4, p1

    const/4 p0, 0x0

    :goto_56
    if-lt p0, v3, :cond_59

    .line 111
    return-object v0

    .line 104
    :cond_59
    aget-object p1, v4, p0

    .line 105
    const/4 v5, 0x0

    :goto_5c
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_87

    if-eqz p2, :cond_6b

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, p2, :cond_6b

    goto :goto_87

    .line 106
    :cond_6b
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 107
    invoke-static {v6}, Le/e/a/HistoryLimit120;->id(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    .line 108
    if-eqz v6, :cond_84

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_81

    invoke-interface {v2, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_84

    :cond_81
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 105
    :cond_84
    add-int/lit8 v5, v5, 0x1

    goto :goto_5c

    .line 104
    :cond_87
    :goto_87
    add-int/lit8 p0, p0, 0x1

    goto :goto_56

    .line 101
    :cond_8a
    :goto_8a
    return-object p1

    .line 96
    :cond_8b
    :goto_8b
    return-object p1
.end method

.method private static id(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 3

    .line 82
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_15

    :cond_5
    const-string v0, "videoId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "videourl"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_15
    return-object p0
.end method

.method private static label(Landroid/content/Context;I)Ljava/lang/String;
    .registers 5

    .line 37
    if-gez p1, :cond_d

    const-string p1, "Original setting"

    const-string v0, "\u539f\u59cb\u8a2d\u5b9a"

    const-string v1, "\u5f93\u6765\u306e\u8a2d\u5b9a"

    invoke-static {p0, v1, p1, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 38
    :cond_d
    if-nez p1, :cond_1a

    const-string p1, "Unlimited"

    const-string v0, "\u4e0d\u9650"

    const-string v1, "\u7121\u5236\u9650"

    invoke-static {p0, v1, p1, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 39
    :cond_1a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\u4ef6"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " entries"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " \u7b46"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, p1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/preference/Preference;Landroid/preference/Preference;)Z
    .registers 8

    .line 49
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    .line 50
    invoke-static {p2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 51
    invoke-static {v0}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    .line 52
    invoke-static {p0}, Le/e/a/HistoryLimit120;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "local_watch_history_limit"

    const/4 v3, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 53
    new-instance v2, Landroid/widget/SeekBar;

    invoke-direct {v2, p2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 54
    const/16 v3, 0x32

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 55
    const/4 v4, 0x1

    if-nez v1, :cond_24

    goto :goto_32

    :cond_24
    div-int/lit8 v1, v1, 0x64

    sub-int/2addr v1, v4

    const/16 v3, 0x31

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    :goto_32
    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 56
    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    invoke-static {v1}, Le/e/a/HistoryLimit120;->limit(I)I

    move-result v1

    invoke-static {p2, v1}, Le/e/a/HistoryLimit120;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x10

    invoke-static {p2, v1, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 58
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 59
    new-instance v3, Le/e/a/HistoryLimit120$1;

    invoke-direct {v3, v1, p2}, Le/e/a/HistoryLimit120$1;-><init>(Landroid/widget/TextView;Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 66
    invoke-static {p2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    .line 67
    new-instance v0, Le/e/a/HistoryLimit120$$ExternalSyntheticLambda1;

    invoke-direct {v0, v2, p0, p1}, Le/e/a/HistoryLimit120$$ExternalSyntheticLambda1;-><init>(Landroid/widget/SeekBar;Landroid/app/Activity;Landroid/preference/Preference;)V

    const p0, 0x104000a

    invoke-virtual {p2, p0, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 71
    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 66
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 72
    return v4
.end method

.method static synthetic lambda$1(Landroid/widget/SeekBar;Landroid/app/Activity;Landroid/preference/Preference;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 68
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    invoke-static {p0}, Le/e/a/HistoryLimit120;->limit(I)I

    move-result p0

    .line 69
    invoke-static {p1}, Le/e/a/HistoryLimit120;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string p4, "local_watch_history_limit"

    invoke-interface {p3, p4, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 70
    invoke-static {p1, p0}, Le/e/a/HistoryLimit120;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 71
    return-void
.end method

.method static limit(I)I
    .registers 2

    .line 78
    const/16 v0, 0x32

    if-ne p0, v0, :cond_6

    const/4 p0, 0x0

    goto :goto_a

    :cond_6
    add-int/lit8 p0, p0, 0x1

    mul-int/lit8 p0, p0, 0x64

    :goto_a
    return p0
.end method

.method private static preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 33
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static remember(Lorg/json/JSONObject;)V
    .registers 9

    .line 86
    sget-object v0, Le/e/a/HistoryLimit120;->pending:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 87
    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    .line 88
    if-eqz v0, :cond_61

    invoke-static {v0}, Le/e/a/HistoryLimit120;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "local_watch_history_limit"

    const/4 v3, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-ltz v1, :cond_61

    invoke-static {p0}, Le/e/a/HistoryLimit120;->id(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_21

    goto :goto_61

    .line 90
    :cond_21
    :try_start_21
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Landroid/content/Context;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v6

    aput-object v0, v3, v7

    const/4 v0, 0x0

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 91
    instance-of v1, v0, Lorg/json/JSONArray;

    if-eqz v1, :cond_60

    sget-object v1, Le/e/a/HistoryLimit120;->pending:Ljava/lang/ThreadLocal;

    new-instance v2, Le/e/a/HistoryLimit120$Pending;

    invoke-static {p0}, Le/e/a/HistoryLimit120;->id(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    check-cast v0, Lorg/json/JSONArray;

    invoke-direct {v2, p0, v0}, Le/e/a/HistoryLimit120$Pending;-><init>(Ljava/lang/String;Lorg/json/JSONArray;)V

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_5d
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_21 .. :try_end_5d} :catch_5e

    goto :goto_5f

    .line 92
    :catch_5e
    move-exception p0

    :goto_5f
    nop

    .line 93
    :cond_60
    return-void

    .line 88
    :cond_61
    :goto_61
    return-void
.end method

.method static settings(Landroid/app/Activity;Landroid/preference/PreferenceGroup;)V
    .registers 7

    .line 43
    const-string v0, "local_watch_history_limit"

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    .line 44
    :cond_9
    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 45
    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 46
    const-string v2, "Local watch history limit"

    const-string v3, "\u88dd\u7f6e\u89c0\u770b\u7d00\u9304\u4e0a\u9650"

    const-string v4, "\u672c\u4f53\u306e\u8996\u8074\u5c65\u6b74\u306e\u4fdd\u5b58\u6570"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 47
    invoke-static {p0}, Le/e/a/HistoryLimit120;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const/4 v3, -0x1

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {p0, v0}, Le/e/a/HistoryLimit120;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 48
    new-instance v0, Le/e/a/HistoryLimit120$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, v1}, Le/e/a/HistoryLimit120$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Landroid/preference/Preference;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 74
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 75
    return-void
.end method
