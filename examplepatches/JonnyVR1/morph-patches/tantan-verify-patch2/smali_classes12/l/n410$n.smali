.class Ll/n410$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/n410$r;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410;->D0(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$n;->a:Ll/n410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n410$n;->a:Ll/n410;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n410;->b:Lcom/immomo/moment/mediautils/o;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x10

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/immomo/moment/mediautils/o;->x(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const-string p0, "EditProcess"

    .line 13
    .line 14
    const-string v0, "MomoProcess video cut finished !!!"

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n410$n;->a:Ll/n410;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n410;->k:Ll/eli0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x102

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, p1}, Ll/eli0;->n0(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public c(J)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/n410$n;->a:Ll/n410;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n410;->d:Lcom/immomo/moment/mediautils/d;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/d;->v(J)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ll/n410$n;->a:Ll/n410;

    .line 11
    .line 12
    invoke-static {v0}, Ll/n410;->h(Ll/n410;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    const-wide/16 v2, 0x3e8

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    mul-long v0, p1, v2

    .line 22
    .line 23
    iget-object v4, p0, Ll/n410$n;->a:Ll/n410;

    .line 24
    .line 25
    invoke-static {v4}, Ll/n410;->m(Ll/n410;)J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    add-long/2addr v0, v4

    .line 30
    long-to-float v0, v0

    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    mul-float/2addr v0, v1

    .line 34
    iget-object v1, p0, Ll/n410$n;->a:Ll/n410;

    .line 35
    .line 36
    invoke-static {v1}, Ll/n410;->l(Ll/n410;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    long-to-float v1, v4

    .line 41
    div-float/2addr v0, v1

    .line 42
    iget-object v1, p0, Ll/n410$n;->a:Ll/n410;

    .line 43
    .line 44
    invoke-static {v1}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v1, p0, Ll/n410$n;->a:Ll/n410;

    .line 51
    .line 52
    invoke-static {v1}, Ll/n410;->l(Ll/n410;)J

    .line 53
    .line 54
    .line 55
    move-result-wide v4

    .line 56
    const-wide/16 v6, 0x0

    .line 57
    .line 58
    cmp-long v1, v4, v6

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    cmp-long v1, p1, v6

    .line 63
    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    iget-object v1, p0, Ll/n410$n;->a:Ll/n410;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/n410;->H0()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_1

    .line 73
    .line 74
    iget-object v1, p0, Ll/n410$n;->a:Ll/n410;

    .line 75
    .line 76
    invoke-static {v1}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-interface {v1, v0}, Ll/ipw;->W(F)V

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-object v0, p0, Ll/n410$n;->a:Ll/n410;

    .line 84
    .line 85
    invoke-static {v0}, Ll/n410;->U(Ll/n410;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    iget-object p0, p0, Ll/n410$n;->a:Ll/n410;

    .line 93
    .line 94
    iget-object v0, p0, Ll/n410;->k:Ll/eli0;

    .line 95
    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    invoke-static {p0}, Ll/n410;->m(Ll/n410;)J

    .line 99
    .line 100
    .line 101
    move-result-wide v4

    .line 102
    div-long/2addr v4, v2

    .line 103
    add-long/2addr p1, v4

    .line 104
    invoke-virtual {v0, p1, p2}, Ll/eli0;->F0(J)V

    .line 105
    .line 106
    .line 107
    :cond_3
    :goto_0
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n410$n;->a:Ll/n410;

    .line 2
    .line 3
    iget-object v1, v0, Ll/n410;->k:Ll/eli0;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    invoke-static {v0}, Ll/n410;->C(Ll/n410;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/n410$n;->a:Ll/n410;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, v1, Ll/n410;->k:Ll/eli0;

    .line 16
    .line 17
    check-cast p0, Ll/v5c;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/klc0;->I0()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {v1}, Ll/n410;->E(Ll/n410;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/n410$n;->a:Ll/n410;

    .line 27
    .line 28
    iget-object p0, p0, Ll/n410;->k:Ll/eli0;

    .line 29
    .line 30
    check-cast p0, Ll/abh0;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Ll/abh0;->onFrameAvailable(Landroid/graphics/SurfaceTexture;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
