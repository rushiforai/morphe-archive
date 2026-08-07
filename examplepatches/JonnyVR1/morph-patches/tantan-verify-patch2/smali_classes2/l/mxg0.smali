.class public final Ll/mxg0;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public final a:Ll/zyg0;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Ll/zyg0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/mxg0;->a:Ll/zyg0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-eq v0, v3, :cond_3

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-eq v0, v1, :cond_2

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    sget-object p0, Ll/feg0;->i:Ll/txg0;

    .line 20
    .line 21
    new-instance v0, Ll/hvg0;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/hvg0;-><init>(Landroid/os/Message;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p0, p0, Ll/mxg0;->a:Ll/zyg0;

    .line 31
    .line 32
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Ljava/lang/Long;

    .line 35
    .line 36
    iget v0, p0, Ll/zyg0;->k:I

    .line 37
    .line 38
    add-int/2addr v0, v3

    .line 39
    iput v0, p0, Ll/zyg0;->k:I

    .line 40
    .line 41
    iget-wide v0, p0, Ll/zyg0;->e:J

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    add-long/2addr v2, v0

    .line 48
    iput-wide v2, p0, Ll/zyg0;->e:J

    .line 49
    .line 50
    iget p1, p0, Ll/zyg0;->k:I

    .line 51
    .line 52
    int-to-long v0, p1

    .line 53
    div-long/2addr v2, v0

    .line 54
    iput-wide v2, p0, Ll/zyg0;->h:J

    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-object p0, p0, Ll/mxg0;->a:Ll/zyg0;

    .line 58
    .line 59
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 60
    .line 61
    int-to-long v0, p1

    .line 62
    iget p1, p0, Ll/zyg0;->m:I

    .line 63
    .line 64
    add-int/2addr p1, v3

    .line 65
    iput p1, p0, Ll/zyg0;->m:I

    .line 66
    .line 67
    iget-wide v2, p0, Ll/zyg0;->g:J

    .line 68
    .line 69
    add-long/2addr v2, v0

    .line 70
    iput-wide v2, p0, Ll/zyg0;->g:J

    .line 71
    .line 72
    iget p1, p0, Ll/zyg0;->l:I

    .line 73
    .line 74
    int-to-long v0, p1

    .line 75
    div-long/2addr v2, v0

    .line 76
    iput-wide v2, p0, Ll/zyg0;->j:J

    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    iget-object p0, p0, Ll/mxg0;->a:Ll/zyg0;

    .line 80
    .line 81
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 82
    .line 83
    int-to-long v0, p1

    .line 84
    iget p1, p0, Ll/zyg0;->l:I

    .line 85
    .line 86
    add-int/2addr p1, v3

    .line 87
    iput p1, p0, Ll/zyg0;->l:I

    .line 88
    .line 89
    iget-wide v2, p0, Ll/zyg0;->f:J

    .line 90
    .line 91
    add-long/2addr v2, v0

    .line 92
    iput-wide v2, p0, Ll/zyg0;->f:J

    .line 93
    .line 94
    int-to-long v0, p1

    .line 95
    div-long/2addr v2, v0

    .line 96
    iput-wide v2, p0, Ll/zyg0;->i:J

    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    iget-object p0, p0, Ll/mxg0;->a:Ll/zyg0;

    .line 100
    .line 101
    iget-wide v3, p0, Ll/zyg0;->d:J

    .line 102
    .line 103
    add-long/2addr v3, v1

    .line 104
    iput-wide v3, p0, Ll/zyg0;->d:J

    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    iget-object p0, p0, Ll/mxg0;->a:Ll/zyg0;

    .line 108
    .line 109
    iget-wide v3, p0, Ll/zyg0;->c:J

    .line 110
    .line 111
    add-long/2addr v3, v1

    .line 112
    iput-wide v3, p0, Ll/zyg0;->c:J

    .line 113
    .line 114
    return-void
.end method
