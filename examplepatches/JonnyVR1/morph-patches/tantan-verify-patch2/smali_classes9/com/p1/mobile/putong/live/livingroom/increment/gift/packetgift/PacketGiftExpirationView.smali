.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/x20;

.field public i:[I

.field public j:Z

.field public k:I

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public m:Landroid/animation/Animator;

.field public n:Landroid/animation/Animator;

.field public o:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x4

    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x5

    .line 20
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    filled-new-array {p1, v1, v2, v3}, [Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->g:Ljava/util/List;

    .line 33
    .line 34
    const/4 p1, 0x2

    .line 35
    new-array p1, p1, [I

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    .line 40
    .line 41
    const/high16 p1, 0x41800000    # 16.0f

    .line 42
    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->k:I

    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 50
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {p1, v0, v1, v2}, [Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->g:Ljava/util/List;

    const/4 p1, 0x2

    .line 52
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 53
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    const/high16 p1, 0x41800000    # 16.0f

    .line 54
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->k:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->l(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->m()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->n()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->k()V

    return-void
.end method

.method private getMaxWidth()I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 11
    .line 12
    aget v1, v2, v1

    .line 13
    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int/2addr v0, v1

    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->k:I

    .line 23
    .line 24
    :goto_0
    sub-int/2addr v0, p0

    .line 25
    return v0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 27
    .line 28
    aget v0, v0, v1

    .line 29
    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->k:I

    .line 31
    .line 32
    goto :goto_0
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/md60;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Ljava/util/List;I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveExpirationItem;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lt p2, p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveExpirationItem;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExpirationItem;->info:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExpirationItem;

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExpirationItem;->num:I

    .line 29
    .line 30
    new-instance p2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, " x"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x63

    .line 44
    .line 45
    if-le p1, p0, :cond_1

    .line 46
    .line 47
    const-string p0, "99+"

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :goto_0
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public final h(Ljava/util/List;Ll/jjs;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveExpirationItem;",
            ">;",
            "Ll/jjs;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->pa:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->na:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final i()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    return v1
.end method

.method public final synthetic j()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->u()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->t()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->s()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic l(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    if-eq p1, p2, :cond_0

    .line 7
    .line 8
    const/4 p2, 0x3

    .line 9
    if-ne p1, p2, :cond_2

    .line 10
    .line 11
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide p1

    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->o:J

    .line 16
    .line 17
    sub-long/2addr p1, v0

    .line 18
    const-wide/16 v0, 0x190

    .line 19
    .line 20
    cmp-long v2, p1, v0

    .line 21
    .line 22
    if-ltz v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->s()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    new-instance v3, Ll/hd60;

    .line 33
    .line 34
    invoke-direct {v3, p0}, Ll/hd60;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V

    .line 35
    .line 36
    .line 37
    sub-long/2addr v0, p1

    .line 38
    invoke-static {v2, v3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public final synthetic m()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->h:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->b:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final o(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->m:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->o(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->n:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->o(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->b:Lv/VLinear;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Ljava/util/List;Ll/jjs;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveExpirationItem;",
            ">;",
            "Ll/jjs;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->h(Ljava/util/List;Ll/jjs;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    sget v0, Ll/n9c0;->l0:I

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    sget v0, Ll/n9c0;->n1:I

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->c:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->d:Lv/VText;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->g(Ljava/util/List;I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->r(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->e:Lv/VText;

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->g(Ljava/util/List;I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->r(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->f:Lv/VText;

    .line 71
    .line 72
    const/4 v0, 0x2

    .line 73
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->g(Ljava/util/List;I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->r(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->getMaxWidth()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->a:Lv/VFrame;

    .line 85
    .line 86
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->a:Lv/VFrame;

    .line 93
    .line 94
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public q(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILl/x20;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->h:Ll/x20;

    .line 4
    .line 5
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->g:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-interface {p4, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 27
    .line 28
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->longPress:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 29
    .line 30
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->expirationInfos:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->p(Ljava/util/List;Ll/jjs;)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/kd60;

    .line 36
    .line 37
    invoke-direct {p1, p0}, Ll/kd60;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/ld60;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Ll/ld60;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final r(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final s()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->b:Lv/VLinear;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x2

    .line 8
    const/4 v5, 0x0

    .line 9
    sget-object v6, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    neg-int v0, v0

    .line 18
    int-to-float v0, v0

    .line 19
    new-array v4, v4, [F

    .line 20
    .line 21
    aput v5, v4, v3

    .line 22
    .line 23
    aput v0, v4, v2

    .line 24
    .line 25
    invoke-static {v1, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->n:Landroid/animation/Animator;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-float v0, v0

    .line 37
    new-array v4, v4, [F

    .line 38
    .line 39
    aput v5, v4, v3

    .line 40
    .line 41
    aput v0, v4, v2

    .line 42
    .line 43
    invoke-static {v1, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->n:Landroid/animation/Animator;

    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->n:Landroid/animation/Animator;

    .line 50
    .line 51
    const-wide/16 v1, 0x190

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->n:Landroid/animation/Animator;

    .line 57
    .line 58
    new-instance v1, Ll/jd60;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/jd60;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->n:Landroid/animation/Animator;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final t()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->b:Lv/VLinear;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x2

    .line 8
    const/4 v5, 0x0

    .line 9
    sget-object v6, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    neg-int v0, v0

    .line 18
    int-to-float v0, v0

    .line 19
    new-array v4, v4, [F

    .line 20
    .line 21
    aput v0, v4, v3

    .line 22
    .line 23
    aput v5, v4, v2

    .line 24
    .line 25
    invoke-static {v1, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->m:Landroid/animation/Animator;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-float v0, v0

    .line 37
    new-array v4, v4, [F

    .line 38
    .line 39
    aput v0, v4, v3

    .line 40
    .line 41
    aput v5, v4, v2

    .line 42
    .line 43
    invoke-static {v1, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->m:Landroid/animation/Animator;

    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->m:Landroid/animation/Animator;

    .line 50
    .line 51
    const-wide/16 v1, 0x190

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->m:Landroid/animation/Animator;

    .line 57
    .line 58
    new-instance v1, Ll/id60;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/id60;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->m:Landroid/animation/Animator;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->o:J

    .line 76
    .line 77
    return-void
.end method

.method public u()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->b:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    div-int/lit8 v0, v0, 0x2

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    aget v1, v1, v2

    .line 20
    .line 21
    sub-int/2addr v1, v0

    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->a:Lv/VFrame;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    instance-of v2, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    move-object v2, v0

    .line 33
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 34
    .line 35
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 43
    .line 44
    aget v1, v1, v3

    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 47
    .line 48
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    add-int/2addr v1, v3

    .line 53
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->k:I

    .line 56
    .line 57
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->k:I

    .line 61
    .line 62
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 63
    .line 64
    invoke-static {}, Ll/bnl0;->y0()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->i:[I

    .line 69
    .line 70
    aget v3, v4, v3

    .line 71
    .line 72
    sub-int/2addr v1, v3

    .line 73
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 74
    .line 75
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->a:Lv/VFrame;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->b:Lv/VLinear;

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 87
    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    move-object v1, v0

    .line 91
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 92
    .line 93
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->j:Z

    .line 94
    .line 95
    if-eqz v2, :cond_2

    .line 96
    .line 97
    const v2, 0x800003

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    const v2, 0x800005

    .line 102
    .line 103
    .line 104
    :goto_1
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 105
    .line 106
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->b:Lv/VLinear;

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method
