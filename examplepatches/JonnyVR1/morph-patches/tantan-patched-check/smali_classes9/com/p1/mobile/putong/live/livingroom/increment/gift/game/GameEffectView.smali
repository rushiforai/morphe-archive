.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/fgs;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public e:Ll/fgs;

.field public final f:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/qkj;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/qkj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/qkj;

    invoke-direct {p1, p0}, Ll/qkj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/qkj;

    invoke-direct {p1, p0}, Ll/qkj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 17
    new-instance p1, Ll/qkj;

    invoke-direct {p1, p0}, Ll/qkj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->s()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ll/fgs;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->l(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->v(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->x(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic s()V
    .locals 1

    .line 1
    invoke-static {}, Ll/clj;->g()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->q()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->setGameEffectStatusShow(Z)V

    .line 12
    .line 13
    .line 14
    const-string v0, "tryToStopGameEffectRunnable"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->A(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fgs;->U3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private x(Ljava/lang/String;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/clj;->f(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/clj;->n(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "stopEngineGame"

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->x(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->o()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "onDestroy"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->A(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 17
    .line 18
    .line 19
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public getEffectId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fgs;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->k(Ll/fgs;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public k(Ll/fgs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    .line 2
    .line 3
    return-void
.end method

.method public final l(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/clj;->a()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 7
    .line 8
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/gson/JsonObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/gson/JsonObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "effectId"

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "tantanId"

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 21
    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "productId"

    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "roomId"

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->E:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string v0, "showId"

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const-string v0, "tradeNo"

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, v0, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 17
    .line 18
    .line 19
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/gson/JsonObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/gson/JsonObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "nickname"

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->A:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "roomId"

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->E:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "tantanId"

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v0, "avatarUrl"

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public setGameEffectStatusShow(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Ll/t8s;->k(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setGameEffectViewListener(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 2
    .line 3
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->setGameEffectStatusShow(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "onPause"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->A(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->getEffectId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->v(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->g()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;Z)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->w()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->m()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->n(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    iget-object v5, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->s:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z()Z

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    move-object v6, p2

    .line 35
    move v8, p3

    .line 36
    invoke-direct/range {v1 .. v8}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->k(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 2

    .line 1
    invoke-static {p2}, Ll/clj;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;

    .line 12
    .line 13
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->setGameEffectViewListener(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "game"

    .line 20
    .line 21
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/pkj;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ll/pkj;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p2, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->y(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    const/4 p1, 0x1

    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->setGameEffectStatusShow(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-static {}, Ll/clj;->h()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e:Ll/fgs;

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-wide p2, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f:Ljava/lang/Runnable;

    .line 54
    .line 55
    invoke-virtual {p1, p2, p3, p0}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method
