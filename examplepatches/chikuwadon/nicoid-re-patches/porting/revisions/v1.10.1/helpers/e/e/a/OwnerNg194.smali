.class public final Le/e/a/OwnerNg194;
.super Ljava/lang/Object;
.source "OwnerNg194.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static confirmOwner(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 11

    .line 5
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    instance-of v1, v0, Landroid/app/Activity;

    if-nez v1, :cond_9

    return-void

    :cond_9
    move-object v5, v0

    check-cast v5, Landroid/app/Activity;

    const-string v0, "videourl"

    invoke-static {p2, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le/e/a/OwnerNg194$$ExternalSyntheticLambda1;

    move-object v2, v1

    move-object v4, p2

    move-object v6, p0

    move-object v7, p1

    invoke-direct/range {v2 .. v7}, Le/e/a/OwnerNg194$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/Object;Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;)V

    const-string p0, "nicoid-owner-rule"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/String;Ljava/lang/Object;Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;)V
    .registers 7

    .line 5
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, v0}, Le/e/a/VideoMetadata192;->watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p1, p0}, Le/e/a/ContentFilterId193;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_13

    goto :goto_1b

    :catch_13
    move-exception p0

    const-string v0, "nicoid-filter"

    const-string v1, "Uploader ID unavailable"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1b
    :goto_1b
    new-instance p0, Le/e/a/OwnerNg194$$ExternalSyntheticLambda0;

    invoke-direct {p0, p2, p3, p4, p1}, Le/e/a/OwnerNg194$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_7

    return-void

    :cond_7
    :try_start_7
    invoke-static {p1, p2, p3}, Le/e/a/ContentFilterId193;->confirmOwner(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_b

    goto :goto_1a

    :catch_b
    move-exception p0

    const-string p0, "\u6295\u7a3f\u8005\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-static {p1, p0, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_1a
    return-void
.end method
