.class public abstract Ll/grx;
.super Lcom/momo/pipline/codec/MediaBaseCodecFilter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/grx$d;,
        Ll/grx$c;,
        Ll/grx$a;,
        Ll/grx$b;
    }
.end annotation


# static fields
.field public static k1:I = 0x800


# instance fields
.field private E0:Z

.field protected F0:Z

.field private G0:Ljava/lang/Object;

.field protected H0:Z

.field private I0:Ll/grx$a;

.field private J0:Ll/grx$c;

.field private K0:Ll/grx$d;

.field private L0:Ll/grx$b;

.field private M0:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private N0:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private O0:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field protected P0:Ljava/nio/ByteBuffer;

.field protected Q0:Ljava/nio/ByteBuffer;

.field protected R0:Ljava/nio/ByteBuffer;

.field private S:Ll/nsx;

.field protected S0:Ljava/nio/ByteBuffer;

.field private final T:Ljava/lang/String;

.field protected T0:Ljava/nio/ByteBuffer;

.field public U:Z

.field protected U0:Ljava/nio/ByteBuffer;

.field private V:Ll/g220;

.field protected V0:Ljava/nio/ByteBuffer;

.field private W:Ljava/lang/Object;

.field protected W0:Ljava/nio/ByteBuffer;

.field private X:Ljava/lang/Object;

.field public X0:Z

.field private Y:Ljava/lang/Object;

.field public Y0:Z

.field protected Z:Z

.field protected Z0:J

