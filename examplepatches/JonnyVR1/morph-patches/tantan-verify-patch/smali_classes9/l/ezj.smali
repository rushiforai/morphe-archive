.class public Ll/ezj;
.super Ll/hj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hj2<",
        "Ll/oo2;",
        "Ll/pyj;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Ljava/lang/String;

.field public l:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hj2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O3(Ll/ezj;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ezj;->l4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic P3(Ll/ezj;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ezj;->f4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R3(Ll/y20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic S3(Ll/ezj;Landroid/view/View;Ll/y20;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ezj;->j4(Landroid/view/View;Ll/y20;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic T3(Ll/ezj;Ll/qyj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ezj;->m4(Ll/qyj;)V

    return-void
.end method

.method public static synthetic U3(Ll/ezj;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ezj;->i4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X3(Ll/ezj;ILjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ezj;->h4(ILjava/lang/Long;)V

    return-void
.end method

.method public static synthetic Y3(Ll/ezj;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ezj;->k4(Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Z3(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ezj;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V

    return-void
.end method

.method private o4(Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    const-string v0, "#"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    and-int/2addr p0, v1

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :cond_0
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method


# virtual methods
.method public bridge synthetic K3()Ll/isl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ezj;->d4()Ll/pyj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final a4(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public b4(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/oo2;->w0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final c4(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ezj;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/aiv;->A0(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/hj2;->J3(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/wyj;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/wyj;-><init>(Ll/ezj;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/xyj;

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ll/xyj;-><init>(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public d4()Ll/pyj;
    .locals 0

    .line 1
    new-instance p0, Ll/pyj;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/pyj;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e4(IZ)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/ezj;->c4(Ll/y20;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    int-to-long v1, p1

    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    invoke-virtual {p0, v1, v2, v3, v4}, Ll/ezj;->p4(JJ)V

    .line 12
    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    iget-object p2, p0, Ll/ezj;->l:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    iget-object p2, p0, Ll/ezj;->l:Ll/kcg0;

    .line 25
    .line 26
    invoke-interface {p2}, Ll/kcg0;->unsubscribe()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/ezj;->l:Ll/kcg0;

    .line 30
    .line 31
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 36
    .line 37
    invoke-virtual {p2, v0}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2, p1}, Lrx/c;->take(I)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p0, p2}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p0, p2}, Ll/hj2;->J3(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v0, Ll/bzj;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Ll/bzj;-><init>(Ll/ezj;I)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Ll/ezj;->l:Ll/kcg0;

    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method public final synthetic f4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p1, Ll/pyj;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p1, v0}, Ll/pyj;->B(Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pyj;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/pyj;->z(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->backgroundPicUrl:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Ll/pyj;

    .line 23
    .line 24
    iget-object v0, v0, Ll/ams;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    new-instance v1, Ll/yyj;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/yyj;-><init>(Ll/ezj;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1, v0, v1}, Ll/ezj;->s4(Ljava/lang/String;Landroid/view/View;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic h4(ILjava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    int-to-long v2, p1

    .line 6
    cmp-long p1, v0, v2

    .line 7
    .line 8
    if-gez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    invoke-virtual {p0, v2, v3, p1, p2}, Ll/ezj;->p4(JJ)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Ll/ezj;->c4(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic i4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/pyj;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Ll/pyj;->B(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic j4(Landroid/view/View;Ll/y20;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 4
    .line 5
    invoke-virtual {p0, p3, p1}, Ll/ezj;->u4(Landroid/graphics/Bitmap;Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-direct {v0, p3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p2, p1}, Ll/ezj;->a4(Ll/y20;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance p1, Ljava/lang/Throwable;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/lang/Throwable;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2, p1}, Ll/ezj;->a4(Ll/y20;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic k4(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ezj;->a4(Ll/y20;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hj2;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->hasSuitSendFinished()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->dismissGiftDialog()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    const/16 v0, 0x1fa6

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p3, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p3, Ll/pyj;

    .line 45
    .line 46
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v0, Ll/pyj;

    .line 53
    .line 54
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 55
    .line 56
    invoke-virtual {v0, p3}, Ll/pyj;->z(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    if-eqz p3, :cond_2

    .line 64
    .line 65
    const-string p3, "p_anchor_live_room"

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    const-string p3, "p_user_live_room"

    .line 69
    .line 70
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    invoke-static {p1, p3, p2, v0, p0}, Ll/fzj;->a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final m4(Ll/qyj;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/qyj;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hj2;->L3()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/qyj;->b()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/ezj;->k:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 17
    .line 18
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->q:I

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 24
    .line 25
    .line 26
    new-instance p1, Ll/vyj;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Ll/vyj;-><init>(Ll/ezj;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/ezj;->c4(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p0, Ll/pyj;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public n4(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Ll/pyj;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pyj;->x()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/high16 v1, 0x41700000    # 15.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    add-int/2addr v0, v2

    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-gt v0, v1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/bnl0;->w0()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-double v0, v0

    .line 33
    const-wide v2, 0x3fd999999999999aL    # 0.4

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    mul-double/2addr v0, v2

    .line 39
    double-to-int v0, v0

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/16 v1, 0x1fa5

    .line 51
    .line 52
    invoke-static {v1}, Ll/px50;->c(I)Ll/px50$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/16 v1, 0x50

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const/high16 v1, 0x41200000    # 10.0f

    .line 67
    .line 68
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {p1, v1}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {}, Ll/bnl0;->y0()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {p1, v1, v0}, Ll/px50$a;->A(II)Ll/px50$a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method

.method public final p4(JJ)V
    .locals 2

    .line 1
    sub-long/2addr p1, p3

    .line 2
    const-wide/16 p3, 0x3c

    .line 3
    .line 4
    div-long v0, p1, p3

    .line 5
    .line 6
    mul-long/2addr p3, v0

    .line 7
    sub-long/2addr p1, p3

    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/pyj;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/kdu;->R(J)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-static {p1, p2}, Ll/kdu;->R(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p3, p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "%1s:%2s"

    .line 25
    .line 26
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/pyj;->A(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public q4(Ljava/lang/String;Lv/VDraweeView;)V
    .locals 0

    .line 1
    const-string p0, "context_livingAct"

    .line 2
    .line 3
    invoke-static {p0, p2, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r4(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/ezj;->s4(Ljava/lang/String;Landroid/view/View;Ll/y20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public s4(Ljava/lang/String;Landroid/view/View;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "context_livingAct"

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/hj2;->J3(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/zyj;

    .line 27
    .line 28
    invoke-direct {v0, p0, p2, p3}, Ll/zyj;-><init>(Ll/ezj;Landroid/view/View;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    new-instance p2, Ll/azj;

    .line 32
    .line 33
    invoke-direct {p2, p0, p3}, Ll/azj;-><init>(Ll/ezj;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftSuitEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;->showDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/tyj;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/tyj;-><init>(Ll/ezj;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public t4(Lv/VText;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p2}, Ll/ezj;->o4(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final u4(Landroid/graphics/Bitmap;Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ge p0, v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-ge p2, v0, :cond_0

    .line 24
    .line 25
    invoke-static {p1, p0, p2}, Ll/yb5;->P(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    return-object p1
.end method

.method public v4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 11

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v0, Ll/xpj;

    .line 8
    .line 9
    const/16 v2, 0x2bd

    .line 10
    .line 11
    invoke-direct {v0, v2}, Ll/xpj;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    long-to-double v3, v3

    .line 19
    invoke-virtual {v0, v3, v4}, Ll/xpj;->e(D)Ll/xpj;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v7

    .line 37
    new-instance v0, Ll/ywj;

    .line 38
    .line 39
    invoke-direct {v0, v2}, Ll/ywj;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    move-object v9, v0

    .line 47
    check-cast v9, Ljava/lang/String;

    .line 48
    .line 49
    const-string v4, "gift_set"

    .line 50
    .line 51
    const-string v5, "NA"

    .line 52
    .line 53
    const/4 v8, 0x1

    .line 54
    move-object v3, p1

    .line 55
    invoke-static/range {v3 .. v9}, Ll/qzj;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    move-object v2, v3

    .line 59
    new-instance p1, Ll/oqj;

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    invoke-direct {p1, v0}, Ll/oqj;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Landroid/util/Pair;

    .line 70
    .line 71
    new-instance v3, Ll/czj;

    .line 72
    .line 73
    invoke-direct {v3, p0, v1, v2}, Ll/czj;-><init>(Ll/ezj;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 74
    .line 75
    .line 76
    new-instance v4, Ll/dzj;

    .line 77
    .line 78
    invoke-direct {v4}, Ll/dzj;-><init>()V

    .line 79
    .line 80
    .line 81
    new-instance v5, Ll/uyj;

    .line 82
    .line 83
    invoke-direct {v5}, Ll/uyj;-><init>()V

    .line 84
    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    if-eqz p1, :cond_0

    .line 88
    .line 89
    iget-object v6, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v6, Ljava/lang/String;

    .line 92
    .line 93
    move-object v8, v6

    .line 94
    goto :goto_0

    .line 95
    :cond_0
    move-object v8, v0

    .line 96
    :goto_0
    if-eqz p1, :cond_1

    .line 97
    .line 98
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 99
    .line 100
    move-object v0, p1

    .line 101
    check-cast v0, Ll/cqj;

    .line 102
    .line 103
    :cond_1
    move-object v9, v0

    .line 104
    const-string p1, "giftcombination"

    .line 105
    .line 106
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 111
    .line 112
    .line 113
    move-result-object v10

    .line 114
    const/4 v6, 0x0

    .line 115
    const/4 v7, 0x1

    .line 116
    invoke-static/range {v1 .. v10}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    new-instance v0, Ll/hne0$a;

    .line 131
    .line 132
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v1, "liveGiftSuitClick"

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ll/hne0$a;->B(Ljava/lang/String;)Ll/hne0$a;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0, p1}, Ll/hne0$a;->y(Ll/uoe0;)Ll/hne0;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method
