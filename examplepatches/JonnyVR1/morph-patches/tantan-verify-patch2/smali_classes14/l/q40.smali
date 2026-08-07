.class public Ll/q40;
.super Ll/txs;
.source "SourceFile"


# instance fields
.field public f:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/byd0;

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const-string v0, "showActiveGift"

    .line 13
    .line 14
    invoke-direct {p1, v0, p2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/q40;->f:Ll/byd0;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic Q2(Ll/q40;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q40;->d3(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic R2(Ll/q40;Ll/t4u$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q40;->Z2(Ll/t4u$a;)V

    return-void
.end method

.method public static synthetic S2(Ll/q40;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q40;->X2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T2(Ll/q40;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q40;->c3(Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U2(Ll/q40;Ll/r40;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q40;->a3(Ll/r40;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V2(Ll/q40;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q40;->b3(Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V

    return-void
.end method

.method public static synthetic W2(Ll/q40;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q40;->Y2(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/j40;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/j40;-><init>(Ll/q40;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/t4u;->j()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/k40;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/k40;-><init>(Ll/q40;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    new-instance v0, Ll/l40;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/l40;-><init>(Ll/q40;)V

    .line 47
    .line 48
    .line 49
    const-class v1, Ll/r40;

    .line 50
    .line 51
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final X2()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/q40;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-boolean v0, p0, Ll/q40;->g:Z

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    iget-boolean v0, p0, Ll/q40;->h:Z

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/q40;->f:Ll/byd0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/Long;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-static {}, Ll/pzi0;->n()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    cmp-long v0, v0, v2

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getActiveGiftRequest()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/m40;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/m40;-><init>(Ll/q40;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_2
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public final synthetic Y2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/q40;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic Z2(Ll/t4u$a;)V
    .locals 1

    .line 1
    const-string v0, "p_live_recommend"

    .line 2
    .line 3
    iget-object p1, p1, Ll/t4u$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput-boolean p1, p0, Ll/q40;->h:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/q40;->e3()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic a3(Ll/r40;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q40;->X2()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic b3(Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ppi0;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/q40;->i:Z

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/q40;->f3(Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic c3(Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)Lrx/c;
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getPictureUrl()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/q40;->g:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/q40;->h:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/q40;->f:Ll/byd0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Long;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-static {}, Ll/pzi0;->n()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    cmp-long v0, v0, v2

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/o40;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/o40;-><init>(Ll/q40;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V

    .line 54
    .line 55
    .line 56
    const-wide/16 p0, 0x3e8

    .line 57
    .line 58
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public final synthetic d3(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/q40;->f:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->n()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final e3()V
    .locals 1

    .line 1
    new-instance v0, Ll/n40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/n40;-><init>(Ll/q40;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final f3(Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, p0, Ll/q40;->i:Z

    .line 15
    .line 16
    new-instance v1, Ll/jl80$a;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    sget v2, Ll/xec0;->I0:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/jl80$a;->Q(I)Ll/jl80$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v3, Ll/p40;

    .line 33
    .line 34
    invoke-direct {v3, p0}, Ll/p40;-><init>(Ll/q40;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v3}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/jl80;->L()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;

    .line 53
    .line 54
    invoke-virtual {v1, v0, p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->S(Lcom/p1/mobile/android/app/Act;Ll/jl80;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method
