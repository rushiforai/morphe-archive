.class public final Le/e/a/HistorySupport;
.super Ljava/lang/Object;
.source "HistorySupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/HistorySupport$Record;
    }
.end annotation


# static fields
.field private static final CACHED:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private static final OWNERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final RECORDS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/HistorySupport$Record;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/HistorySupport;->OWNERS:Ljava/util/Map;

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    .line 11
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bindAccount(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ReflectiveOperationException;
        }
    .end annotation

    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "e"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    const-string v0, "nicoid_history_posted"

    const/16 v1, 0x8

    const/4 v2, 0x4

    if-eq p1, v2, :cond_21

    if-eq p1, v1, :cond_21

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_20

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_20
    return-void

    .line 31
    :cond_21
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-string v6, "a"

    invoke-virtual {v3, v6, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 32
    new-array v5, v4, [Ljava/lang/Object;

    const-string v6, "posttime"

    aput-object v6, v5, v7

    invoke-virtual {v3, p2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    new-array v6, v4, [Ljava/lang/Object;

    const-string v8, "videoinfo"

    aput-object v8, v6, v7

    invoke-virtual {v3, p2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 33
    const v6, 0x7f08015e

    invoke-virtual {p0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    const v8, 0x7f0801d3

    invoke-virtual {p0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const v9, 0x7f0801e2

    invoke-virtual {p0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 34
    if-eqz v6, :cond_86

    if-eqz v5, :cond_86

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    if-ne p1, v2, :cond_7f

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    const v11, 0x7f0f0215

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5, v10}, Le/e/a/HistoryRules;->accountViewedAt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_7f
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v5, 0x0

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 35
    :cond_86
    sget-object v5, Le/e/a/HistorySupport;->OWNERS:Ljava/util/Map;

    invoke-interface {v5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, ""

    if-eqz v5, :cond_98

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_b5

    :cond_98
    :try_start_98
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v10, "y"

    invoke-virtual {v5, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v10, "null"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_b0} :catch_b3

    if-eqz v10, :cond_b5

    goto :goto_b4

    :catch_b3
    move-exception v5

    :goto_b4
    move-object v5, v6

    .line 36
    :cond_b5
    if-eqz v9, :cond_c7

    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_c3

    const/16 v5, 0x8

    goto :goto_c4

    :cond_c3
    const/4 v5, 0x0

    :goto_c4
    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 37
    :cond_c7
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    .line 38
    instance-of v9, v5, Landroid/widget/TextView;

    if-eqz v9, :cond_d2

    check-cast v5, Landroid/widget/TextView;

    goto :goto_102

    .line 39
    :cond_d2
    new-instance v5, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v5, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextSize(F)V

    if-eqz v8, :cond_102

    invoke-virtual {v8}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_102

    invoke-virtual {v8}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v9

    add-int/2addr v9, v4

    new-instance v10, Landroid/view/ViewGroup$LayoutParams;

    const/4 v11, -0x1

    const/4 v12, -0x2

    invoke-direct {v10, v11, v12}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v9, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 40
    :cond_102
    :goto_102
    if-eqz v8, :cond_1b0

    if-nez v3, :cond_108

    goto/16 :goto_1b0

    .line 41
    :cond_108
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_116

    move-object v9, v0

    goto :goto_11a

    :cond_116
    invoke-virtual {v0, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    :goto_11a
    invoke-static {v8, v9}, Le/e/a/VideoCounts;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 42
    sget-object v9, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v9, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/HistorySupport$Record;

    if-nez v9, :cond_128

    goto :goto_12a

    :cond_128
    iget-object v6, v9, Le/e/a/HistorySupport$Record;->postedText:Ljava/lang/String;

    .line 43
    :goto_12a
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_136

    const-string v6, "postedAt"

    invoke-static {p2, v6}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 44
    :cond_136
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_149

    if-ne p1, v2, :cond_149

    if-ltz v3, :cond_149

    add-int/2addr v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 45
    :cond_149
    invoke-static {v6}, Le/e/a/HistorySortRules;->watched(Ljava/lang/String;)J

    move-result-wide p1

    const-wide/16 v2, 0x0

    cmp-long v0, p1, v2

    if-lez v0, :cond_19a

    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v2, 0x7f0f004d

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string p0, "Asia/Tokyo"

    invoke-static {p0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance p0, Ljava/lang/StringBuilder;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\u6295\u7a3f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 46
    :cond_19a
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v8}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result p0

    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_1ab

    goto :goto_1ac

    :cond_1ab
    const/4 v1, 0x0

    :goto_1ac
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 47
    return-void

    .line 40
    :cond_1b0
    :goto_1b0
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public static capture(Ljava/lang/Object;Lorg/json/JSONObject;)V
    .registers 10

    invoke-static {p0, p1}, Le/e/a/ContentFilterId193;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V

    .line 15
    const-string v0, "channel"

    const-string v1, "owner"

    const-string v2, "user"

    filled-new-array {v1, v2, v0}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    const/4 v3, 0x0

    move-object v4, v1

    :goto_11
    const/4 v5, 0x3

    if-lt v3, v5, :cond_15

    :goto_14
    goto :goto_44

    :cond_15
    aget-object v5, v0, v3

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_9a

    const-string v4, "name"

    invoke-virtual {v5, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "nickname"

    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_3d

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_3d

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_3d
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_9a

    goto :goto_14

    :goto_44
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_56

    const-string v0, "uploaderName"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "ownerName"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_56
    sget-object v0, Le/e/a/HistorySupport;->OWNERS:Ljava/util/Map;

    invoke-interface {v0, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/HistorySupport$Record;

    if-nez v0, :cond_6f

    new-instance v0, Le/e/a/HistorySupport$Record;

    invoke-direct {v0}, Le/e/a/HistorySupport$Record;-><init>()V

    sget-object v2, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6f
    const-string p0, "first_retrieve"

    invoke-virtual {p1, p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "postedAt"

    invoke-virtual {p1, v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "registeredAt"

    invoke-virtual {p1, v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Le/e/a/HistorySupport$Record;->postedText:Ljava/lang/String;

    iget-object p0, v0, Le/e/a/HistorySupport$Record;->postedText:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v0, Le/e/a/HistorySupport$Record;->posted:J

    const-string p0, "count"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_99

    invoke-static {p0}, Le/e/a/HistorySupport;->statistics(Lorg/json/JSONObject;)[J

    move-result-object p0

    iput-object p0, v0, Le/e/a/HistorySupport$Record;->counts:[J

    :cond_99
    return-void

    :cond_9a
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_11
.end method

.method public static capture(Ljava/lang/Object;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .registers 4

    .line 17
    invoke-static {p0, p1}, Le/e/a/HistorySupport;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V

    sget-object p1, Le/e/a/HistorySupport;->OWNERS:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_13

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1e

    :cond_13
    if-eqz p2, :cond_1e

    sget-object p1, Le/e/a/HistorySupport;->OWNERS:Ljava/util/Map;

    invoke-static {p2}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    sget-object p1, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/HistorySupport$Record;

    if-eqz p2, :cond_34

    const-string p1, "viewedAt"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/HistorySortRules;->watched(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/HistorySupport$Record;->watched:J

    :cond_34
    return-void
.end method

.method public static captureLocal(Ljava/lang/Object;Lorg/json/JSONObject;)V
    .registers 4

    .line 18
    invoke-static {p0, p1}, Le/e/a/HistorySupport;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V

    sget-object v0, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/HistorySupport$Record;

    const-string v0, "posttime"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/HistorySupport$Record;->watched:J

    const-string v0, "viewCount"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/HistorySupport$Record;->views:J

    const-string v0, "videoCounts"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_29

    invoke-static {p1}, Le/e/a/HistorySupport;->statistics(Lorg/json/JSONObject;)[J

    move-result-object p1

    iput-object p1, p0, Le/e/a/HistorySupport$Record;->counts:[J

    :cond_29
    return-void
.end method

.method static counts(Ljava/lang/Object;)[J
    .registers 2

    .line 21
    sget-object v0, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/HistorySupport$Record;

    if-nez p0, :cond_c

    const/4 p0, 0x0

    goto :goto_e

    :cond_c
    iget-object p0, p0, Le/e/a/HistorySupport$Record;->counts:[J

    :goto_e
    return-object p0
.end method

.method static enrichCached(Lorg/json/JSONObject;)V
    .registers 8

    .line 13
    const-string v0, "videourl"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    monitor-enter v1

    :try_start_d
    sget-object v2, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-nez v0, :cond_19

    monitor-exit v1

    return-void

    :cond_19
    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "postedAt"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "ownerName"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    :goto_26
    if-lt v5, v2, :cond_2a

    monitor-exit v1

    return-void

    :cond_2a
    aget-object v4, v3, v5

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_41

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6
    :try_end_36
    .catchall {:try_start_d .. :try_end_36} :catchall_44

    if-eqz v6, :cond_41

    :try_start_38
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3f
    .catch Lorg/json/JSONException; {:try_start_38 .. :try_end_3f} :catch_40
    .catchall {:try_start_38 .. :try_end_3f} :catchall_44

    goto :goto_41

    :catch_40
    move-exception v4

    :cond_41
    :goto_41
    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    :catchall_44
    move-exception p0

    :try_start_45
    monitor-exit v1
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_44

    throw p0
.end method

.method public static format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 27
    const-string p0, "<b>%s</b> <font color=\'red\'>%s\u56de\u8996\u8074</font>"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 19
    const-string v0, "viewCount"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p1, "view"

    goto :goto_23

    :cond_b
    const-string v0, "commentCount"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string p1, "comment"

    goto :goto_23

    :cond_16
    const-string v0, "likeCount"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    const-string p1, "like"

    goto :goto_23

    :cond_21
    const-string p1, "mylist"

    :goto_23
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2b

    goto :goto_2f

    :cond_2b
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_2f
    return-object v1
.end method

.method static owner(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 20
    sget-object v0, Le/e/a/HistorySupport;->OWNERS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method static posted(Ljava/lang/Object;)J
    .registers 3

    .line 23
    sget-object v0, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/HistorySupport$Record;

    if-eqz v0, :cond_d

    iget-wide v0, v0, Le/e/a/HistorySupport$Record;->posted:J

    goto :goto_17

    :cond_d
    const-string v0, "postedAt"

    invoke-static {p0, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistorySortRules;->watched(Ljava/lang/String;)J

    move-result-wide v0

    :goto_17
    return-wide v0
.end method

.method static rememberCached(Landroid/os/Bundle;)V
    .registers 8

    .line 12
    const-string v0, "videoId"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_e
    const-string v2, "postedAt"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1c

    const-string v2, "first_retrieve"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_1c
    if-eqz v2, :cond_23

    const-string v3, "postedAt"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_23
    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "ownerName"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "uploaderName"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-string v4, "userNickname"

    const/4 v6, 0x2

    aput-object v4, v3, v6

    :goto_35
    if-lt v5, v2, :cond_38

    :goto_37
    goto :goto_4c

    :cond_38
    aget-object v4, v3, v5

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_77

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_77

    const-string p0, "ownerName"

    invoke-virtual {v1, p0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_37

    :goto_4c
    sget-object p0, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    monitor-enter p0
    :try_end_4f
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_4f} :catch_7a

    :try_start_4f
    sget-object v2, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_54
    sget-object v0, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    const/16 v1, 0x80

    if-gt v0, v1, :cond_60

    monitor-exit p0

    goto :goto_7b

    :cond_60
    sget-object v0, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    sget-object v1, Le/e/a/HistorySupport;->CACHED:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_54

    :catchall_74
    move-exception v0

    monitor-exit p0
    :try_end_76
    .catchall {:try_start_4f .. :try_end_76} :catchall_74

    :try_start_76
    throw v0
    :try_end_77
    .catch Lorg/json/JSONException; {:try_start_76 .. :try_end_77} :catch_7a

    :cond_77
    add-int/lit8 v5, v5, 0x1

    goto :goto_35

    :catch_7a
    move-exception p0

    :goto_7b
    return-void
.end method

.method static statistics(Lorg/json/JSONObject;)[J
    .registers 2

    .line 19
    new-instance v0, Le/e/a/HistorySupport$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/HistorySupport$$ExternalSyntheticLambda0;-><init>(Lorg/json/JSONObject;)V

    invoke-static {v0}, Le/e/a/VideoInfoCounts;->read(Le/e/a/VideoInfoCounts$Values;)[J

    move-result-object p0

    return-object p0
.end method

.method static views(Ljava/lang/Object;)J
    .registers 3

    .line 24
    sget-object v0, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/HistorySupport$Record;

    if-nez p0, :cond_d

    const-wide/16 v0, 0x0

    goto :goto_f

    :cond_d
    iget-wide v0, p0, Le/e/a/HistorySupport$Record;->views:J

    :goto_f
    return-wide v0
.end method

.method static watched(Ljava/lang/Object;)J
    .registers 7

    .line 22
    sget-object v0, Le/e/a/HistorySupport;->RECORDS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/HistorySupport$Record;

    if-eqz v0, :cond_15

    iget-wide v1, v0, Le/e/a/HistorySupport$Record;->watched:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_15

    iget-wide v0, v0, Le/e/a/HistorySupport$Record;->watched:J

    goto :goto_1f

    :cond_15
    const-string v0, "posttime"

    invoke-static {p0, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistorySortRules;->watched(Ljava/lang/String;)J

    move-result-wide v0

    :goto_1f
    return-wide v0
.end method

.method public static write(ILorg/json/JSONArray;Landroid/content/Context;)I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 49
    const-string v0, "e.e.a.v0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Lorg/json/JSONArray;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-class v3, Landroid/content/Context;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "a"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 50
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    aput-object p1, v1, v5

    aput-object p2, v1, v6

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 49
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    .line 51
    if-ne p0, v5, :cond_38

    .line 55
    return p0

    .line 52
    :cond_38
    const-string p0, "\u5c65\u6b74\u3092\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, v5}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 53
    new-instance p0, Ljava/io/IOException;

    const-string p1, "History could not be saved"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
