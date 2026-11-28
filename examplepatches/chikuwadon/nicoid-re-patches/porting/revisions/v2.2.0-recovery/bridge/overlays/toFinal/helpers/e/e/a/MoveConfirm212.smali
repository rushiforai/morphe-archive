.class public final Le/e/a/MoveConfirm212;
.super Ljava/lang/Object;
.source "MoveConfirm212.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static canConfirm(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/Set<",
            "*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 77
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    invoke-static {p1, p2, p3}, Le/e/a/MoveConfirm212;->sameSelection(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p0, 0x1

    return p0

    .line 79
    :cond_1
    const-string p1, "Selection changed. Select the videos again."

    const-string/jumbo p2, "\u9078\u64c7\u5df2\u8b8a\u66f4\uff0c\u8acb\u91cd\u65b0\u9078\u53d6\u5f71\u7247\u3002"

    const-string/jumbo p3, "\u9078\u629e\u304c\u5909\u66f4\u3055\u308c\u307e\u3057\u305f\u3002\u9078\u3073\u76f4\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p0, p3, p1, p2}, Le/e/a/MoveConfirm212;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 81
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 82
    return v0

    .line 77
    :cond_2
    :goto_0
    return v0
.end method

.method private static dialog(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;
    .registers 7

    .line 40
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "builder"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 41
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 43
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 44
    :catch_0
    move-exception v0

    .line 45
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private static dialogContext(Landroid/app/Activity;)Landroid/content/Context;
    .registers 7

    .line 29
    :try_start_0
    const-string v0, "e.e.a.PlaybackSession"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "dialogContext"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 30
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 32
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 33
    :catch_0
    move-exception v0

    .line 34
    return-object p0
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 23
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$wrapLocal$0(Ljava/util/Set;Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/Consumer;Ljava/lang/String;)V
    .registers 16

    .line 91
    const-string/jumbo v0, "\u79fb\u52d5"

    if-eqz p5, :cond_2

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_1

    .line 93
    :cond_0
    :try_start_0
    invoke-static {p1, p2, p3, p0}, Le/e/a/MoveConfirm212;->canConfirm(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 94
    :cond_1
    invoke-static {p1}, Le/e/a/MoveConfirm212;->dialogContext(Landroid/app/Activity;)Landroid/content/Context;

    move-result-object v1

    .line 95
    invoke-static {p1, p5}, Le/e/a/MoveConfirm212;->localFolderName(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 96
    invoke-static {v1}, Le/e/a/MoveConfirm212;->dialog(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string/jumbo v4, "\u9078\u629e\u3057\u305f\u52d5\u753b\u3092\u79fb\u52d5\u3057\u307e\u3059\u304b\uff1f"

    const-string v5, "Move selected videos?"

    const-string/jumbo v6, "\u79fb\u52d5\u6240\u9078\u5f71\u7247\uff1f"

    .line 97
    invoke-static {v1, v4, v5, v6}, Le/e/a/MoveConfirm212;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "\u79fb\u52d5\u3059\u308b\u52d5\u753b\uff1a"

    const-string v6, "Videos: "

    const-string/jumbo v7, "\u5f71\u7247\u6578\uff1a"

    .line 99
    invoke-static {v1, v5, v6, v7}, Le/e/a/MoveConfirm212;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\u79fb\u52d5\u5148\uff1a"

    const-string v6, "Destination: "

    const-string/jumbo v7, "\u76ee\u7684\u5730\uff1a"

    .line 100
    invoke-static {v1, v5, v6, v7}, Le/e/a/MoveConfirm212;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 99
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v4, "Cancel"

    const-string v5, "\u53d6\u6d88"

    .line 101
    invoke-static {v1, v3, v4, v5}, Le/e/a/MoveConfirm212;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Move"

    .line 102
    invoke-static {v1, v0, v3, v0}, Le/e/a/MoveConfirm212;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Le/e/a/MoveConfirm212$0;

    move-object v7, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v8, p4

    move-object v9, p5

    invoke-direct/range {v3 .. v9}, Le/e/a/MoveConfirm212$0;-><init>(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;Ljava/util/function/Consumer;Ljava/lang/String;)V

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 108
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    move-object p0, v0

    .line 110
    const-string p1, "nicoid-bulk"

    const-string p2, "Local move confirmation failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 112
    :goto_0
    return-void

    .line 91
    :cond_2
    :goto_1
    return-void
.end method

.method static synthetic lambda$wrapLocal$1(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;Ljava/util/function/Consumer;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 8

    .line 104
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Le/e/a/MoveConfirm212;->canConfirm(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-interface {p4, p5}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    :cond_0
    goto :goto_0

    .line 105
    :catch_0
    move-exception p0

    .line 106
    const-string p1, "nicoid-bulk"

    const-string p2, "Local move unavailable"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 108
    :goto_0
    return-void
.end method

.method static synthetic lambda$wrapLocal$2(Ljava/lang/String;)V
    .registers 1

    .line 115
    return-void
.end method

.method private static localFolderName(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    const-string p1, "Unfiled videos"

    const-string/jumbo v0, "\u672a\u5206\u985e\u5f71\u7247"

    const-string/jumbo v1, "\u672a\u5206\u985e\u306e\u52d5\u753b"

    invoke-static {p0, v1, p1, v0}, Le/e/a/MoveConfirm212;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 59
    :cond_0
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "nicoid_local_playlists_v1"

    const-string v1, "{}"

    .line 60
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "folders"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 62
    if-eqz p0, :cond_2

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 63
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 64
    if-eqz v1, :cond_1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 65
    const-string p0, "name"

    invoke-virtual {v1, p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 62
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 67
    :catch_0
    move-exception p0

    :cond_2
    nop

    .line 68
    return-object p1
.end method

.method private static sameSelection(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/Set<",
            "*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 72
    const-string v0, "folder"

    invoke-static {p0, v0}, Le/e/a/MoveConfirm212;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "selected"

    invoke-static {p0, p1}, Le/e/a/MoveConfirm212;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p2, p0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 50
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 51
    const-string v0, "ja"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "zh"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    move-object p1, p3

    goto :goto_0

    :cond_1
    move-object p1, p2

    :goto_0
    return-object p1
.end method

.method public static wrapLocal(Ljava/lang/Object;Ljava/util/function/Consumer;)Ljava/util/function/Consumer;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 87
    :try_start_0
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/MoveConfirm212;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/app/Activity;

    .line 88
    const-string v0, "folder"

    invoke-static {p0, v0}, Le/e/a/MoveConfirm212;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 89
    new-instance v2, Ljava/util/HashSet;

    const-string v0, "selected"

    invoke-static {p0, v0}, Le/e/a/MoveConfirm212;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-direct {v2, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 90
    new-instance v1, Le/e/a/MoveConfirm212$1;

    move-object v4, p0

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Le/e/a/MoveConfirm212$1;-><init>(Ljava/util/Set;Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/Consumer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 113
    :catch_0
    move-exception v0

    move-object p0, v0

    .line 114
    const-string p1, "nicoid-bulk"

    const-string v0, "Unable to snapshot local move selection"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 115
    new-instance p0, Le/e/a/MoveConfirm212$2;

    invoke-direct {p0}, Le/e/a/MoveConfirm212$2;-><init>()V

    return-object p0
.end method
