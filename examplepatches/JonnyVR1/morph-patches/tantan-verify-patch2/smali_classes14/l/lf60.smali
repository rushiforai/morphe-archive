.class public Ll/lf60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public f:I

.field public final g:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public h:J

.field public i:Ll/kcg0;

.field public j:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/lf60;->b:I

    .line 6
    .line 7
    iput v0, p0, Ll/lf60;->c:I

    .line 8
    .line 9
    iput v0, p0, Ll/lf60;->d:I

    .line 10
    .line 11
    const/16 v0, 0x9

    .line 12
    .line 13
    iput v0, p0, Ll/lf60;->f:I

    .line 14
    .line 15
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/lf60;->g:Lrx/subjects/a;

    .line 20
    .line 21
    iput-object p1, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 22
    .line 23
    new-instance v0, Ll/hf60;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/hf60;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/if60;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/if60;-><init>(Ll/lf60;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Ll/lf60;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lf60;->k(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Ll/lf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lf60;->j()V

    return-void
.end method

.method public static synthetic c(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/lf60;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lf60;->h(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public final e(ZI)V
    .locals 3

    .line 1
    iget v0, p0, Ll/lf60;->d:I

    .line 2
    .line 3
    or-int v1, p2, v0

    .line 4
    .line 5
    if-ne v1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget v1, p0, Ll/lf60;->f:I

    .line 9
    .line 10
    or-int/2addr v0, v1

    .line 11
    iput v0, p0, Ll/lf60;->f:I

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    or-int p1, v0, p2

    .line 16
    .line 17
    iput p1, p0, Ll/lf60;->f:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    not-int p1, p2

    .line 21
    and-int/2addr p1, v0

    .line 22
    iput p1, p0, Ll/lf60;->f:I

    .line 23
    .line 24
    :goto_0
    iget p1, p0, Ll/lf60;->f:I

    .line 25
    .line 26
    const/16 v0, 0xf

    .line 27
    .line 28
    if-ne p1, v0, :cond_2

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    goto :goto_1

    .line 32
    :cond_2
    const/4 v0, 0x0

    .line 33
    :goto_1
    iget-boolean v1, p0, Ll/lf60;->e:Z

    .line 34
    .line 35
    if-ne v0, v1, :cond_3

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->hashCode()I

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    iput-boolean v0, p0, Ll/lf60;->e:Z

    .line 52
    .line 53
    iget-object p1, p0, Ll/lf60;->g:Lrx/subjects/a;

    .line 54
    .line 55
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget p1, p0, Ll/lf60;->f:I

    .line 63
    .line 64
    invoke-static {p1}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->hashCode()I

    .line 75
    .line 76
    .line 77
    iget-boolean p1, p0, Ll/lf60;->e:Z

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ll/lf60;->f(Z)J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iget-object p1, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 84
    .line 85
    iget-boolean v2, p0, Ll/lf60;->e:Z

    .line 86
    .line 87
    invoke-virtual {p1, v2, p2, v0, v1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->S4(ZIJ)V

    .line 88
    .line 89
    .line 90
    iget-boolean p1, p0, Ll/lf60;->e:Z

    .line 91
    .line 92
    if-eqz p1, :cond_4

    .line 93
    .line 94
    iget-object p1, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->O4()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    new-instance p1, Ll/t4u$a;

    .line 103
    .line 104
    iget-object p0, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-direct {p1, p0, p2, v0, v1}, Ll/t4u$a;-><init>(Ljava/lang/String;IJ)V

    .line 111
    .line 112
    .line 113
    invoke-static {p1}, Ll/t4u;->o(Ll/t4u$a;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    :goto_2
    return-void
.end method

.method public final f(Z)J
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-wide/16 p0, 0x0

    .line 4
    .line 5
    return-wide p0

    .line 6
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Ll/lf60;->h:J

    .line 11
    .line 12
    sub-long/2addr v0, v2

    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    iput-wide v2, p0, Ll/lf60;->h:J

    .line 18
    .line 19
    return-wide v0
.end method

.method public g()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lf60;->g:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1, v1}, Ll/lf60;->e(ZI)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1, v1}, Ll/lf60;->e(ZI)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/lf60;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lf60;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/lf60;->j:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic k(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/t4u;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/lf60;->e(ZI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V
    .locals 1
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object p2, p0, Ll/lf60;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/jf60;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/jf60;-><init>(Ll/lf60;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/lf60;->i:Ll/kcg0;

    .line 37
    .line 38
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lf60;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/lf60;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/kf60;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/kf60;-><init>(Ll/lf60;)V

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
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/lf60;->j:Ll/kcg0;

    .line 26
    .line 27
    return-void
.end method

.method public n(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/lf60;->e(ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/lf60;->e(ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public p(ZLl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget p1, p0, Ll/lf60;->b:I

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-gtz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/lf60;->n(Z)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sub-int/2addr p1, v0

    .line 18
    iput p1, p0, Ll/lf60;->b:I

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public q(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lf60;->b:I

    .line 2
    .line 3
    iput p2, p0, Ll/lf60;->c:I

    .line 4
    .line 5
    return-void
.end method

.method public r(ZLl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget p1, p0, Ll/lf60;->b:I

    .line 5
    .line 6
    if-gtz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/lf60;->n(Z)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sub-int/2addr p1, v0

    .line 18
    iput p1, p0, Ll/lf60;->b:I

    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget p1, p0, Ll/lf60;->c:I

    .line 22
    .line 23
    if-gtz p1, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ll/lf60;->n(Z)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    sub-int/2addr p1, v0

    .line 36
    iput p1, p0, Ll/lf60;->c:I

    .line 37
    .line 38
    return-void
.end method

.method public s(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/lf60;->d:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Ll/lf60;->d:I

    .line 5
    .line 6
    return-void
.end method
