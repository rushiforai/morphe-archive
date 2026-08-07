.class public Ll/ha3;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/ha3;JLl/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ha3;->L3(JLl/x20;Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public K3(JLl/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ha3;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    long-to-int v1, p1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/ga3;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1, p2, p3}, Ll/ga3;-><init>(Ll/ha3;JLl/x20;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/ha3;->i:Ll/kcg0;

    .line 39
    .line 40
    return-void
.end method

.method public final synthetic L3(JLl/x20;Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long p1, v0, p1

    .line 6
    .line 7
    if-gez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->k:Lv/VText;

    .line 14
    .line 15
    const-wide/16 p1, 0x3c

    .line 16
    .line 17
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide p3

    .line 21
    sub-long/2addr p1, p3

    .line 22
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-interface {p3}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