.field a1:[B

.field b1:[B

.field c1:[B

.field d1:Ljava/lang/String;

.field protected e1:Ljava/lang/String;

.field protected f1:Z

.field private final g1:Ljava/lang/String;

.field private final h1:Ljava/lang/String;

.field i1:Ll/uow;

.field private j1:Lcom/momo/x264/x264sdk;

.field protected k0:I

.field protected p0:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Ll/l26;->a:Landroid/content/Context;

    .line 4
    .line 5
    :cond_0
    invoke-direct {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Ll/grx;->S:Ll/nsx;

    .line 10
    .line 11
    const-string v0, "MediaCodecFilter"

    .line 12
    .line 13
    iput-object v0, p0, Ll/grx;->T:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/grx;->U:Z

    .line 17
    .line 18
    new-instance v1, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/grx;->X:Ljava/lang/Object;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput-boolean v1, p0, Ll/grx;->Z:Z

    .line 27
    .line 28
    iput v0, p0, Ll/grx;->k0:I

    .line 29
    .line 30
    const/4 v2, -0x1

    .line 31
    iput v2, p0, Ll/grx;->p0:I

    .line 32
    .line 33
    iput-boolean v1, p0, Ll/grx;->E0:Z

    .line 34
    .line 35
    iput-boolean v1, p0, Ll/grx;->F0:Z

    .line 36
    .line 37
    new-instance v2, Ljava/lang/Object;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Ll/grx;->G0:Ljava/lang/Object;

    .line 43
    .line 44
    iput-object p1, p0, Ll/grx;->K0:Ll/grx$d;

    .line 45
    .line 46
    new-instance v2, Ljava/util/LinkedList;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v2, p0, Ll/grx;->M0:Ljava/util/LinkedList;

    .line 52
    .line 53
    new-instance v2, Ljava/util/LinkedList;

    .line 54
    .line 55
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v2, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 59
    .line 60
    new-instance v2, Ljava/util/LinkedList;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Ll/grx;->O0:Ljava/util/LinkedList;

    .line 66
    .line 67
    iput-boolean v1, p0, Ll/grx;->X0:Z

    .line 68
    .line 69
    iput-boolean v1, p0, Ll/grx;->Y0:Z

    .line 70
    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v1

    .line 75
    iput-wide v1, p0, Ll/grx;->Z0:J

    .line 76
    .line 77
    const/4 v1, 0x7

    .line 78
    new-array v1, v1, [B

    .line 79
    .line 80
    fill-array-data v1, :array_0

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Ll/grx;->a1:[B

    .line 84
    .line 85
    const/16 v1, 0x18

    .line 86
    .line 87
    new-array v1, v1, [B

    .line 88
    .line 89
    fill-array-data v1, :array_1

    .line 90
    .line 91
    .line 92
    iput-object v1, p0, Ll/grx;->b1:[B

    .line 93
    .line 94
    const/4 v1, 0x4

    .line 95
    new-array v1, v1, [B

    .line 96
    .line 97
    fill-array-data v1, :array_2

    .line 98
    .line 99
    .line 100
    iput-object v1, p0, Ll/grx;->c1:[B

    .line 101
    .line 102
    const-string v1, "momoa9a427d1andr22"

    .line 103
    .line 104
    iput-object v1, p0, Ll/grx;->d1:Ljava/lang/String;

    .line 105
    .line 106
    const-string v1, "{}"

    .line 107
    .line 108
    iput-object v1, p0, Ll/grx;->e1:Ljava/lang/String;

    .line 109
    .line 110
    iput-boolean v0, p0, Ll/grx;->f1:Z

    .line 111
    .line 112
    const-string v0, "video/avc"

    .line 113
    .line 114
    iput-object v0, p0, Ll/grx;->g1:Ljava/lang/String;

    .line 115
    .line 116
    const-string v0, "video/hevc"

    .line 117
    .line 118
    iput-object v0, p0, Ll/grx;->h1:Ljava/lang/String;

    .line 119
    .line 120
    iput-object p1, p0, Ll/grx;->j1:Lcom/momo/x264/x264sdk;

    .line 121
    .line 122
    return-void

    .line 123
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
        0x6t
        0x64t
        0x2et
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
        0x4et
        0x1t
        0x5t
        0x2et
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_2
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method private F2(I)I
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0

    .line 6
    :pswitch_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/csx;->f()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :pswitch_1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/csx;->g()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :pswitch_2
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/csx;->d()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :pswitch_3
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/csx;->h()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :pswitch_4
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/csx;->e()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :pswitch_data_0
    .packed-switch 0x100
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private H2(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const-string p0, "000"

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    const-string p0, "mmrtc"

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    const-string p0, "tx"

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    const-string p0, "agora"

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    const-string p0, "weila"

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    const-string p0, "ijk"

    .line 20
    .line 21
    return-object p0

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x100
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private L2(Ll/oxd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/grx;->Y:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/grx;->O0:Ljava/util/LinkedList;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :catch_0
    move-exception p0

    .line 15
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p0
.end method

.method private M2(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/grx;->W:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/grx;->M0:Ljava/util/LinkedList;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :catch_0
    move-exception p0

    .line 15
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p0
.end method

.method private N2(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/grx;->X:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x2

    .line 13
    if-le v1, v2, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_3

    .line 23
    :catch_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    goto :goto_2

    .line 31
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_2
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method

.method public static synthetic q2(Ll/grx;)Ll/g220;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->V:Ll/g220;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r2(Ll/grx;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->Y:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method private release()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/grx;->V:Ll/g220;

    .line 2
    .line 3
    const-string v1, "mMuxerWrapper stop ##############"

    .line 4
    .line 5
    const-string v2, "MediaCodecFilter"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/grx;->V:Ll/g220;

    .line 17
    .line 18
    invoke-interface {v0}, Ll/g220;->k1()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/grx;->S:Ll/nsx;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v4, "mMediaEncoder stop ##############"

    .line 31
    .line 32
    invoke-virtual {v0, v2, v4}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/grx;->S:Ll/nsx;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/nsx;->h()V

    .line 38
    .line 39
    .line 40
    iput-object v3, p0, Ll/grx;->S:Ll/nsx;

    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/grx;->J0:Ll/grx$c;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/grx$c;->c()V

    .line 47
    .line 48
    .line 49
    iput-object v3, p0, Ll/grx;->J0:Ll/grx$c;

    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Ll/grx;->I0:Ll/grx$a;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/grx$a;->c()V

    .line 56
    .line 57
    .line 58
    iput-object v3, p0, Ll/grx;->I0:Ll/grx$a;

    .line 59
    .line 60
    :cond_3
    iget-object v0, p0, Ll/grx;->K0:Ll/grx$d;

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/grx$d;->a()V

    .line 65
    .line 66
    .line 67
    iput-object v3, p0, Ll/grx;->K0:Ll/grx$d;

    .line 68
    .line 69
    :cond_4
    iget-object v0, p0, Ll/grx;->L0:Ll/grx$b;

    .line 70
    .line 71
    if-eqz v0, :cond_5

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/grx$b;->a()V

    .line 74
    .line 75
    .line 76
    iput-object v3, p0, Ll/grx;->L0:Ll/grx$b;

    .line 77
    .line 78
    :cond_5
    iget-object v0, p0, Ll/grx;->V:Ll/g220;

    .line 79
    .line 80
    if-eqz v0, :cond_6

    .line 81
    .line 82
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/grx;->V:Ll/g220;

    .line 90
    .line 91
    invoke-interface {v0}, Ll/g220;->k1()V

    .line 92
    .line 93
    .line 94
    iput-object v3, p0, Ll/grx;->V:Ll/g220;

    .line 95
    .line 96
    :cond_6
    iget-object v0, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 97
    .line 98
    if-eqz v0, :cond_7

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 101
    .line 102
    .line 103
    iput-object v3, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    :cond_7
    iget-object v0, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    if-eqz v0, :cond_8

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    iput-object v3, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    :cond_8
    iget-object v0, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    if-eqz v0, :cond_9

    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 119
    .line 120
    .line 121
    iput-object v3, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 122
    .line 123
    :cond_9
    iget-object v0, p0, Ll/grx;->S0:Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    if-eqz v0, :cond_a

    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 128
    .line 129
    .line 130
    iput-object v3, p0, Ll/grx;->S0:Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    :cond_a
    iget-object v0, p0, Ll/grx;->T0:Ljava/nio/ByteBuffer;

    .line 133
    .line 134
    if-eqz v0, :cond_b

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 137
    .line 138
    .line 139
    iput-object v3, p0, Ll/grx;->T0:Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    :cond_b
    iget-object v0, p0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    if-eqz v0, :cond_c

    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 146
    .line 147
    .line 148
    iput-object v3, p0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 149
    .line 150
    :cond_c
    return-void
.end method

.method public static synthetic s2(Ll/grx;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->O0:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t2(Ll/grx;Ljava/util/LinkedList;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grx;->O0:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic u2(Ll/grx;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->W:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v2(Ll/grx;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->M0:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w2(Ll/grx;Ljava/util/LinkedList;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grx;->M0:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic x2(Ll/grx;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->X:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y2(Ll/grx;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z2(Ll/grx;Ljava/util/LinkedList;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public A2(Ljava/nio/ByteBuffer;IZI)Ljava/nio/ByteBuffer;
    .locals 7

    .line 1
    new-array p3, p2, [B

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x4

    .line 10
    aget-byte p1, p3, p1

    .line 11
    .line 12
    and-int/lit8 p1, p1, 0x1f

    .line 13
    .line 14
    const/4 v0, 0x7

    .line 15
    const/4 v1, 0x0

    .line 16
    if-ne p1, v0, :cond_c

    .line 17
    .line 18
    move p1, v1

    .line 19
    :goto_0
    add-int/lit8 v0, p2, -0x4

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-ge p1, v0, :cond_2

    .line 23
    .line 24
    aget-byte v3, p3, p1

    .line 25
    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    add-int/lit8 v3, p1, 0x1

    .line 29
    .line 30
    aget-byte v3, p3, v3

    .line 31
    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    add-int/lit8 v3, p1, 0x2

    .line 35
    .line 36
    aget-byte v3, p3, v3

    .line 37
    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    add-int/lit8 v3, p1, 0x3

    .line 41
    .line 42
    aget-byte v3, p3, v3

    .line 43
    .line 44
    if-ne v3, v2, :cond_1

    .line 45
    .line 46
    add-int/lit8 v3, p1, 0x4

    .line 47
    .line 48
    aget-byte v3, p3, v3

    .line 49
    .line 50
    and-int/lit8 v3, v3, 0x1f

    .line 51
    .line 52
    const/16 v4, 0x8

    .line 53
    .line 54
    if-ne v3, v4, :cond_1

    .line 55
    .line 56
    if-nez p4, :cond_0

    .line 57
    .line 58
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iput-object v3, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    invoke-virtual {v3, p3, v1, p1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iput-object v3, p0, Ll/grx;->T0:Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    invoke-virtual {v3, p3, v1, p1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    move p1, v1

    .line 82
    :goto_1
    add-int/lit8 v3, p1, 0x4

    .line 83
    .line 84
    move v4, v1

    .line 85
    :goto_2
    if-ge v3, v0, :cond_9

    .line 86
    .line 87
    aget-byte v5, p3, v3

    .line 88
    .line 89
    if-nez v5, :cond_8

    .line 90
    .line 91
    add-int/lit8 v5, v3, 0x1

    .line 92
    .line 93
    aget-byte v5, p3, v5

    .line 94
    .line 95
    if-nez v5, :cond_8

    .line 96
    .line 97
    add-int/lit8 v5, v3, 0x2

    .line 98
    .line 99
    aget-byte v5, p3, v5

    .line 100
    .line 101
    if-nez v5, :cond_8

    .line 102
    .line 103
    add-int/lit8 v5, v3, 0x3

    .line 104
    .line 105
    aget-byte v5, p3, v5

    .line 106
    .line 107
    if-ne v5, v2, :cond_8

    .line 108
    .line 109
    and-int/lit8 v5, v5, 0x1f

    .line 110
    .line 111
    const/4 v6, 0x6

    .line 112
    if-ne v5, v6, :cond_5

    .line 113
    .line 114
    if-nez v4, :cond_8

    .line 115
    .line 116
    if-nez p4, :cond_3

    .line 117
    .line 118
    iget-object v4, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    if-nez v4, :cond_4

    .line 121
    .line 122
    sub-int v4, v3, p1

    .line 123
    .line 124
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    iput-object v5, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    invoke-virtual {v5, p3, p1, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_3
    iget-object v4, p0, Ll/grx;->S0:Ljava/nio/ByteBuffer;

    .line 135
    .line 136
    if-nez v4, :cond_4

    .line 137
    .line 138
    sub-int v4, v3, p1

    .line 139
    .line 140
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    iput-object v5, p0, Ll/grx;->S0:Ljava/nio/ByteBuffer;

    .line 145
    .line 146
    invoke-virtual {v5, p3, p1, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    .line 149
    :cond_4
    :goto_3
    move v4, v3

    .line 150
    goto :goto_5

    .line 151
    :cond_5
    if-nez v4, :cond_a

    .line 152
    .line 153
    if-nez p4, :cond_6

    .line 154
    .line 155
    iget-object p4, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    if-nez p4, :cond_7

    .line 158
    .line 159
    sub-int p4, v3, p1

    .line 160
    .line 161
    invoke-static {p4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    invoke-virtual {v0, p3, p1, p4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_6
    iget-object p4, p0, Ll/grx;->S0:Ljava/nio/ByteBuffer;

    .line 172
    .line 173
    if-nez p4, :cond_7

    .line 174
    .line 175
    sub-int p4, v3, p1

    .line 176
    .line 177
    invoke-static {p4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iput-object v0, p0, Ll/grx;->S0:Ljava/nio/ByteBuffer;

    .line 182
    .line 183
    invoke-virtual {v0, p3, p1, p4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    .line 186
    :cond_7
    :goto_4
    move v4, v3

    .line 187
    goto :goto_6

    .line 188
    :cond_8
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_9
    move v3, v1

    .line 192
    :cond_a
    :goto_6
    iget-boolean p1, p0, Ll/grx;->f1:Z

    .line 193
    .line 194
    invoke-virtual {p0, p1}, Ll/grx;->C2(Z)[B

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    if-eqz p0, :cond_b

    .line 199
    .line 200
    array-length p1, p0

    .line 201
    add-int/2addr p1, p2

    .line 202
    goto :goto_7

    .line 203
    :cond_b
    move p1, p2

    .line 204
    :goto_7
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p1, p3, v1, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 212
    .line 213
    .line 214
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 215
    .line 216
    .line 217
    move-result-object p4

    .line 218
    const-string v0, "keyframe put sei"

    .line 219
    .line 220
    const-string v2, "ContentValues"

    .line 221
    .line 222
    invoke-virtual {p4, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    array-length p4, p0

    .line 226
    invoke-virtual {p1, p0, v1, p4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 227
    .line 228
    .line 229
    sub-int/2addr p2, v3

    .line 230
    invoke-virtual {p1, p3, v3, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 231
    .line 232
    .line 233
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    const-string p2, "merge keyframe compile"

    .line 238
    .line 239
    invoke-virtual {p0, v2, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    return-object p1

    .line 243
    :cond_c
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0, p3, v1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 251
    .line 252
    .line 253
    return-object p0
.end method

.method public B2(Ljava/nio/ByteBuffer;IZ)Ljava/nio/ByteBuffer;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    new-array v3, v1, [B

    .line 8
    .line 9
    move-object/from16 v4, p1

    .line 10
    .line 11
    invoke-virtual {v4, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v5

    .line 18
    iget-object v7, v0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    const/4 v8, 0x0

    .line 21
    if-eqz v7, :cond_0

    .line 22
    .line 23
    invoke-virtual {v7}, Ljava/nio/Buffer;->limit()I

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v7, v8

    .line 29
    :goto_0
    const/4 v9, 0x1

    .line 30
    if-eqz v7, :cond_1

    .line 31
    .line 32
    move v10, v9

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v10, v8

    .line 35
    :goto_1
    const-string v11, " isKey "

    .line 36
    .line 37
    const-string v12, " nalu_type "

    .line 38
    .line 39
    const-string v13, "ContentValues"

    .line 40
    .line 41
    const/4 v14, 0x4

    .line 42
    if-eqz v10, :cond_2

    .line 43
    .line 44
    aget-byte v14, v3, v14

    .line 45
    .line 46
    and-int/lit8 v14, v14, 0x7e

    .line 47
    .line 48
    shr-int/lit8 v9, v14, 0x1

    .line 49
    .line 50
    new-instance v14, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v15, "decorateVideoBuffer isHevc "

    .line 53
    .line 54
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v11

    .line 76
    invoke-static {v13, v11}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    const/16 v11, 0x22

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_2
    aget-byte v9, v3, v14

    .line 83
    .line 84
    and-int/lit8 v9, v9, 0x1f

    .line 85
    .line 86
    new-instance v14, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v15, "decorateVideoBuffer isH264 "

    .line 89
    .line 90
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v11

    .line 112
    invoke-static {v13, v11}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    const/4 v11, 0x7

    .line 116
    :goto_2
    if-eqz v2, :cond_6

    .line 117
    .line 118
    iget-object v1, v0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    if-eqz v1, :cond_3

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    goto :goto_3

    .line 127
    :cond_3
    move v1, v8

    .line 128
    :goto_3
    iget-object v12, v0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    if-eqz v12, :cond_4

    .line 131
    .line 132
    invoke-virtual {v12}, Ljava/nio/Buffer;->limit()I

    .line 133
    .line 134
    .line 135
    move-result v12

    .line 136
    goto :goto_4

    .line 137
    :cond_4
    move v12, v8

    .line 138
    :goto_4
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    add-int/2addr v4, v1

    .line 143
    add-int/2addr v4, v12

    .line 144
    add-int/2addr v4, v7

    .line 145
    iget-boolean v1, v0, Ll/grx;->f1:Z

    .line 146
    .line 147
    invoke-virtual {v0, v1, v10}, Ll/grx;->D2(ZZ)[B

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    if-eqz v1, :cond_5

    .line 152
    .line 153
    array-length v7, v1

    .line 154
    add-int/2addr v4, v7

    .line 155
    :cond_5
    move/from16 v16, v4

    .line 156
    .line 157
    move-object v4, v1

    .line 158
    move/from16 v1, v16

    .line 159
    .line 160
    goto :goto_5

    .line 161
    :cond_6
    iget-wide v12, v0, Ll/grx;->Z0:J

    .line 162
    .line 163
    sub-long v12, v5, v12

    .line 164
    .line 165
    const-wide/16 v14, 0x5dc

    .line 166
    .line 167
    cmp-long v4, v12, v14

    .line 168
    .line 169
    if-ltz v4, :cond_7

    .line 170
    .line 171
    iget-boolean v4, v0, Ll/grx;->f1:Z

    .line 172
    .line 173
    invoke-virtual {v0, v4, v10}, Ll/grx;->D2(ZZ)[B

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    if-eqz v4, :cond_8

    .line 178
    .line 179
    array-length v7, v4

    .line 180
    add-int/2addr v1, v7

    .line 181
    goto :goto_5

    .line 182
    :cond_7
    const/4 v4, 0x0

    .line 183
    :cond_8
    :goto_5
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v1, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 188
    .line 189
    .line 190
    if-eqz v2, :cond_b

    .line 191
    .line 192
    iget-object v2, v0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 193
    .line 194
    if-eqz v2, :cond_9

    .line 195
    .line 196
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 197
    .line 198
    .line 199
    iget-object v2, v0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 200
    .line 201
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 206
    .line 207
    .line 208
    :cond_9
    iget-object v2, v0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 209
    .line 210
    if-eqz v2, :cond_a

    .line 211
    .line 212
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 213
    .line 214
    .line 215
    iget-object v2, v0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 216
    .line 217
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 222
    .line 223
    .line 224
    :cond_a
    iget-object v2, v0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 225
    .line 226
    if-eqz v2, :cond_b

    .line 227
    .line 228
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 229
    .line 230
    .line 231
    iget-object v2, v0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 232
    .line 233
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 238
    .line 239
    .line 240
    :cond_b
    if-eqz v4, :cond_c

    .line 241
    .line 242
    if-eq v9, v11, :cond_c

    .line 243
    .line 244
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 245
    .line 246
    .line 247
    iput-wide v5, v0, Ll/grx;->Z0:J

    .line 248
    .line 249
    :cond_c
    iget-object v2, v0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 250
    .line 251
    if-eqz v2, :cond_d

    .line 252
    .line 253
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 254
    .line 255
    .line 256
    :cond_d
    iget-object v2, v0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 257
    .line 258
    if-eqz v2, :cond_e

    .line 259
    .line 260
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 261
    .line 262
    .line 263
    :cond_e
    iget-object v0, v0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 264
    .line 265
    if-eqz v0, :cond_f

    .line 266
    .line 267
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 268
    .line 269
    .line 270
    :cond_f
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 271
    .line 272
    .line 273
    return-object v1
.end method

.method public C2(Z)[B
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/grx;->D2(ZZ)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public D2(ZZ)[B
    .locals 9

    .line 1
    const-string v0, "ts"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p2, :cond_1

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Ll/grx;->j1:Lcom/momo/x264/x264sdk;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    new-instance p1, Lcom/momo/x264/x264sdk;

    .line 13
    .line 14
    invoke-direct {p1, v1}, Lcom/momo/x264/x264sdk;-><init>(Lcom/momo/x264/x264sdk$listener;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/grx;->j1:Lcom/momo/x264/x264sdk;

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Ll/grx;->j1:Lcom/momo/x264/x264sdk;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/momo/x264/x264sdk;->getEnabled()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p1, 0x1

    .line 30
    :goto_0
    new-instance v2, Ljava/lang/String;

    .line 31
    .line 32
    if-eqz p2, :cond_2

    .line 33
    .line 34
    iget-object v3, p0, Ll/grx;->b1:[B

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    iget-object v3, p0, Ll/grx;->a1:[B

    .line 38
    .line 39
    :goto_1
    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    .line 40
    .line 41
    .line 42
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 43
    .line 44
    iget-object v4, p0, Ll/grx;->e1:Ljava/lang/String;

    .line 45
    .line 46
    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_3

    .line 54
    .line 55
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    :cond_3
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y1()J

    .line 59
    .line 60
    .line 61
    move-result-wide v4

    .line 62
    invoke-virtual {v3, v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    move-object v1, v3

    .line 66
    :catch_0
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Ll/grx;->e1:Ljava/lang/String;

    .line 73
    .line 74
    :cond_4
    iget-object v0, p0, Ll/grx;->e1:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    array-length v0, v0

    .line 81
    int-to-short v0, v0

    .line 82
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    new-instance v3, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v4, "genSei len :"

    .line 89
    .line 90
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v4, ""

    .line 97
    .line 98
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    const-string v4, "ContentValues"

    .line 106
    .line 107
    invoke-virtual {v1, v4, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    if-eqz p1, :cond_5

    .line 111
    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Ll/grx;->d1:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Ll/grx;->e1:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    goto :goto_2

    .line 135
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    iget-object v2, p0, Ll/grx;->d1:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Ll/grx;->e1:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    :goto_2
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    const-string v3, "seiSei: length="

    .line 159
    .line 160
    const/16 v5, 0x10

    .line 161
    .line 162
    const/16 v6, 0x11

    .line 163
    .line 164
    if-eqz p1, :cond_7

    .line 165
    .line 166
    const/4 p0, 0x5

    .line 167
    const/4 p1, 0x6

    .line 168
    const/16 v7, 0x17

    .line 169
    .line 170
    if-eqz p2, :cond_6

    .line 171
    .line 172
    and-int/lit16 p2, v0, 0xff

    .line 173
    .line 174
    int-to-byte p2, p2

    .line 175
    const/16 v8, 0x29

    .line 176
    .line 177
    aput-byte p2, v2, v8

    .line 178
    .line 179
    shr-int/lit8 p2, v0, 0x8

    .line 180
    .line 181
    and-int/lit16 p2, p2, 0xff

    .line 182
    .line 183
    int-to-byte p2, p2

    .line 184
    const/16 v8, 0x28

    .line 185
    .line 186
    aput-byte p2, v2, v8

    .line 187
    .line 188
    add-int/lit8 v0, v0, 0x21

    .line 189
    .line 190
    int-to-short p2, v0

    .line 191
    and-int/lit16 p2, p2, 0xff

    .line 192
    .line 193
    int-to-byte p2, p2

    .line 194
    const/4 v0, 0x7

    .line 195
    aput-byte p2, v2, v0

    .line 196
    .line 197
    aput-byte p0, v2, p1

    .line 198
    .line 199
    const/16 p0, 0x2c

    .line 200
    .line 201
    const/16 p1, 0x8

    .line 202
    .line 203
    aput-byte p0, v2, p1

    .line 204
    .line 205
    const/16 p0, -0x5e

    .line 206
    .line 207
    const/16 p1, 0x9

    .line 208
    .line 209
    aput-byte p0, v2, p1

    .line 210
    .line 211
    const/16 p0, 0xa

    .line 212
    .line 213
    const/16 p2, -0x22

    .line 214
    .line 215
    aput-byte p2, v2, p0

    .line 216
    .line 217
    const/16 p0, 0xb

    .line 218
    .line 219
    aput-byte p1, v2, p0

    .line 220
    .line 221
    const/16 p0, 0xc

    .line 222
    .line 223
    const/16 p1, -0x4b

    .line 224
    .line 225
    aput-byte p1, v2, p0

    .line 226
    .line 227
    const/16 p0, 0xd

    .line 228
    .line 229
    aput-byte v7, v2, p0

    .line 230
    .line 231
    const/16 p0, 0xe

    .line 232
    .line 233
    const/16 p1, 0x47

    .line 234
    .line 235
    aput-byte p1, v2, p0

    .line 236
    .line 237
    const/16 p0, 0xf

    .line 238
    .line 239
    const/16 p1, -0x25

    .line 240
    .line 241
    aput-byte p1, v2, p0

    .line 242
    .line 243
    const/16 p0, -0x45

    .line 244
    .line 245
    aput-byte p0, v2, v5

    .line 246
    .line 247
    const/16 p0, 0x55

    .line 248
    .line 249
    aput-byte p0, v2, v6

    .line 250
    .line 251
    const/16 p0, 0x12

    .line 252
    .line 253
    const/16 p1, -0x5c

    .line 254
    .line 255
    aput-byte p1, v2, p0

    .line 256
    .line 257
    const/16 p0, 0x13

    .line 258
    .line 259
    const/4 p1, -0x2

    .line 260
    aput-byte p1, v2, p0

    .line 261
    .line 262
    const/16 p0, 0x14

    .line 263
    .line 264
    const/16 p1, 0x7f

    .line 265
    .line 266
    aput-byte p1, v2, p0

    .line 267
    .line 268
    const/16 p0, 0x15

    .line 269
    .line 270
    const/16 p1, -0x3e

    .line 271
    .line 272
    aput-byte p1, v2, p0

    .line 273
    .line 274
    const/16 p0, 0x16

    .line 275
    .line 276
    const/4 p1, -0x4

    .line 277
    aput-byte p1, v2, p0

    .line 278
    .line 279
    const/16 p0, 0x4e

    .line 280
    .line 281
    aput-byte p0, v2, v7

    .line 282
    .line 283
    goto :goto_3

    .line 284
    :cond_6
    and-int/lit16 p2, v0, 0xff

    .line 285
    .line 286
    int-to-byte p2, p2

    .line 287
    const/16 v5, 0x18

    .line 288
    .line 289
    aput-byte p2, v2, v5

    .line 290
    .line 291
    shr-int/lit8 p2, v0, 0x8

    .line 292
    .line 293
    and-int/lit16 p2, p2, 0xff

    .line 294
    .line 295
    int-to-byte p2, p2

    .line 296
    aput-byte p2, v2, v7

    .line 297
    .line 298
    add-int/2addr v0, v6

    .line 299
    int-to-short p2, v0

    .line 300
    and-int/lit16 p2, p2, 0xff

    .line 301
    .line 302
    int-to-byte p2, p2

    .line 303
    aput-byte p2, v2, p1

    .line 304
    .line 305
    const/16 p1, -0x1b

    .line 306
    .line 307
    aput-byte p1, v2, p0

    .line 308
    .line 309
    :goto_3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    new-instance p1, Ljava/lang/StringBuilder;

    .line 314
    .line 315
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    array-length p2, v2

    .line 319
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    const-string p2, "sei:"

    .line 323
    .line 324
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    invoke-virtual {p0, v4, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    return-object v2

    .line 338
    :cond_7
    and-int/lit16 p1, v0, 0xff

    .line 339
    .line 340
    int-to-byte p1, p1

    .line 341
    aput-byte p1, v2, v6

    .line 342
    .line 343
    shr-int/lit8 p1, v0, 0x8

    .line 344
    .line 345
    and-int/lit16 p1, p1, 0xff

    .line 346
    .line 347
    int-to-byte p1, p1

    .line 348
    aput-byte p1, v2, v5

    .line 349
    .line 350
    iget-object p0, p0, Ll/grx;->j1:Lcom/momo/x264/x264sdk;

    .line 351
    .line 352
    invoke-virtual {p0, v2, v0}, Lcom/momo/x264/x264sdk;->GenSEI([BI)[B

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    new-instance p1, Ljava/lang/String;

    .line 357
    .line 358
    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    .line 359
    .line 360
    .line 361
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 362
    .line 363
    .line 364
    move-result-object p2

    .line 365
    new-instance v0, Ljava/lang/StringBuilder;

    .line 366
    .line 367
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    array-length v1, p0

    .line 371
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    const-string v1, "; sei:"

    .line 375
    .line 376
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p1

    .line 386
    invoke-virtual {p2, v4, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    return-object p0
.end method

.method public abstract E2()Ll/g220;
.end method

.method public abstract G2()Ll/nsx;
.end method

.method public H0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public I2(Ljava/nio/ByteBuffer;I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 3
    .line 4
    .line 5
    new-array p2, p2, [B

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x4

    .line 14
    aget-byte p1, p2, p1

    .line 15
    .line 16
    and-int/lit8 p2, p1, 0x1f

    .line 17
    .line 18
    and-int/lit8 p1, p1, 0x7e

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    shr-int/2addr p1, v1

    .line 22
    iget-object v2, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    const/16 v2, 0x10

    .line 27
    .line 28
    if-lt p1, v2, :cond_0

    .line 29
    .line 30
    const/16 v2, 0x15

    .line 31
    .line 32
    if-gt p1, v2, :cond_0

    .line 33
    .line 34
    return v1

    .line 35
    :cond_0
    iget-object p0, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x5

    .line 40
    if-ne p2, p0, :cond_1

    .line 41
    .line 42
    return v1

    .line 43
    :cond_1
    return v0
.end method

.method public J(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "momopusher setSei"

    .line 4
    .line 5
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/grx;->e1:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public J2(Ljava/nio/ByteBuffer;I)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 3
    .line 4
    .line 5
    new-array p2, p2, [B

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x4

    .line 14
    aget-byte p1, p2, p1

    .line 15
    .line 16
    and-int/lit8 p2, p1, 0x60

    .line 17
    .line 18
    and-int/lit8 p1, p1, 0x1f

    .line 19
    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    const/4 p2, 0x6

    .line 23
    if-ne p1, p2, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "MediaCodecFilter"

    .line 30
    .line 31
    const-string v0, "sei found !"

    .line 32
    .line 33
    invoke-virtual {p1, p2, v0}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p2, 0x7

    .line 38
    if-ne p1, p2, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    :cond_1
    return p0
.end method

.method public K1(Ll/oxd0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, v0, Ll/tow;->c0:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Ll/grx;->X0:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/grx;->L2(Ll/oxd0;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Ll/grx;->S:Ll/nsx;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/nsx;->a(Ll/oxd0;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public K2(Landroid/media/MediaFormat;I)I
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-lt p2, v1, :cond_4

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    if-le p2, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p2, "mime"

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v4, "audio"

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const-string v4, "csd-0"

    .line 24
    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/grx;->U0:Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v3, "video/avc"

    .line 39
    .line 40
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p0, Ll/grx;->Q0:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    const-string p2, "csd-1"

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ll/grx;->P0:Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    return v2

    .line 61
    :cond_2
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    const-string v1, "video/hevc"

    .line 66
    .line 67
    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Ll/grx;->R0:Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    return v2

    .line 80
    :cond_3
    return v0

    .line 81
    :cond_4
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v1, "Add media track error ! Invalid parameter ! format="

    .line 84
    .line 85
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p1, " and track="

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string p1, "ContentValues"

    .line 104
    .line 105
    invoke-static {p1, p0}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    return v0
.end method

.method public O2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/grx;->Z:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    iput p1, p0, Ll/grx;->k0:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Ll/grx;->k0:I

    .line 11
    .line 12
    return-void
.end method

.method public P2(I)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput p1, v0, Ll/tow;->H:I

    .line 6
    .line 7
    :cond_0
    iget-object p0, p0, Ll/grx;->S:Ll/nsx;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/nsx;->e(I)Z

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public Q2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grx;->V:Ll/g220;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/g220;->O1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 30
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "startRecord softcodec usemediacodec audioSampleRate:"

    .line 6
    .line 7
    const-string v3, "[pub="

    .line 8
    .line 9
    const-string v4, "isPrepared:"

    .line 10
    .line 11
    invoke-super/range {p0 .. p2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 12
    .line 13
    .line 14
    iget-object v5, v1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 15
    .line 16
    sget-object v6, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 17
    .line 18
    if-ne v5, v6, :cond_0

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    iput-boolean v5, v0, Ll/grx;->Y0:Z

    .line 22
    .line 23
    :cond_0
    iput-object v1, v0, Ll/grx;->i1:Ll/uow;

    .line 24
    .line 25
    iget-object v5, v0, Ll/grx;->G0:Ljava/lang/Object;

    .line 26
    .line 27
    monitor-enter v5

    .line 28
    :try_start_0
    iget-boolean v6, v0, Ll/grx;->F0:Z

    .line 29
    .line 30
    if-eqz v6, :cond_1

    .line 31
    .line 32
    iget-object v6, v0, Ll/grx;->i1:Ll/uow;

    .line 33
    .line 34
    iget-boolean v6, v6, Ll/uow;->X0:Z

    .line 35
    .line 36
    if-nez v6, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 43
    .line 44
    const-string v2, "startRecord error return 441"

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    monitor-exit v5

    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    goto/16 :goto_6

    .line 53
    .line 54
    :cond_1
    iget-boolean v6, v0, Ll/grx;->H0:Z

    .line 55
    .line 56
    const/4 v7, 0x0

    .line 57
    if-eqz v6, :cond_3

    .line 58
    .line 59
    iget-object v6, v0, Ll/grx;->V:Ll/g220;

    .line 60
    .line 61
    if-eqz v6, :cond_3

    .line 62
    .line 63
    iget-boolean v8, v0, Ll/grx;->Y0:Z

    .line 64
    .line 65
    if-nez v8, :cond_3

    .line 66
    .line 67
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 68
    .line 69
    invoke-virtual {v1, v6}, Ll/nsx;->g(Ll/g220;)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 76
    .line 77
    int-to-long v8, v1

    .line 78
    iput-wide v8, v2, Ll/wvx;->y0:J

    .line 79
    .line 80
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/nsx;->h()V

    .line 83
    .line 84
    .line 85
    iput-object v7, v0, Ll/grx;->V:Ll/g220;

    .line 86
    .line 87
    iput-object v7, v0, Ll/grx;->S:Ll/nsx;

    .line 88
    .line 89
    :cond_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 94
    .line 95
    new-instance v3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-boolean v4, v0, Ll/grx;->H0:Z

    .line 101
    .line 102
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v4, " mMuxerWrapper:"

    .line 106
    .line 107
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget-object v4, v0, Ll/grx;->V:Ll/g220;

    .line 111
    .line 112
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ll/grx;->Q2()V

    .line 123
    .line 124
    .line 125
    monitor-exit v5

    .line 126
    return-void

    .line 127
    :cond_3
    iget-object v4, v0, Ll/grx;->i1:Ll/uow;

    .line 128
    .line 129
    iget v10, v4, Ll/tow;->m:I

    .line 130
    .line 131
    iget v11, v4, Ll/tow;->n:I

    .line 132
    .line 133
    iget v12, v1, Ll/uow;->E0:I

    .line 134
    .line 135
    iget v13, v1, Ll/tow;->H:I

    .line 136
    .line 137
    iget v4, v1, Ll/tow;->P:I

    .line 138
    .line 139
    iget v6, v1, Ll/tow;->R:I

    .line 140
    .line 141
    iget v8, v1, Ll/tow;->S:I

    .line 142
    .line 143
    mul-int/lit16 v9, v6, 0x400

    .line 144
    .line 145
    sput v9, Ll/grx;->k1:I

    .line 146
    .line 147
    iget-object v9, v0, Ll/grx;->V:Ll/g220;

    .line 148
    .line 149
    if-nez v9, :cond_4

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/grx;->E2()Ll/g220;

    .line 152
    .line 153
    .line 154
    move-result-object v9

    .line 155
    iput-object v9, v0, Ll/grx;->V:Ll/g220;

    .line 156
    .line 157
    :cond_4
    iget-boolean v9, v0, Ll/grx;->Y0:Z

    .line 158
    .line 159
    const/16 v16, 0x10

    .line 160
    .line 161
    if-nez v9, :cond_b

    .line 162
    .line 163
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    const-string v9, "Pipeline_Normal_pip->PIPLINE"

    .line 168
    .line 169
    const-string v14, "startRecord hardcodec"

    .line 170
    .line 171
    invoke-virtual {v2, v9, v14}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object v2, v0, Ll/grx;->S:Ll/nsx;

    .line 175
    .line 176
    if-nez v2, :cond_a

    .line 177
    .line 178
    move/from16 v18, v8

    .line 179
    .line 180
    invoke-virtual {v0}, Ll/grx;->G2()Ll/nsx;

    .line 181
    .line 182
    .line 183
    move-result-object v8

    .line 184
    iput-object v8, v0, Ll/grx;->S:Ll/nsx;

    .line 185
    .line 186
    if-nez v8, :cond_5

    .line 187
    .line 188
    monitor-exit v5

    .line 189
    return-void

    .line 190
    :cond_5
    iget-boolean v2, v0, Ll/grx;->Z:Z

    .line 191
    .line 192
    const/4 v14, 0x1

    .line 193
    if-nez v2, :cond_9

    .line 194
    .line 195
    iget-object v2, v0, Ll/grx;->i1:Ll/uow;

    .line 196
    .line 197
    iget-boolean v2, v2, Ll/tow;->a0:Z

    .line 198
    .line 199
    if-nez v2, :cond_7

    .line 200
    .line 201
    iget-boolean v1, v1, Ll/uow;->H0:Z

    .line 202
    .line 203
    if-eqz v1, :cond_6

    .line 204
    .line 205
    const-string v1, "video/hevc"

    .line 206
    .line 207
    :goto_0
    move-object v9, v1

    .line 208
    goto :goto_1

    .line 209
    :cond_6
    const-string v1, "video/avc"

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :goto_1
    sget v15, Ll/nsx;->k:I

    .line 213
    .line 214
    invoke-virtual/range {v8 .. v15}, Ll/nsx;->f(Ljava/lang/String;IIIIII)V

    .line 215
    .line 216
    .line 217
    move v1, v14

    .line 218
    goto :goto_2

    .line 219
    :cond_7
    move v1, v14

    .line 220
    iget-object v2, v0, Ll/grx;->K0:Ll/grx$d;

    .line 221
    .line 222
    if-nez v2, :cond_8

    .line 223
    .line 224
    new-instance v2, Ll/grx$d;

    .line 225
    .line 226
    const-string v8, "live-media-FSCodec"

    .line 227
    .line 228
    invoke-direct {v2, v0, v8}, Ll/grx$d;-><init>(Ll/grx;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iput-object v2, v0, Ll/grx;->K0:Ll/grx$d;

    .line 232
    .line 233
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 234
    .line 235
    .line 236
    :cond_8
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    const-string v8, "Pipeline_Normal_pip->PIPLINE"

    .line 241
    .line 242
    const-string v9, "startRecord hardcodec FakeSoftCodec"

    .line 243
    .line 244
    invoke-virtual {v2, v8, v9}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    goto :goto_2

    .line 248
    :cond_9
    move v1, v14

    .line 249
    :goto_2
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 250
    .line 251
    iget-wide v8, v2, Ll/wvx;->d:J

    .line 252
    .line 253
    long-to-int v2, v8

    .line 254
    invoke-direct {v0, v2}, Ll/grx;->F2(I)I

    .line 255
    .line 256
    .line 257
    move-result v20

    .line 258
    iget-object v14, v0, Ll/grx;->S:Ll/nsx;

    .line 259
    .line 260
    sget v19, Ll/grx;->k1:I

    .line 261
    .line 262
    move v15, v4

    .line 263
    move/from16 v17, v6

    .line 264
    .line 265
    invoke-virtual/range {v14 .. v20}, Ll/nsx;->d(IIIIII)V

    .line 266
    .line 267
    .line 268
    move/from16 v2, v20

    .line 269
    .line 270
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 271
    .line 272
    const-string v19, "startRecord.base"

    .line 273
    .line 274
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 275
    .line 276
    .line 277
    move-result-object v20

    .line 278
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 279
    .line 280
    .line 281
    move-result-object v21

    .line 282
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 283
    .line 284
    .line 285
    move-result-object v22

    .line 286
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 287
    .line 288
    .line 289
    move-result-object v23

    .line 290
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 291
    .line 292
    .line 293
    move-result-object v24

    .line 294
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 295
    .line 296
    .line 297
    move-result-object v25

    .line 298
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 299
    .line 300
    .line 301
    move-result-object v26

    .line 302
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 303
    .line 304
    .line 305
    move-result-object v27

    .line 306
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 307
    .line 308
    .line 309
    move-result-object v28

    .line 310
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 311
    .line 312
    .line 313
    move-result-object v29

    .line 314
    filled-new-array/range {v19 .. v29}, [Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-virtual {v4, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 322
    .line 323
    const-string v4, "audioProfile"

    .line 324
    .line 325
    new-instance v6, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 331
    .line 332
    iget-wide v8, v3, Ll/wvx;->d:J

    .line 333
    .line 334
    long-to-int v3, v8

    .line 335
    invoke-direct {v0, v3}, Ll/grx;->H2(I)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    const-string v3, ",profile="

    .line 343
    .line 344
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    const-string v2, "]"

    .line 351
    .line 352
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v2

    .line 359
    invoke-virtual {v1, v4, v2}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 363
    .line 364
    iget-object v2, v0, Ll/grx;->V:Ll/g220;

    .line 365
    .line 366
    invoke-virtual {v1, v2}, Ll/nsx;->g(Ll/g220;)I

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    if-eqz v1, :cond_a

    .line 371
    .line 372
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 373
    .line 374
    int-to-long v3, v1

    .line 375
    iput-wide v3, v2, Ll/wvx;->y0:J

    .line 376
    .line 377
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 378
    .line 379
    invoke-virtual {v1}, Ll/nsx;->h()V

    .line 380
    .line 381
    .line 382
    iput-object v7, v0, Ll/grx;->V:Ll/g220;

    .line 383
    .line 384
    iput-object v7, v0, Ll/grx;->S:Ll/nsx;

    .line 385
    .line 386
    monitor-exit v5

    .line 387
    return-void

    .line 388
    :cond_a
    invoke-virtual {v0}, Ll/grx;->Q2()V

    .line 389
    .line 390
    .line 391
    goto/16 :goto_5

    .line 392
    .line 393
    :cond_b
    move v15, v4

    .line 394
    move/from16 v17, v6

    .line 395
    .line 396
    move/from16 v18, v8

    .line 397
    .line 398
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 399
    .line 400
    .line 401
    move-result-object v3

    .line 402
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 403
    .line 404
    const-string v6, "startRecord softcodec"

    .line 405
    .line 406
    invoke-virtual {v3, v4, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    new-instance v3, Ljava/lang/Object;

    .line 410
    .line 411
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 412
    .line 413
    .line 414
    iput-object v3, v0, Ll/grx;->W:Ljava/lang/Object;

    .line 415
    .line 416
    new-instance v3, Ljava/lang/Object;

    .line 417
    .line 418
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 419
    .line 420
    .line 421
    iput-object v3, v0, Ll/grx;->Y:Ljava/lang/Object;

    .line 422
    .line 423
    iget-object v3, v0, Ll/grx;->i1:Ll/uow;

    .line 424
    .line 425
    iget-boolean v3, v3, Ll/tow;->a0:Z

    .line 426
    .line 427
    if-nez v3, :cond_d

    .line 428
    .line 429
    iget-object v3, v0, Ll/grx;->J0:Ll/grx$c;

    .line 430
    .line 431
    if-nez v3, :cond_c

    .line 432
    .line 433
    new-instance v3, Ll/grx$c;

    .line 434
    .line 435
    const-string v4, "live-media-x264codec"

    .line 436
    .line 437
    invoke-direct {v3, v0, v4}, Ll/grx$c;-><init>(Ll/grx;Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    iput-object v3, v0, Ll/grx;->J0:Ll/grx$c;

    .line 441
    .line 442
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 443
    .line 444
    .line 445
    :cond_c
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 446
    .line 447
    .line 448
    move-result-object v3

    .line 449
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 450
    .line 451
    const-string v6, "startRecord softcodec usesoftvideocodec"

    .line 452
    .line 453
    invoke-virtual {v3, v4, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    goto :goto_3

    .line 457
    :cond_d
    iget-object v3, v0, Ll/grx;->K0:Ll/grx$d;

    .line 458
    .line 459
    if-nez v3, :cond_e

    .line 460
    .line 461
    new-instance v3, Ll/grx$d;

    .line 462
    .line 463
    const-string v4, "live-media-FSCodec"

    .line 464
    .line 465
    invoke-direct {v3, v0, v4}, Ll/grx$d;-><init>(Ll/grx;Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    iput-object v3, v0, Ll/grx;->K0:Ll/grx$d;

    .line 469
    .line 470
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 471
    .line 472
    .line 473
    :cond_e
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 474
    .line 475
    .line 476
    move-result-object v3

    .line 477
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 478
    .line 479
    const-string v6, "startRecord softcodec usefakevideocodec"

    .line 480
    .line 481
    invoke-virtual {v3, v4, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    :goto_3
    iget-boolean v1, v1, Ll/tow;->c0:Z

    .line 485
    .line 486
    if-nez v1, :cond_11

    .line 487
    .line 488
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 489
    .line 490
    if-nez v1, :cond_10

    .line 491
    .line 492
    invoke-virtual {v0}, Ll/grx;->G2()Ll/nsx;

    .line 493
    .line 494
    .line 495
    move-result-object v14

    .line 496
    iput-object v14, v0, Ll/grx;->S:Ll/nsx;

    .line 497
    .line 498
    if-nez v14, :cond_f

    .line 499
    .line 500
    monitor-exit v5

    .line 501
    return-void

    .line 502
    :cond_f
    sget v19, Ll/grx;->k1:I

    .line 503
    .line 504
    const/16 v20, 0x0

    .line 505
    .line 506
    invoke-virtual/range {v14 .. v20}, Ll/nsx;->d(IIIIII)V

    .line 507
    .line 508
    .line 509
    move/from16 v1, v17

    .line 510
    .line 511
    move/from16 v3, v18

    .line 512
    .line 513
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 514
    .line 515
    .line 516
    move-result-object v4

    .line 517
    const-string v6, "Pipeline_Normal_pip->PIPLINE"

    .line 518
    .line 519
    new-instance v8, Ljava/lang/StringBuilder;

    .line 520
    .line 521
    invoke-direct {v8, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 522
    .line 523
    .line 524
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    const-string v2, ";audioChannels:"

    .line 528
    .line 529
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    const-string v1, ";audioBitrate:"

    .line 536
    .line 537
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    .line 539
    .line 540
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 541
    .line 542
    .line 543
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    invoke-virtual {v4, v6, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 548
    .line 549
    .line 550
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 551
    .line 552
    iget-object v2, v0, Ll/grx;->V:Ll/g220;

    .line 553
    .line 554
    invoke-virtual {v1, v2}, Ll/nsx;->g(Ll/g220;)I

    .line 555
    .line 556
    .line 557
    move-result v1

    .line 558
    if-eqz v1, :cond_10

    .line 559
    .line 560
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 561
    .line 562
    int-to-long v3, v1

    .line 563
    iput-wide v3, v2, Ll/wvx;->y0:J

    .line 564
    .line 565
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 566
    .line 567
    invoke-virtual {v1}, Ll/nsx;->h()V

    .line 568
    .line 569
    .line 570
    iput-object v7, v0, Ll/grx;->V:Ll/g220;

    .line 571
    .line 572
    iput-object v7, v0, Ll/grx;->S:Ll/nsx;

    .line 573
    .line 574
    monitor-exit v5

    .line 575
    return-void

    .line 576
    :cond_10
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 577
    .line 578
    .line 579
    move-result-object v1

    .line 580
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 581
    .line 582
    const-string v3, "startRecord softcodec usemediacodec for aac"

    .line 583
    .line 584
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 585
    .line 586
    .line 587
    goto :goto_4

    .line 588
    :cond_11
    iget-object v1, v0, Ll/grx;->L0:Ll/grx$b;

    .line 589
    .line 590
    if-nez v1, :cond_12

    .line 591
    .line 592
    new-instance v1, Ll/grx$b;

    .line 593
    .line 594
    const-string v2, "live-media-SACodec"

    .line 595
    .line 596
    invoke-direct {v1, v0, v2}, Ll/grx$b;-><init>(Ll/grx;Ljava/lang/String;)V

    .line 597
    .line 598
    .line 599
    iput-object v1, v0, Ll/grx;->L0:Ll/grx$b;

    .line 600
    .line 601
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 602
    .line 603
    .line 604
    :cond_12
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 605
    .line 606
    .line 607
    move-result-object v1

    .line 608
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 609
    .line 610
    const-string v3, "startRecord softcodec usevoaac for aac"

    .line 611
    .line 612
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 613
    .line 614
    .line 615
    :goto_4
    invoke-virtual {v0}, Ll/grx;->Q2()V

    .line 616
    .line 617
    .line 618
    :goto_5
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c1()I

    .line 619
    .line 620
    .line 621
    move-result v1

    .line 622
    const/4 v2, 0x2

    .line 623
    if-ne v1, v2, :cond_13

    .line 624
    .line 625
    iget-object v1, v0, Ll/grx;->i1:Ll/uow;

    .line 626
    .line 627
    iget-boolean v1, v1, Ll/tow;->q:Z

    .line 628
    .line 629
    if-eqz v1, :cond_13

    .line 630
    .line 631
    iget-object v1, v0, Ll/grx;->I0:Ll/grx$a;

    .line 632
    .line 633
    if-nez v1, :cond_13

    .line 634
    .line 635
    new-instance v1, Ll/grx$a;

    .line 636
    .line 637
    const-string v2, "live-media-EX264Codec"

    .line 638
    .line 639
    invoke-direct {v1, v0, v2}, Ll/grx$a;-><init>(Ll/grx;Ljava/lang/String;)V

    .line 640
    .line 641
    .line 642
    iput-object v1, v0, Ll/grx;->I0:Ll/grx$a;

    .line 643
    .line 644
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 645
    .line 646
    .line 647
    :cond_13
    monitor-exit v5

    .line 648
    return-void

    .line 649
    :goto_6
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 650
    throw v0
.end method

.method public R2()Ljava/nio/ByteBuffer;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/grx;->W:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/grx;->M0:Ljava/util/LinkedList;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-boolean v3, p0, Ll/grx;->Y0:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    if-eqz v3, :cond_1

    .line 12
    .line 13
    :try_start_1
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollLast()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    iget-object v3, p0, Ll/grx;->M0:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_2

    .line 46
    :cond_0
    iget-object p0, p0, Ll/grx;->M0:Ljava/util/LinkedList;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    .line 51
    move-object v2, v1

    .line 52
    goto :goto_1

    .line 53
    :catch_0
    :try_start_2
    monitor-exit v0

    .line 54
    return-object v2

    .line 55
    :cond_1
    :goto_1
    monitor-exit v0

    .line 56
    return-object v2

    .line 57
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    throw p0
.end method

.method public S2()Ll/oxd0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/grx;->Y:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/grx;->O0:Ljava/util/LinkedList;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean v3, p0, Ll/grx;->Y0:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    :try_start_1
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollLast()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/oxd0;

    .line 18
    .line 19
    iget-object p0, p0, Ll/grx;->O0:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    .line 24
    move-object v2, v1

    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :catch_0
    :try_start_2
    monitor-exit v0

    .line 29
    return-object v2

    .line 30
    :cond_0
    :goto_0
    monitor-exit v0

    .line 31
    return-object v2

    .line 32
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    throw p0
.end method

.method public T2()Ljava/nio/ByteBuffer;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/grx;->X:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/grx;->N0:Ljava/util/LinkedList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    :try_start_1
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollLast()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    iget-object v3, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 34
    .line 35
    .line 36
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_2

    .line 42
    :cond_0
    iget-object p0, p0, Ll/grx;->N0:Ljava/util/LinkedList;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    .line 47
    move-object v2, v1

    .line 48
    goto :goto_1

    .line 49
    :catch_0
    :try_start_2
    monitor-exit v0

    .line 50
    return-object v2

    .line 51
    :cond_1
    :goto_1
    monitor-exit v0

    .line 52
    return-object v2

    .line 53
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    throw p0
.end method

.method public Y(Ll/g510;Ll/uow;)V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-super/range {p0 .. p2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y(Ll/g510;Ll/uow;)V

    .line 6
    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v2, v0, Ll/grx;->G0:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v2

    .line 14
    :try_start_0
    iget-object v3, v0, Ll/grx;->S:Ll/nsx;

    .line 15
    .line 16
    if-eqz v3, :cond_7

    .line 17
    .line 18
    iput-object v1, v0, Ll/grx;->i1:Ll/uow;

    .line 19
    .line 20
    invoke-virtual {v3}, Ll/nsx;->h()V

    .line 21
    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    iput-object v3, v0, Ll/grx;->S:Ll/nsx;

    .line 25
    .line 26
    iget-object v4, v0, Ll/grx;->i1:Ll/uow;

    .line 27
    .line 28
    iget v5, v4, Ll/tow;->m:I

    .line 29
    .line 30
    iget v6, v4, Ll/tow;->n:I

    .line 31
    .line 32
    iget-boolean v1, v1, Ll/uow;->F0:Z

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    move v10, v5

    .line 37
    move v9, v6

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v9, v5

    .line 40
    move v10, v6

    .line 41
    :goto_0
    iget v11, v4, Ll/uow;->E0:I

    .line 42
    .line 43
    iget v12, v4, Ll/tow;->H:I

    .line 44
    .line 45
    iget v1, v4, Ll/tow;->P:I

    .line 46
    .line 47
    iget v5, v4, Ll/tow;->R:I

    .line 48
    .line 49
    iget v4, v4, Ll/tow;->S:I

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/grx;->G2()Ll/nsx;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    iput-object v7, v0, Ll/grx;->S:Ll/nsx;

    .line 56
    .line 57
    if-nez v7, :cond_2

    .line 58
    .line 59
    monitor-exit v2

    .line 60
    return-void

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    goto/16 :goto_4

    .line 63
    .line 64
    :cond_2
    iget-boolean v6, v0, Ll/grx;->Z:Z

    .line 65
    .line 66
    const/4 v13, 0x1

    .line 67
    if-nez v6, :cond_4

    .line 68
    .line 69
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 70
    .line 71
    iget-boolean v6, v6, Ll/uow;->H0:Z

    .line 72
    .line 73
    if-eqz v6, :cond_3

    .line 74
    .line 75
    const-string v6, "video/hevc"

    .line 76
    .line 77
    :goto_1
    move-object v8, v6

    .line 78
    goto :goto_2

    .line 79
    :cond_3
    const-string v6, "video/avc"

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :goto_2
    sget v14, Ll/nsx;->k:I

    .line 83
    .line 84
    invoke-virtual/range {v7 .. v14}, Ll/nsx;->f(Ljava/lang/String;IIIIII)V

    .line 85
    .line 86
    .line 87
    move v6, v13

    .line 88
    goto :goto_3

    .line 89
    :cond_4
    move v6, v13

    .line 90
    :goto_3
    iget-object v7, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 91
    .line 92
    iget-wide v7, v7, Ll/wvx;->d:J

    .line 93
    .line 94
    long-to-int v7, v7

    .line 95
    invoke-direct {v0, v7}, Ll/grx;->F2(I)I

    .line 96
    .line 97
    .line 98
    move-result v19

    .line 99
    iget-object v13, v0, Ll/grx;->S:Ll/nsx;

    .line 100
    .line 101
    mul-int/lit16 v7, v5, 0x400

    .line 102
    .line 103
    const/16 v15, 0x10

    .line 104
    .line 105
    move v14, v1

    .line 106
    move/from16 v17, v4

    .line 107
    .line 108
    move/from16 v16, v5

    .line 109
    .line 110
    move/from16 v18, v7

    .line 111
    .line 112
    invoke-virtual/range {v13 .. v19}, Ll/nsx;->d(IIIIII)V

    .line 113
    .line 114
    .line 115
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 116
    .line 117
    const-string v20, "resetCodec.base"

    .line 118
    .line 119
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v21

    .line 123
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v22

    .line 127
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object v23

    .line 131
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v24

    .line 135
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v25

    .line 139
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object v26

    .line 143
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v27

    .line 147
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 148
    .line 149
    .line 150
    move-result-object v28

    .line 151
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v29

    .line 155
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object v30

    .line 159
    filled-new-array/range {v20 .. v30}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v1, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 167
    .line 168
    iget-object v4, v0, Ll/grx;->V:Ll/g220;

    .line 169
    .line 170
    invoke-virtual {v1, v4}, Ll/nsx;->g(Ll/g220;)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-eqz v1, :cond_5

    .line 175
    .line 176
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 177
    .line 178
    int-to-long v5, v1

    .line 179
    iput-wide v5, v4, Ll/wvx;->y0:J

    .line 180
    .line 181
    iget-object v1, v0, Ll/grx;->S:Ll/nsx;

    .line 182
    .line 183
    invoke-virtual {v1}, Ll/nsx;->h()V

    .line 184
    .line 185
    .line 186
    iput-object v3, v0, Ll/grx;->V:Ll/g220;

    .line 187
    .line 188
    iput-object v3, v0, Ll/grx;->S:Ll/nsx;

    .line 189
    .line 190
    :cond_5
    iget-object v1, v0, Ll/grx;->V:Ll/g220;

    .line 191
    .line 192
    if-eqz v1, :cond_6

    .line 193
    .line 194
    invoke-interface {v1}, Ll/g220;->O1()V

    .line 195
    .line 196
    .line 197
    :cond_6
    const/4 v1, 0x1

    .line 198
    iput-boolean v1, v0, Ll/grx;->E0:Z

    .line 199
    .line 200
    :cond_7
    monitor-exit v2

    .line 201
    return-void

    .line 202
    :goto_4
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    throw v0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/zej;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e0()Landroid/view/Surface;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/grx;->S:Ll/nsx;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Ll/grx;->E0:Z

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/nsx;->b()Landroid/view/Surface;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/grx;->G0:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    const/4 v1, 0x1

    .line 8
    :try_start_0
    iput-boolean v1, p0, Ll/grx;->F0:Z

    .line 9
    .line 10
    invoke-direct {p0}, Ll/grx;->release()V

    .line 11
    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public m1(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/grx;->i1:Ll/uow;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/tow;->q:Z

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/grx;->N2(Ljava/nio/ByteBuffer;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v0(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/grx;->X0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/grx;->i1:Ll/uow;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, v0, Ll/tow;->a0:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ll/grx;->M2(Ljava/nio/ByteBuffer;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public y(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public y0(III)V
    .locals 0

    .line 1
    return-void
.end method
