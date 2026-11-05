.class public final Le/e/a/PlayerControlsDock;
.super Ljava/lang/Object;
.source "PlayerControlsDock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerControlsDock$Dock;
    }
.end annotation


# static fields
.field public static final KEY:Ljava/lang/String; = "player_controls_outside_video"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 13
    invoke-static {p0, p1}, Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static attach(Landroid/view/View;)V
    .registers 5

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    .line 16
    :cond_b
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/RelativeLayout;

    if-eqz v1, :cond_4a

    const-string v1, "player_controls_outside_video"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_1e

    goto :goto_4a

    .line 17
    :cond_1e
    check-cast v0, Landroid/widget/RelativeLayout;

    new-instance v2, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, 0x0

    invoke-direct {v1, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    new-instance v1, Le/e/a/PlayerControlsDock$Dock;

    invoke-direct {v1, p0, v0}, Le/e/a/PlayerControlsDock$Dock;-><init>(Landroid/view/View;Landroid/widget/RelativeLayout;)V

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 19
    new-instance p0, Le/e/a/PlayerControlsDock$1;

    invoke-direct {p0, v1}, Le/e/a/PlayerControlsDock$1;-><init>(Le/e/a/PlayerControlsDock$Dock;)V

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 20
    return-void

    .line 16
    :cond_4a
    :goto_4a
    return-void
.end method

.method public static enabled(Landroid/content/Context;)Z
    .registers 2

    .line 12
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/PlayerVisibility192;->enabled(Landroid/content/Context;Z)Z

    move-result p0

    return p0
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
