.class public Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:J

.field public c:I

.field public d:I

.field public e:I

.field public f:J

.field public g:J

.field public h:J

.field public i:[I

.field public j:[I

.field public final synthetic k:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->k:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->values()[Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    array-length p1, p1

    .line 11
    new-array p1, p1, [I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->i:[I

    .line 14
    .line 15
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->values()[Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    array-length p1, p1

    .line 20
    new-array p1, p1, [I

    .line 21
    .line 22
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->j:[I

    .line 23
    .line 24
    iput-object p2, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->a:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->g:J

    .line 10
    .line 11
    :cond_0
    rsub-int/lit8 v0, p1, 0x3c

    .line 12
    .line 13
    iget-wide v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->b:J

    .line 14
    .line 15
    int-to-long v3, v0

    .line 16
    iget-object v5, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->k:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 17
    .line 18
    invoke-static {v5}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->v(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)J

    .line 19
    .line 20
    .line 21
    move-result-wide v5

    .line 22
    mul-long/2addr v3, v5

    .line 23
    const-wide/32 v5, 0xf4240

    .line 24
    .line 25
    .line 26
    div-long/2addr v3, v5

    .line 27
    add-long/2addr v1, v3

    .line 28
    iput-wide v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->b:J

    .line 29
    .line 30
    iget v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->c:I

    .line 31
    .line 32
    add-int/2addr v1, v0

    .line 33
    iput v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->c:I

    .line 34
    .line 35
    iget v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->e:I

    .line 36
    .line 37
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    iput v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->e:I

    .line 40
    .line 41
    iget v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->d:I

    .line 42
    .line 43
    add-int/2addr v1, p1

    .line 44
    iput v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->d:I

    .line 45
    .line 46
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->k:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->u(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)Ll/i4j;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/i4j;->c()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-lt v0, p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->i:[I

    .line 59
    .line 60
    sget-object v1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->frozen:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 61
    .line 62
    iget v1, v1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->index:I

    .line 63
    .line 64
    aget v2, p1, v1

    .line 65
    .line 66
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    aput v2, p1, v1

    .line 69
    .line 70
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->j:[I

    .line 71
    .line 72
    aget p1, p0, v1

    .line 73
    .line 74
    add-int/2addr p1, v0

    .line 75
    aput p1, p0, v1

    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->k:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 79
    .line 80
    invoke-static {p1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->u(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)Ll/i4j;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ll/i4j;->d()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iget-object v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->i:[I

    .line 89
    .line 90
    if-lt v0, p1, :cond_2

    .line 91
    .line 92
    sget-object p1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->high:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 93
    .line 94
    iget p1, p1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->index:I

    .line 95
    .line 96
    aget v2, v1, p1

    .line 97
    .line 98
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    aput v2, v1, p1

    .line 101
    .line 102
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->j:[I

    .line 103
    .line 104
    aget v1, p0, p1

    .line 105
    .line 106
    add-int/2addr v1, v0

    .line 107
    aput v1, p0, p1

    .line 108
    .line 109
    return-void

    .line 110
    :cond_2
    sget-object p1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->middle:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 111
    .line 112
    iget p1, p1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->index:I

    .line 113
    .line 114
    aget v2, v1, p1

    .line 115
    .line 116
    add-int/lit8 v2, v2, 0x1

    .line 117
    .line 118
    aput v2, v1, p1

    .line 119
    .line 120
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->j:[I

    .line 121
    .line 122
    aget v1, p0, p1

    .line 123
    .line 124
    add-int/2addr v1, v0

    .line 125
    aput v1, p0, p1

    .line 126
    .line 127
    return-void
.end method

.method public b()V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v3, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v8

    .line 8
    iput-wide v8, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->h:J

    .line 9
    .line 10
    new-instance v4, Ll/j4j;

    .line 11
    .line 12
    iget-object v5, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->a:Ljava/lang/String;

    .line 13
    .line 14
    iget-wide v6, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->g:J

    .line 15
    .line 16
    iget-object v10, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->i:[I

    .line 17
    .line 18
    sget-object v11, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->frozen:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 19
    .line 20
    iget v11, v11, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->index:I

    .line 21
    .line 22
    move-object v12, v10

    .line 23
    aget v10, v12, v11

    .line 24
    .line 25
    iget-object v13, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->j:[I

    .line 26
    .line 27
    aget v11, v13, v11

    .line 28
    .line 29
    sget-object v14, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->high:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 30
    .line 31
    iget v14, v14, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->index:I

    .line 32
    .line 33
    move-object v15, v12

    .line 34
    aget v12, v15, v14

    .line 35
    .line 36
    aget v14, v13, v14

    .line 37
    .line 38
    sget-object v1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->middle:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;

    .line 39
    .line 40
    iget v1, v1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;->index:I

    .line 41
    .line 42
    aget v2, v15, v1

    .line 43
    .line 44
    aget v15, v13, v1

    .line 45
    .line 46
    move v13, v14

    .line 47
    move v14, v2

    .line 48
    invoke-direct/range {v4 .. v15}, Ll/j4j;-><init>(Ljava/lang/String;JJIIIIII)V

    .line 49
    .line 50
    .line 51
    iget-object v1, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->k:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->j()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v4, v1}, Ll/eoi0;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->k:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 61
    .line 62
    invoke-virtual {v1, v4}, Ll/ioi0;->q(Ll/eoi0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    :catchall_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v1

    .line 69
    iput-wide v1, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->f:J

    .line 70
    .line 71
    iput v3, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->c:I

    .line 72
    .line 73
    const-wide/16 v1, 0x0

    .line 74
    .line 75
    iput-wide v1, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->b:J

    .line 76
    .line 77
    iput v3, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->d:I

    .line 78
    .line 79
    iput v3, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->e:I

    .line 80
    .line 81
    return-void
.end method
