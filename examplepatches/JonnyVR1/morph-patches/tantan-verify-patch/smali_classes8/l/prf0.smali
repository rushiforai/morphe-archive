.class public Ll/prf0;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field private a:Ll/nrf0;

.field private b:F


# direct methods
.method public constructor <init>()V
    .locals 9

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3f4ccccd    # 0.8f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/prf0;->b:F

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Ll/wej;->useNewViewPort:Z

    .line 11
    .line 12
    new-instance v2, Landroid/graphics/Point;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct {v2, v3, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 16
    .line 17
    .line 18
    new-instance v4, Landroid/graphics/Point;

    .line 19
    .line 20
    const/16 v5, 0xff

    .line 21
    .line 22
    invoke-direct {v4, v5, v5}, Landroid/graphics/Point;-><init>(II)V

    .line 23
    .line 24
    .line 25
    filled-new-array {v2, v4}, [Landroid/graphics/Point;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    new-instance v4, Landroid/graphics/Point;

    .line 30
    .line 31
    invoke-direct {v4, v3, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 32
    .line 33
    .line 34
    new-instance v6, Landroid/graphics/Point;

    .line 35
    .line 36
    const/16 v7, 0x78

    .line 37
    .line 38
    const/16 v8, 0x92

    .line 39
    .line 40
    invoke-direct {v6, v7, v8}, Landroid/graphics/Point;-><init>(II)V

    .line 41
    .line 42
    .line 43
    new-instance v7, Landroid/graphics/Point;

    .line 44
    .line 45
    invoke-direct {v7, v5, v5}, Landroid/graphics/Point;-><init>(II)V

    .line 46
    .line 47
    .line 48
    filled-new-array {v4, v6, v7}, [Landroid/graphics/Point;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    new-instance v5, Ll/cxd0;

    .line 53
    .line 54
    const/high16 v6, 0x3f800000    # 1.0f

    .line 55
    .line 56
    invoke-direct {v5, v6}, Ll/cxd0;-><init>(F)V

    .line 57
    .line 58
    .line 59
    new-instance v6, Ll/z1j0;

    .line 60
    .line 61
    invoke-direct {v6, v2, v2, v2, v4}, Ll/z1j0;-><init>([Landroid/graphics/Point;[Landroid/graphics/Point;[Landroid/graphics/Point;[Landroid/graphics/Point;)V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/kkc0;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/kkc0;-><init>()V

    .line 67
    .line 68
    .line 69
    new-instance v4, Ll/nrf0;

    .line 70
    .line 71
    invoke-direct {v4, v0}, Ll/nrf0;-><init>(F)V

    .line 72
    .line 73
    .line 74
    iput-object v4, p0, Ll/prf0;->a:Ll/nrf0;

    .line 75
    .line 76
    invoke-virtual {v5, v6}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v5, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 83
    .line 84
    invoke-virtual {v5, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 88
    .line 89
    invoke-virtual {v6, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 93
    .line 94
    invoke-virtual {v2, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 98
    .line 99
    invoke-virtual {v0, v5, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 103
    .line 104
    invoke-virtual {v0, v6, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 108
    .line 109
    const/4 v1, 0x2

    .line 110
    invoke-virtual {v0, v2, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 114
    .line 115
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v5}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v6}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method


# virtual methods
.method public setSmoothLevel(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Ll/prf0;->a:Ll/nrf0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/nrf0;->Q1(F)V

    .line 9
    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method
