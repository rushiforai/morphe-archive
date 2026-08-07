.class public Ll/wmy;
.super Ll/lly;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lly<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lly;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public R3()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/y8s;->R3()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pky;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    new-instance v2, Ll/lky;

    .line 9
    .line 10
    iget-object v3, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-direct {v2, v3}, Ll/lky;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ll/pky;-><init>(Ll/dum;Ll/lky;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/riy;

    .line 22
    .line 23
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ll/riy;-><init>(Ll/dum;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 32
    .line 33
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/vp20;->p()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v1, 0x0

    .line 40
    const/4 v2, 0x1

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 44
    .line 45
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Ll/u9t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    move v0, v2

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move v0, v1

    .line 60
    :goto_0
    iget-object v3, p0, Ll/xzs;->e:Ll/dum;

    .line 61
    .line 62
    iget-object v3, v3, Ll/dum;->h:Ll/oo2;

    .line 63
    .line 64
    invoke-virtual {v3}, Ll/vp20;->p()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    iget-object v3, p0, Ll/xzs;->e:Ll/dum;

    .line 71
    .line 72
    iget-object v3, v3, Ll/dum;->h:Ll/oo2;

    .line 73
    .line 74
    invoke-virtual {v3}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-static {v3}, Ll/u9t;->a(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-nez v3, :cond_1

    .line 83
    .line 84
    move v1, v2

    .line 85
    :cond_1
    if-nez v0, :cond_3

    .line 86
    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    return-void

    .line 91
    :cond_3
    :goto_1
    new-instance v0, Ll/boy;

    .line 92
    .line 93
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 94
    .line 95
    invoke-direct {v0, v1}, Ll/boy;-><init>(Ll/dum;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 99
    .line 100
    .line 101
    return-void
.end method
