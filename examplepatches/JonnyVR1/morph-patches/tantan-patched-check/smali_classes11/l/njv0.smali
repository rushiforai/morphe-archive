.class public final Ll/njv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/zxt0;

.field public final c:Ll/yhs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ll/xvw0;

.field public final e:Ll/lcw0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/zxt0;Ll/lcw0;Ll/xvw0;Ll/yhs0;)V
    .locals 0
    .param p5    # Ll/yhs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/njv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/njv0;->b:Ll/zxt0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/njv0;->e:Ll/lcw0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/njv0;->d:Ll/xvw0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/njv0;->c:Ll/yhs0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/njv0;->c:Ll/yhs0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/u6w0;->a:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;)Ll/hpr;
    .locals 6

    .line 1
    new-instance v0, Ll/ljv0;

    .line 2
    .line 3
    new-instance v2, Landroid/view/View;

    .line 4
    .line 5
    iget-object v1, p0, Ll/njv0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {v2, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget-object v4, Ll/jjv0;->a:Ll/jjv0;

    .line 11
    .line 12
    iget-object v1, p2, Ll/q6w0;->v:Ljava/util/List;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    move-object v5, v1

    .line 20
    check-cast v5, Ll/r6w0;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    move-object v1, p0

    .line 24
    invoke-direct/range {v0 .. v5}, Ll/ljv0;-><init>(Ll/njv0;Landroid/view/View;Ll/wit0;Ll/izt0;Ll/r6w0;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/a0u0;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v2}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, v1, Ll/njv0;->b:Ll/zxt0;

    .line 34
    .line 35
    invoke-virtual {p1, p0, v0}, Ll/zxt0;->a(Ll/a0u0;Ll/bxt0;)Ll/vwt0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ll/lhs0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/vwt0;->k()Ll/mjv0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p2, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 46
    .line 47
    iget-object v2, p2, Ll/u6w0;->b:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p2, p2, Ll/u6w0;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {p1, v0, v2, p2}, Ll/lhs0;-><init>(Ll/myv0;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p2, Lcom/google/android/gms/internal/ads/zzflg;->zzt:Lcom/google/android/gms/internal/ads/zzflg;

    .line 55
    .line 56
    new-instance v0, Ll/kjv0;

    .line 57
    .line 58
    invoke-direct {v0, v1, p1}, Ll/kjv0;-><init>(Ll/njv0;Ll/lhs0;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, v1, Ll/njv0;->e:Ll/lcw0;

    .line 62
    .line 63
    iget-object v1, v1, Ll/njv0;->d:Ll/xvw0;

    .line 64
    .line 65
    invoke-static {v0, v1, p2, p1}, Ll/rbw0;->d(Ll/lbw0;Ll/xvw0;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    sget-object p2, Lcom/google/android/gms/internal/ads/zzflg;->zzu:Lcom/google/android/gms/internal/ads/zzflg;

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Ll/dcw0;->b(Ljava/lang/Object;)Ll/dcw0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0}, Ll/vwt0;->h()Ll/uwt0;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Ll/dcw0;->d(Ll/hpr;)Ll/dcw0;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/dcw0;->a()Ll/mbw0;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method public final synthetic c(Ll/lhs0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/njv0;->c:Ll/yhs0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/yhs0;->I2(Ll/nhs0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
