.class public final Le/e/a/PlayerDownloads116;
.super Ljava/lang/Object;
.source "PlayerDownloads116.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerDownloads116$Watcher;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "nicoid-save-mp4-116"

.field static final WAITING:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/PlayerDownloads116$Watcher;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerDownloads116;->WAITING:Ljava/util/WeakHashMap;

    .line 6
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 4

    .line 7
    :try_start_0
    const-string v0, "x1"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-eqz v0, :cond_1e

    if-nez v1, :cond_15

    goto :goto_1e

    :cond_15
    new-instance v2, Le/e/a/PlayerDownloads116$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v1, v0}, Le/e/a/PlayerDownloads116$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1d} :catch_1f

    goto :goto_27

    :cond_1e
    :goto_1e
    return-void

    :catch_1f
    move-exception p0

    const-string v0, "nicoid-download"

    const-string v1, "Cannot schedule player save action"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_27
    return-void
.end method

.method static cacheIndex(Landroid/view/ViewGroup;)I
    .registers 4

    .line 15
    const/4 v0, 0x0

    move v1, v0

    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_9

    return v0

    :cond_9
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PlayerDownloads116;->findCache(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    if-eqz v2, :cond_2

    return v1
.end method

.method static cacheText(Landroid/view/View;)Z
    .registers 4

    .line 13
    instance-of v0, p0, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_23

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_23

    return v1

    :cond_23
    const/4 p0, 0x1

    return p0
.end method

.method static findCache(Landroid/view/View;)Landroid/view/View;
    .registers 3

    .line 14
    invoke-static {p0}, Le/e/a/PlayerDownloads116;->cacheText(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p0

    :cond_7
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_23

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_e
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_15

    goto :goto_23

    :cond_15
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PlayerDownloads116;->findCache(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_20

    return-object v1

    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_23
    :goto_23
    const/4 p0, 0x0

    return-object p0
.end method

.method static install(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V
    .registers 10

    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_c3

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_c3

    const-string v0, "nicoid-save-mp4-116"

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_16

    goto/16 :goto_c3

    :cond_16
    :try_start_16
    const-string v1, "x1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p2, :cond_1f

    return-void

    :cond_1f
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "videomenulist"

    const-string v3, "id"

    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_34

    move-object v1, v2

    goto :goto_38

    :cond_34
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    :goto_38
    const-string v3, "MP4\u3067\u4fdd\u5b58"

    const-string v4, "Save as MP4"

    const-string v5, "\u53e6\u5b58\u70baMP4"

    invoke-static {p1, v3, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {p1, v3, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v0, 0x30

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    invoke-static {p1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const/16 v5, 0x8

    invoke-static {p1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v3, v0, v6, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setBackgroundColor(I)V

    new-instance v4, Le/e/a/PlayerDownloads116$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, p1}, Le/e/a/PlayerDownloads116$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    instance-of p0, v1, Landroid/widget/ListView;

    if-eqz p0, :cond_82

    check-cast v1, Landroid/widget/ListView;

    invoke-virtual {v1, v3, v2, v0}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    return-void

    :cond_82
    instance-of p0, v1, Landroid/widget/LinearLayout;

    const/4 p1, -0x2

    const/4 v0, -0x1

    if-eqz p0, :cond_97

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/PlayerDownloads116;->cacheIndex(Landroid/view/ViewGroup;)I

    move-result p0

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p2, v0, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, p0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void

    .line 10
    :cond_97
    invoke-static {p2}, Le/e/a/PlayerDownloads116;->findCache(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_c2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/widget/LinearLayout;

    if-eqz p2, :cond_c2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v0, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v3, p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_b9} :catch_ba

    return-void

    .line 11
    :catch_ba
    move-exception p0

    const-string p1, "nicoid-download"

    const-string p2, "Cannot attach player save action"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_c2
    return-void

    .line 8
    :cond_c3
    :goto_c3
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 7
    invoke-static {p0, p1, p2}, Le/e/a/PlayerDownloads116;->install(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V

    const-string v0, "nicoid-save-mp4-116"

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_40

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_40

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_40

    sget-object v0, Le/e/a/PlayerDownloads116;->WAITING:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_40

    :cond_27
    new-instance v0, Le/e/a/PlayerDownloads116$Watcher;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/PlayerDownloads116$Watcher;-><init>(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V

    sget-object p0, Le/e/a/PlayerDownloads116;->WAITING:Ljava/util/WeakHashMap;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p2, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_40
    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 8
    :try_start_0
    const-string p2, "b0"

    invoke-static {p0, p2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_36

    const-string v0, "(?:sm|so|nm|ss)?[0-9]+"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_19

    goto :goto_36

    :cond_19
    const-string v0, "c0"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "null"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_31

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_32

    :cond_31
    move-object p0, p2

    :cond_32
    invoke-static {p1, p2, p0}, Le/e/a/DownloadUi115;->choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_35} :catch_37

    goto :goto_3f

    :cond_36
    :goto_36
    return-void

    :catch_37
    move-exception p0

    const-string p1, "nicoid-download"

    const-string p2, "Cannot save current video"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3f
    return-void
.end method
