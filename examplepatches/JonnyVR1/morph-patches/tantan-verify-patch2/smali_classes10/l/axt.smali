.class public Ll/axt;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/ft5;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/axt;->a:Ll/ft5;

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    iput-object p1, p0, Ll/axt;->b:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic e0(Ll/axt;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/axt;->k0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f0(Ll/axt;Ll/wwt;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/axt;->j0(Ll/wwt;)V

    return-void
.end method

.method public static synthetic g0(Ll/wwt;)Ll/wwt;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wwt;->a()Ll/wwt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/axt;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/axt;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/axt;->a:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j0(Ll/wwt;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->y(Ll/wwt;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/axt;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    iput-object p1, p0, Ll/axt;->b:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public l0(Ll/agd0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, ""

    .line 7
    .line 8
    iput-object v0, p0, Ll/axt;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/agd0;->t()Ll/v5m;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ll/v5m;->e()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/xwt;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/xwt;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/ywt;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/ywt;-><init>(Ll/axt;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Ll/axt;->a:Ll/ft5;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ll/agd0;->o()Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance v0, Ll/zwt;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ll/zwt;-><init>(Ll/axt;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object p0, p0, Ll/axt;->a:Ll/ft5;

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public m0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/axt;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
