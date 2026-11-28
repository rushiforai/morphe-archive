.class public final Le/e/a/FeedbackDev10;
.super Ljava/lang/Object;
.source "FeedbackDev10.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FeedbackDev10$NgAdapter;
    }
.end annotation


# static fields
.field private static final main:Landroid/os/Handler;

.field private static final workers:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    .line 20
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/FeedbackDev10;->workers:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 18
    sget-object v0, Le/e/a/FeedbackDev10;->workers:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$100()Landroid/os/Handler;
    .registers 1

    .line 18
    sget-object v0, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    return-object v0
.end method

.method static varargs call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "e.e.a."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static color(Landroid/view/View;)I
    .registers 7

    .line 34
    :try_start_0
    const-string v0, "ThemeChoice"

    const-string v1, "textColor"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/view/View;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    rem-int/lit8 p0, p0, 0x20

    const/16 v0, 0x10

    if-ne p0, v0, :cond_0

    const p0, -0xdfdedc

    goto :goto_0

    :cond_0
    const p0, -0x111112

    :goto_0
    return p0
.end method

.method static cookie()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "VideoExtras"

    const-string v3, "cookie"

    invoke-static {v2, v3, v1, v0}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static decorate(Ljava/lang/Object;Landroid/view/View;)V
    .registers 12

    .line 75
    const-string v0, "taglist"

    const-string v1, "nicoid_series"

    :try_start_0
    const-string v2, "i0"

    invoke-static {p0, v2}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    invoke-virtual {v2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    .line 76
    :cond_0
    invoke-static {p1, v0}, Le/e/a/FeedbackDev10;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    .line 77
    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/String;

    const-string v5, "Y"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-string v5, "Z"

    const/4 v7, 0x1

    aput-object v5, v4, v7

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_2

    aget-object v8, v4, v5

    if-nez p1, :cond_1

    invoke-static {p0, v8}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    instance-of v9, v8, Landroid/view/View;

    if-eqz v9, :cond_1

    check-cast v8, Landroid/view/View;

    invoke-static {v8, v0}, Le/e/a/FeedbackDev10;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 78
    :cond_2
    if-eqz p1, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p0, p0, Landroid/widget/LinearLayout;

    if-nez p0, :cond_3

    goto :goto_1

    .line 79
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 80
    :cond_4
    const-string v0, "VideoExtras"

    const-string v1, "series"

    const/4 v4, 0x3

    new-array v5, v4, [Ljava/lang/Class;

    const-class v8, Landroid/widget/LinearLayout;

    aput-object v8, v5, v6

    const-class v8, Landroid/view/View;

    aput-object v8, v5, v7

    const-class v8, Lorg/json/JSONObject;

    aput-object v8, v5, v3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v6

    aput-object p1, v4, v7

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    aput-object p0, v4, v3

    invoke-static {v0, v1, v5, v4}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    goto :goto_2

    .line 78
    :cond_5
    :goto_1
    return-void

    .line 81
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    .line 82
    :goto_2
    return-void
.end method

.method static dp(Landroid/content/Context;I)I
    .registers 2

    .line 33
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 72
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Landroid/view/View;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v3

    aput-object p1, v0, v4

    const-string p0, "VideoExtras"

    const-string p1, "find"

    invoke-static {p0, p1, v1, v0}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
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

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static hideSeekHint(Landroid/view/ViewGroup;)V
    .registers 4

    .line 118
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    instance-of v2, v1, Landroid/widget/Button;

    if-nez v2, :cond_0

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_0
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1}, Le/e/a/FeedbackDev10;->hideSeekHint(Landroid/view/ViewGroup;)V

    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static installNg(Ljava/lang/Object;)V
    .registers 10

    .line 101
    :try_start_0
    invoke-static {p0}, Le/e/a/FeedbackDev10;->themeNg(Ljava/lang/Object;)V

    const-string v0, "e0"

    invoke-static {p0, v0}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    if-nez v0, :cond_0

    return-void

    .line 102
    :cond_0
    const-string v1, "f0"

    invoke-static {p0, v1}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/BaseAdapter;

    .line 103
    const-string v2, "c0"

    invoke-static {p0, v2}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 104
    new-instance v3, Le/e/a/FeedbackDev10$NgAdapter;

    invoke-direct {v3, v0, v1, v2}, Le/e/a/FeedbackDev10$NgAdapter;-><init>(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V

    .line 105
    const-string v4, "Z"

    invoke-static {p0, v4}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 106
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "comment_message"

    const-string v7, "id"

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 107
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 108
    if-eqz v5, :cond_2

    const-string/jumbo v6, "\u767b\u9332\u6e08\u307f\u306eNG\u8a2d\u5b9a\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v6}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v5}, Le/e/a/FeedbackDev10;->color(Landroid/view/View;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1}, Landroid/widget/BaseAdapter;->getCount()I

    move-result v6

    if-nez v6, :cond_1

    const/4 v6, 0x0

    goto :goto_0

    :cond_1
    const/16 v6, 0x8

    :goto_0
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 109
    :cond_2
    new-instance v6, Le/e/a/FeedbackDev10$1;

    invoke-direct {v6, v3, v5, v1}, Le/e/a/FeedbackDev10$1;-><init>(Le/e/a/FeedbackDev10$NgAdapter;Landroid/widget/TextView;Landroid/widget/BaseAdapter;)V

    invoke-virtual {v1, v6}, Landroid/widget/BaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 110
    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->list(Landroid/widget/AbsListView;)V

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 112
    const-string v3, "Y"

    invoke-static {p0, v3}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of v3, p0, Landroid/view/ViewGroup;

    if-eqz v3, :cond_3

    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {p0}, Le/e/a/FeedbackDev10;->hideSeekHint(Landroid/view/ViewGroup;)V

    .line 113
    :cond_3
    instance-of p0, v4, Landroid/view/ViewGroup;

    if-eqz p0, :cond_4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-static {v4}, Le/e/a/FeedbackDev10;->hideSeekHint(Landroid/view/ViewGroup;)V

    .line 114
    :cond_4
    new-instance p0, Le/e/a/FeedbackDev10$2;

    invoke-direct {p0, v0, v1, v2}, Le/e/a/FeedbackDev10$2;-><init>(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 115
    invoke-static {v0, v1, v2}, Le/e/a/FeedbackDev10;->refreshNg(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    goto :goto_1

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    .line 117
    :goto_1
    return-void
.end method

.method static synthetic lambda$loadSeries$4(Landroid/os/Bundle;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Object;Landroid/view/View;)V
    .registers 11

    .line 91
    const-string v0, "VideoExtras"

    :try_start_0
    const-string v1, "idFrom"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/os/Bundle;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v4, v2, [Ljava/lang/Object;

    aput-object p0, v4, v5

    invoke-static {v0, v1, v3, v4}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 92
    :cond_0
    const-string p1, "capture"

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/Class;

    const-class v4, Lorg/json/JSONObject;

    aput-object v4, v3, v5

    const-class v4, Landroid/os/Bundle;

    aput-object v4, v3, v2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v5

    aput-object p0, v1, v2

    invoke-static {v0, p1, v3, v1}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    invoke-static {p3, p4}, Le/e/a/FeedbackDev10;->decorate(Ljava/lang/Object;Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$loadSeries$5(Landroid/os/Bundle;)V
    .registers 2

    .line 96
    const-string v0, "nicoid_series_loading"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$redraw$3(Landroid/widget/ListView;)V
    .registers 1

    .line 70
    invoke-virtual {p0}, Landroid/widget/ListView;->invalidateViews()V

    invoke-virtual {p0}, Landroid/widget/ListView;->requestLayout()V

    invoke-virtual {p0}, Landroid/widget/ListView;->invalidate()V

    return-void
.end method

.method static synthetic lambda$refreshNg$6(Landroid/widget/BaseAdapter;Ljava/util/ArrayList;Ljava/lang/Object;Landroid/widget/ListView;Lorg/json/JSONObject;)V
    .registers 6

    .line 126
    :try_start_0
    const-string v0, "b"

    invoke-static {p0, v0}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 127
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    const-string v0, "n"

    invoke-virtual {p2, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 128
    invoke-virtual {p3}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "saveNGList"

    invoke-virtual {p4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-interface {p1, p2, p4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 129
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    invoke-static {p3}, Le/e/a/FeedbackDev10;->redraw(Landroid/widget/ListView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$refreshNg$7(Landroid/widget/BaseAdapter;Ljava/lang/Object;Landroid/widget/ListView;)V
    .registers 14

    .line 120
    :try_start_0
    invoke-static {}, Le/e/a/FeedbackDev10;->cookie()Ljava/lang/String;

    move-result-object v0

    const-string v1, "user_session="

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 121
    :cond_0
    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client"

    const-string v2, "GET"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v0}, Le/e/a/FeedbackDev10;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 122
    const-string v0, "data"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "items"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 123
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "e.e.a.h0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 124
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    new-array v7, v2, [Ljava/lang/Object;

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/String;

    const-string v10, "type"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v5

    const-string v10, "source"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v8, v2

    const-string v4, "0"

    const/4 v10, 0x2

    aput-object v4, v8, v10

    aput-object v8, v7, v5

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 125
    :cond_1
    sget-object v0, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    new-instance v1, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;

    move-object v4, v1

    move-object v5, p0

    move-object v7, p1

    move-object v8, p2

    invoke-direct/range {v4 .. v9}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;-><init>(Landroid/widget/BaseAdapter;Ljava/util/ArrayList;Ljava/lang/Object;Landroid/widget/ListView;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    goto :goto_1

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method static synthetic lambda$undoNicoru$0(Ljava/lang/Object;Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 6

    .line 61
    const-string v0, "count"

    :try_start_0
    const-string v1, "nicoruId"

    const-string v2, ""

    invoke-static {p0, v1, v2}, Le/e/a/FeedbackDev10;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0, v0}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackDev10;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "busy"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackDev10;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/widget/Button;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_0

    invoke-static {p1, p0}, Le/e/a/FeedbackDev10;->render(Landroid/widget/Button;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    :cond_0
    :goto_0
    return-void
.end method

.method static synthetic lambda$undoNicoru$1(Ljava/lang/Object;Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 6

    .line 62
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "busy"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p0, v1, v2}, Le/e/a/FeedbackDev10;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/widget/Button;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p2, :cond_0

    invoke-static {p1, p0}, Le/e/a/FeedbackDev10;->render(Landroid/widget/Button;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    :cond_0
    :goto_0
    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "\u30cb\u30b3\u308b\u306e\u89e3\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {p1}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$undoNicoru$2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 7

    .line 60
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/nicoru/send/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "DELETE"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p1}, Le/e/a/FeedbackDev10;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 61
    sget-object p0, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    new-instance p1, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda1;

    invoke-direct {p1, p2, p3, p4}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    sget-object p0, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    new-instance p1, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda2;

    invoke-direct {p1, p2, p3, p4}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 63
    :goto_0
    return-void
.end method

.method public static loadSeries(Ljava/lang/String;Landroid/view/View;Landroid/os/Bundle;Ljava/lang/Object;)V
    .registers 12

    .line 86
    const-string v0, "data"

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?responseType=json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GET"

    invoke-static {}, Le/e/a/FeedbackDev10;->cookie()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v1, v2, v4, v3}, Le/e/a/FeedbackDev10;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 87
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "response"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "$watchV4"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 88
    if-eqz v2, :cond_0

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    :cond_0
    move-object v3, v1

    .line 89
    nop

    .line 90
    sget-object v6, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    new-instance v7, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;

    move-object v0, v7

    move-object v1, p2

    move-object v2, p0

    move-object v4, p3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;-><init>(Landroid/os/Bundle;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Object;Landroid/view/View;)V

    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    sget-object p0, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    new-instance p1, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;

    invoke-direct {p1, p2}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;-><init>(Landroid/os/Bundle;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception p0

    :try_start_1
    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sget-object p0, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    new-instance p1, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;

    invoke-direct {p1, p2}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;-><init>(Landroid/os/Bundle;)V

    :goto_0
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 97
    return-void

    .line 96
    :goto_1
    sget-object p1, Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;

    new-instance p3, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;

    invoke-direct {p3, p2}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw p0
.end method

.method static log(Ljava/lang/Exception;)V
    .registers 3

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "nicoid-dev10"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static redraw(Landroid/widget/ListView;)V
    .registers 2

    .line 68
    if-nez p0, :cond_0

    return-void

    .line 69
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ListView;->invalidateViews()V

    invoke-virtual {p0}, Landroid/widget/ListView;->requestLayout()V

    invoke-virtual {p0}, Landroid/widget/ListView;->invalidate()V

    .line 70
    new-instance v0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda4;-><init>(Landroid/widget/ListView;)V

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 71
    return-void
.end method

.method static refreshNg(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V
    .registers 5

    .line 119
    sget-object v0, Le/e/a/FeedbackDev10;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;

    invoke-direct {v1, p1, p2, p0}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;-><init>(Landroid/widget/BaseAdapter;Ljava/lang/Object;Landroid/widget/ListView;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 131
    return-void
.end method

.method static render(Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/widget/Button;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v0, v2, v3

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p0, v0, v4

    aput-object p1, v0, v3

    const-string p0, "CommentListExtras"

    const-string p1, "render"

    invoke-static {p0, p1, v2, v0}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 36
    const-string v0, "status"

    const-string v1, "https://www.nicovideo.jp"

    const-string v2, "application/json"

    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lnicoid/network238/ApiConnection254;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    .line 38
    const/16 v3, 0x1f40

    :try_start_0
    invoke-virtual {p0, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v3, 0x2710

    invoke-virtual {p0, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    invoke-virtual {p0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 39
    const-string p1, "User-Agent"

    const-string v4, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {p0, p1, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    const-string p1, "Accept"

    invoke-virtual {p0, p1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "X-Frontend-Id"

    const-string v4, "6"

    invoke-virtual {p0, p1, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "X-Frontend-Version"

    const-string v4, "0"

    invoke-virtual {p0, p1, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    const-string p1, "X-Request-With"

    invoke-virtual {p0, p1, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Origin"

    invoke-virtual {p0, p1, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "Cookie"

    invoke-virtual {p0, p1, p3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 43
    :cond_0
    const-string p1, "UTF-8"

    if-eqz p2, :cond_3

    const/4 p3, 0x1

    :try_start_1
    invoke-virtual {p0, p3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const-string p3, "Content-Type"

    const-string v1, "{"

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v2, "application/x-www-form-urlencoded"

    :goto_0
    invoke-virtual {p0, p3, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    :try_start_2
    invoke-virtual {p2, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p3, :cond_3

    :try_start_3
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    goto :goto_2

    :catchall_0
    move-exception p1

    if-eqz p3, :cond_2

    :try_start_4
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p2

    :try_start_5
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw p1

    .line 44
    :cond_3
    :goto_2
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p2

    const/16 p3, 0xc8

    if-lt p2, p3, :cond_8

    const/16 v1, 0x12c

    if-ge p2, v1, :cond_8

    .line 45
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v2, v4, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    const/16 p1, 0x1000

    :try_start_6
    new-array p1, p1, [C

    :goto_3
    invoke-virtual {v2, p1}, Ljava/io/Reader;->read([C)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_4

    invoke-virtual {p2, p1, v3, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_3

    :cond_4
    :try_start_7
    invoke-virtual {v2}, Ljava/io/Reader;->close()V

    .line 46
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_5

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_4

    :cond_5
    new-instance p1, Lorg/json/JSONObject;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 47
    :goto_4
    const-string p2, "meta"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    if-eqz p2, :cond_7

    invoke-virtual {p2, v0, p3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p3

    if-ge p3, v1, :cond_6

    goto :goto_5

    :cond_6
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "API "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 48
    :cond_7
    :goto_5
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 47
    return-object p1

    .line 45
    :catchall_2
    move-exception p1

    :try_start_8
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_6

    :catchall_3
    move-exception p2

    :try_start_9
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw p1

    .line 44
    :cond_8
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "HTTP "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 48
    :catchall_4
    move-exception p1

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p1
.end method

.method public static roundButton(Landroid/widget/Button;)V
    .registers 7

    invoke-static {p0}, Le/e/a/ThemeChoice;->button(Landroid/widget/Button;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0xdcd7c2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/widget/Button;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    goto :goto_0

    :cond_1
    const v0, -0x181819

    :goto_0
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v3, 0x8

    invoke-static {v2, v3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-static {v2}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v3

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x33000000

    or-int/2addr v3, v4

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v5, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v5, v3, v1, v4}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setTextColor(I)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/16 v4, 0x28

    invoke-static {v2, v4}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {p0, v4}, Landroid/widget/Button;->setMinimumHeight(I)V

    const/16 v3, 0xc

    invoke-static {v2, v3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x4

    invoke-static {v2, v4}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {p0, v3, v4, v3, v4}, Landroid/widget/Button;->setPadding(IIII)V

    return-void
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    return-void
.end method

.method public static themeNg(Ljava/lang/Object;)V
    .registers 5

    const-string v0, "Z"

    invoke-static {p0, v0}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-static {v0}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string p0, "comment_message"

    const-string v3, "id"

    invoke-virtual {v1, p0, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {v0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {v0}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method static tr(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 30
    :try_start_0
    const-string v0, "FeedbackFixes"

    const-string v1, "tr"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    return-object p0
.end method

.method public static undoNicoru(Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 11

    .line 53
    const-string v0, "busy"

    :try_start_0
    const-string v1, "e.e.a.CommentListExtras"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "meta"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 54
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_4

    invoke-static {v6, v0}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 55
    :cond_0
    const-string v1, "nicoruId"

    invoke-static {v6, v1}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 56
    :cond_1
    invoke-static {}, Le/e/a/FeedbackDev10;->cookie()Ljava/lang/String;

    move-result-object v5

    const-string v1, "user_session="

    invoke-virtual {v5, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "\u30cb\u30b3\u308b\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 57
    :cond_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v6, v0, v1}, Le/e/a/FeedbackDev10;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0, v6}, Le/e/a/FeedbackDev10;->render(Landroid/widget/Button;Ljava/lang/Object;)V

    .line 58
    sget-object v0, Le/e/a/FeedbackDev10;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda3;

    move-object v3, v1

    move-object v7, p0

    move-object v8, p1

    invoke-direct/range {v3 .. v8}, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda3;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    goto :goto_2

    .line 55
    :cond_3
    :goto_0
    return-void

    .line 54
    :cond_4
    :goto_1
    return-void

    .line 64
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    .line 65
    :goto_2
    return-void
.end method
