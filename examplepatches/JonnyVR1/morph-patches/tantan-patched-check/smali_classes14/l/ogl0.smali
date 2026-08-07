.class public Ll/ogl0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ogl0;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Ll/ogl0;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogl0;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l(Ll/ogl0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogl0;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V

    return-void
.end method

.method private n(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/lbl0;->c(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    instance-of p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 12
    .line 13
    iget p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 14
    .line 15
    const v0, 0xa03d

    .line 16
    .line 17
    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->m(Lcom/p1/mobile/android/app/Act;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    if-eqz p2, :cond_2

    .line 29
    .line 30
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->R:I

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    const-string p0, ""

    .line 38
    .line 39
    :goto_0
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/ogl0;->a:I

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ogl0;->m(Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Ll/ogl0;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "buyRandomMatchCoupon"

    .line 2
    .line 3
    return-object p0
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/jwu;->A()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/mgl0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/mgl0;-><init>(Ll/ogl0;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/ngl0;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/ngl0;-><init>(Ll/ogl0;Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogl0;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ogl0;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
