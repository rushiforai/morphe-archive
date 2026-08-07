.class public Ll/dc1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dc1$b;
    }
.end annotation


# instance fields
.field private final a:I

.field private final b:I

.field private c:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private f:I

.field private g:Ll/dc1$b;

.field private h:Ljava/lang/Thread;

.field private i:F

.field private j:F

.field private k:F

.field private l:F

.field private volatile m:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/dc1;->a:I

    .line 6
    .line 7
    const/16 v0, -0x3039

    .line 8
    .line 9
    iput v0, p0, Ll/dc1;->b:I

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/dc1;->c:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/dc1;->d:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/dc1;->e:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput v0, p0, Ll/dc1;->f:I

    .line 34
    .line 35
    new-instance v1, Ll/dc1$b;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-direct {v1, p0, v2}, Ll/dc1$b;-><init>(Ll/dc1;Ll/dc1$a;)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/dc1;->g:Ll/dc1$b;

    .line 42
    .line 43
    new-instance v1, Ljava/lang/Thread;

    .line 44
    .line 45
    iget-object v2, p0, Ll/dc1;->g:Ll/dc1$b;

    .line 46
    .line 47
    const-string v3, "live-media-APro"

    .line 48
    .line 49
    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Ll/dc1;->h:Ljava/lang/Thread;

    .line 53
    .line 54
    const/high16 v1, 0x3f000000    # 0.5f

    .line 55
    .line 56
    iput v1, p0, Ll/dc1;->i:F

    .line 57
    .line 58
    iput v1, p0, Ll/dc1;->j:F

    .line 59
    .line 60
    const/high16 v1, 0x3f800000    # 1.0f

    .line 61
    .line 62
    iput v1, p0, Ll/dc1;->k:F

    .line 63
    .line 64
    const v1, 0x3f333333    # 0.7f

    .line 65
    .line 66
    .line 67
    iput v1, p0, Ll/dc1;->l:F

    .line 68
    .line 69
    iput-boolean v0, p0, Ll/dc1;->m:Z

    .line 70
    .line 71
    return-void
.end method

.method public static synthetic a(Ll/dc1;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dc1;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/dc1;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/dc1;->m:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dc1;->c:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dc1;->d:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dc1;->e:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 1
    const-string v0, "clearSurroundFrames begin"

    .line 2
    .line 3
    const-string v1, "AudioQProcessThread"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dc1;->h:Ljava/lang/Thread;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/dc1;->g:Ll/dc1$b;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dc1$b;->a()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const-string p0, "clearSurroundFrames end"

    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public g()Ll/oxd0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/dc1;->d:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/dc1;->d:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/oxd0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-object v0

    .line 22
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public h([B[BI)Ljava/nio/ByteBuffer;
    .locals 9

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    if-eqz p3, :cond_3

    .line 6
    .line 7
    array-length v0, p1

    .line 8
    if-ge v0, p3, :cond_0

    .line 9
    .line 10
    goto :goto_3

    .line 11
    :cond_0
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    :goto_0
    div-int/lit8 v3, p3, 0x2

    .line 21
    .line 22
    if-ge v2, v3, :cond_2

    .line 23
    .line 24
    mul-int/lit8 v3, v2, 0x2

    .line 25
    .line 26
    add-int/lit8 v4, v3, 0x1

    .line 27
    .line 28
    aget-byte v5, p1, v4

    .line 29
    .line 30
    int-to-short v5, v5

    .line 31
    aget-byte v6, p1, v3

    .line 32
    .line 33
    int-to-short v6, v6

    .line 34
    shl-int/lit8 v5, v5, 0x8

    .line 35
    .line 36
    const v7, 0xff00

    .line 37
    .line 38
    .line 39
    and-int/2addr v5, v7

    .line 40
    and-int/lit16 v6, v6, 0xff

    .line 41
    .line 42
    or-int/2addr v5, v6

    .line 43
    int-to-short v5, v5

    .line 44
    int-to-float v5, v5

    .line 45
    iget v6, p0, Ll/dc1;->k:F

    .line 46
    .line 47
    mul-float/2addr v5, v6

    .line 48
    iget v6, p0, Ll/dc1;->i:F

    .line 49
    .line 50
    mul-float/2addr v5, v6

    .line 51
    aget-byte v6, p2, v4

    .line 52
    .line 53
    int-to-short v6, v6

    .line 54
    aget-byte v8, p2, v3

    .line 55
    .line 56
    int-to-short v8, v8

    .line 57
    shl-int/lit8 v6, v6, 0x8

    .line 58
    .line 59
    and-int/2addr v6, v7

    .line 60
    and-int/lit16 v7, v8, 0xff

    .line 61
    .line 62
    or-int/2addr v6, v7

    .line 63
    int-to-short v6, v6

    .line 64
    int-to-float v6, v6

    .line 65
    iget v7, p0, Ll/dc1;->l:F

    .line 66
    .line 67
    mul-float/2addr v6, v7

    .line 68
    iget v7, p0, Ll/dc1;->j:F

    .line 69
    .line 70
    mul-float/2addr v6, v7

    .line 71
    const/4 v7, 0x0

    .line 72
    cmpg-float v8, v5, v7

    .line 73
    .line 74
    if-gez v8, :cond_1

    .line 75
    .line 76
    cmpg-float v7, v6, v7

    .line 77
    .line 78
    if-gez v7, :cond_1

    .line 79
    .line 80
    add-float v7, v5, v6

    .line 81
    .line 82
    mul-float/2addr v5, v6

    .line 83
    const v6, -0x39000200    # -32767.0f

    .line 84
    .line 85
    .line 86
    :goto_1
    div-float/2addr v5, v6

    .line 87
    sub-float/2addr v7, v5

    .line 88
    float-to-int v5, v7

    .line 89
    int-to-short v5, v5

    .line 90
    goto :goto_2

    .line 91
    :cond_1
    add-float v7, v5, v6

    .line 92
    .line 93
    mul-float/2addr v5, v6

    .line 94
    const v6, 0x46fffe00    # 32767.0f

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :goto_2
    shr-int/lit8 v6, v5, 0x8

    .line 99
    .line 100
    and-int/lit16 v6, v6, 0xff

    .line 101
    .line 102
    int-to-byte v6, v6

    .line 103
    aput-byte v6, p1, v4

    .line 104
    .line 105
    and-int/lit16 v4, v5, 0xff

    .line 106
    .line 107
    int-to-byte v4, v4

    .line 108
    aput-byte v4, p1, v3

    .line 109
    .line 110
    add-int/lit8 v2, v2, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    invoke-virtual {v0, p1, v1, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 117
    .line 118
    .line 119
    return-object v0

    .line 120
    :cond_3
    :goto_3
    const/4 p0, 0x0

    .line 121
    return-object p0
.end method

.method public i(Ll/oxd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dc1;->h:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/dc1;->g:Ll/dc1$b;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/dc1$b;->b(Ll/oxd0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public j(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/dc1;->i:F

    .line 2
    .line 3
    return-void
.end method

.method public k(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/dc1;->j:F

    .line 2
    .line 3
    return-void
.end method
