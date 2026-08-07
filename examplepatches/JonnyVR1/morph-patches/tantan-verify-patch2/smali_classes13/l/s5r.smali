.class public Ll/s5r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/thd$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s5r$c;,
        Ll/s5r$b;
    }
.end annotation


# static fields
.field private static A:Ljava/lang/String; = ""

.field private static B:Ljava/lang/String; = ""

.field private static C:Ll/thd; = null

.field private static D:Z = false

.field private static E:Z = false

.field private static F:Z = false

.field private static G:J = 0x0L

.field private static H:I = 0xac44

.field private static I:I = 0x2

.field private static J:I = 0x10

.field private static K:Z = false

.field private static L:I = 0x1

.field protected static y:Ll/gb1; = null

.field private static z:Ljava/lang/String; = ""


# instance fields
.field a:Ljava/io/RandomAccessFile;

.field private b:Z

.field private c:J

.field private d:I

.field private e:J

.field private f:I

.field private g:F

.field private h:I

.field private i:Ll/s5r$c;

.field private j:Ll/s5r$b;

.field private k:Lcom/immomo/mediacore/audio/AudioProcess;

.field private l:Lcom/immomo/mediacore/audio/AudioProcess;

.field private m:I

.field private n:I

.field private o:Z

.field private p:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private q:I

.field private r:Z

.field private s:[B

.field private t:I

.field private u:Ljava/nio/ByteBuffer;

.field private v:Ljava/nio/ByteBuffer;

.field private w:Z

.field private x:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILcom/immomo/mediacore/audio/AudioProcess;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Ll/s5r;->b:Z

    .line 9
    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    iput-wide v2, p0, Ll/s5r;->c:J

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    iput v4, p0, Ll/s5r;->d:I

    .line 16
    .line 17
    iput-wide v2, p0, Ll/s5r;->e:J

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    iput v2, p0, Ll/s5r;->f:I

    .line 21
    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    iput v2, p0, Ll/s5r;->g:F

    .line 25
    .line 26
    iput v4, p0, Ll/s5r;->h:I

    .line 27
    .line 28
    iput-object v0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 29
    .line 30
    iput-object v0, p0, Ll/s5r;->j:Ll/s5r$b;

    .line 31
    .line 32
    const/16 v2, 0xc8

    .line 33
    .line 34
    iput v2, p0, Ll/s5r;->m:I

    .line 35
    .line 36
    iput v4, p0, Ll/s5r;->n:I

    .line 37
    .line 38
    iput-boolean v4, p0, Ll/s5r;->o:Z

    .line 39
    .line 40
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 41
    .line 42
    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v2, p0, Ll/s5r;->p:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 46
    .line 47
    const/4 v2, 0x2

    .line 48
    iput v2, p0, Ll/s5r;->q:I

    .line 49
    .line 50
    iput-boolean v1, p0, Ll/s5r;->r:Z

    .line 51
    .line 52
    iput-object v0, p0, Ll/s5r;->s:[B

    .line 53
    .line 54
    iput v4, p0, Ll/s5r;->t:I

    .line 55
    .line 56
    iput-object v0, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    const/16 v0, 0x800

    .line 59
    .line 60
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, p0, Ll/s5r;->v:Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    iput-boolean v4, p0, Ll/s5r;->w:Z

    .line 67
    .line 68
    const/4 v1, 0x3

    .line 69
    iput v1, p0, Ll/s5r;->x:I

    .line 70
    .line 71
    sput-object p1, Ll/s5r;->z:Ljava/lang/String;

    .line 72
    .line 73
    sput p2, Ll/s5r;->H:I

    .line 74
    .line 75
    sget p1, Ll/s5r;->I:I

    .line 76
    .line 77
    mul-int/2addr p1, v0

    .line 78
    iput p1, p0, Ll/s5r;->d:I

    .line 79
    .line 80
    iput-object p4, p0, Ll/s5r;->k:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 81
    .line 82
    new-instance p1, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 83
    .line 84
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object p1, p0, Ll/s5r;->l:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 88
    .line 89
    sget p2, Ll/s5r;->H:I

    .line 90
    .line 91
    iget p4, p0, Ll/s5r;->q:I

    .line 92
    .line 93
    const/16 v0, 0x400

    .line 94
    .line 95
    invoke-virtual {p1, p2, p4, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEf(III)V

    .line 96
    .line 97
    .line 98
    iput p3, p0, Ll/s5r;->q:I

    .line 99
    .line 100
    new-instance p1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string p2, "KtvPlayer: \u8bbe\u7f6e\u97f3\u9891\u8f93\u51fa\u901a\u9053\u6570\uff1a"

    .line 103
    .line 104
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget p2, p0, Ll/s5r;->q:I

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const-string p2, "HUOHL_KtvPlayer"

    .line 117
    .line 118
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    sput-boolean v4, Ll/s5r;->K:Z

    .line 122
    .line 123
    new-instance p1, Ll/s5r$b;

    .line 124
    .line 125
    invoke-direct {p1, p0}, Ll/s5r$b;-><init>(Ll/s5r;)V

    .line 126
    .line 127
    .line 128
    iput-object p1, p0, Ll/s5r;->j:Ll/s5r$b;

    .line 129
    .line 130
    new-instance p1, Ll/s5r$c;

    .line 131
    .line 132
    invoke-direct {p1, p0}, Ll/s5r$c;-><init>(Ll/s5r;)V

    .line 133
    .line 134
    .line 135
    iput-object p1, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 136
    .line 137
    return-void
.end method

.method public static B(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/io/File;

    .line 7
    .line 8
    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static C(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    sput-object p1, Ll/s5r;->z:Ljava/lang/String;

    .line 2
    .line 3
    sput-object p0, Ll/s5r;->B:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    sput-boolean v0, Ll/s5r;->K:Z

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/s5r;->K(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, ".pcm"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {p1, v1}, Ll/s5r;->B(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget-object v2, Ll/s5r;->A:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    sget-boolean v2, Ll/s5r;->D:Z

    .line 42
    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    sget-boolean v2, Ll/s5r;->E:Z

    .line 46
    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v0, "=========== \u4f34\u594f\u6587\u4ef6\u7684PCM\u5df2\u7ecf\u5b58\u5728\uff0c\u4f34\u594f\uff1a"

    .line 52
    .line 53
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "HUOHL_KtvPlayer"

    .line 64
    .line 65
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    const-string p0, "=========== \u4f34\u594f\u6587\u4ef6\u7684PCM\u5df2\u7ecf\u5b58\u5728\uff0cPCM\u6587\u4ef6\uff1a"

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    sget-object v1, Ll/s5r;->A:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-lez v1, :cond_1

    .line 85
    .line 86
    new-instance v1, Ljava/io/File;

    .line 87
    .line 88
    sget-object v2, Ll/s5r;->A:Ljava/lang/String;

    .line 89
    .line 90
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 94
    .line 95
    .line 96
    :cond_1
    sput-boolean v0, Ll/s5r;->D:Z

    .line 97
    .line 98
    sput-boolean v0, Ll/s5r;->E:Z

    .line 99
    .line 100
    sput-boolean v0, Ll/s5r;->F:Z

    .line 101
    .line 102
    sput-object p1, Ll/s5r;->A:Ljava/lang/String;

    .line 103
    .line 104
    const-wide/16 v0, 0x0

    .line 105
    .line 106
    sput-wide v0, Ll/s5r;->G:J

    .line 107
    .line 108
    invoke-static {}, Ll/s5r;->Q()V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Ll/s5r;->D()Ll/thd;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v0, Ll/s5r$a;

    .line 116
    .line 117
    invoke-direct {v0}, Ll/s5r$a;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ll/thd;->b(Ll/thd$a;)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/s5r;->D()Ll/thd;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    sget-object v3, Ll/s5r;->A:Ljava/lang/String;

    .line 128
    .line 129
    sget v4, Ll/s5r;->H:I

    .line 130
    .line 131
    sget v5, Ll/s5r;->I:I

    .line 132
    .line 133
    sget v6, Ll/s5r;->J:I

    .line 134
    .line 135
    move-object v2, p0

    .line 136
    invoke-virtual/range {v1 .. v6}, Ll/thd;->a(Ljava/lang/String;Ljava/lang/String;III)Z

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public static D()Ll/thd;
    .locals 1

    .line 1
    sget-object v0, Ll/s5r;->C:Ll/thd;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/thd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/thd;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/s5r;->C:Ll/thd;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/s5r;->C:Ll/thd;

    .line 13
    .line 14
    return-object v0
.end method

.method public static K(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    :try_start_0
    const-string v0, "MD5"

    .line 11
    .line 12
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    array-length v0, p0

    .line 25
    const/4 v2, 0x0

    .line 26
    move-object v3, v1

    .line 27
    :goto_0
    if-ge v2, v0, :cond_2

    .line 28
    .line 29
    aget-byte v4, p0, v2

    .line 30
    .line 31
    and-int/lit16 v4, v4, 0xff

    .line 32
    .line 33
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    const/4 v6, 0x1

    .line 42
    if-ne v5, v6, :cond_1

    .line 43
    .line 44
    new-instance v5, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v6, "0"

    .line 50
    .line 51
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    goto :goto_1

    .line 62
    :catch_0
    move-exception p0

    .line 63
    goto :goto_2

    .line 64
    :cond_1
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    return-object v3

    .line 83
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 84
    .line 85
    .line 86
    return-object v1
.end method

.method public static Q()V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    sget-object v0, Ll/s5r;->C:Ll/thd;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/thd;->c()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Ll/s5r;->C:Ll/thd;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static R(II)V
    .locals 2

    .line 1
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1, p0, p1}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static Y(I)V
    .locals 0

    .line 1
    sput p0, Ll/s5r;->L:I

    .line 2
    .line 3
    return-void
.end method

.method public static Z(Ll/gb1;)V
    .locals 0

    .line 1
    sput-object p0, Ll/s5r;->y:Ll/gb1;

    .line 2
    .line 3
    return-void
.end method

.method public static a0([BI)[B
    .locals 5

    .line 1
    div-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    div-int/lit8 v2, p1, 0x4

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    mul-int/lit8 v2, v1, 0x2

    .line 11
    .line 12
    mul-int/lit8 v3, v1, 0x4

    .line 13
    .line 14
    aget-byte v4, p0, v3

    .line 15
    .line 16
    aput-byte v4, v0, v2

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    aget-byte v3, p0, v3

    .line 23
    .line 24
    aput-byte v3, v0, v2

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-object v0
.end method

.method public static synthetic e()J
    .locals 2

    .line 1
    sget-wide v0, Ll/s5r;->G:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(J)J
    .locals 0

    .line 1
    sput-wide p0, Ll/s5r;->G:J

    .line 2
    .line 3
    return-wide p0
.end method

.method public static synthetic g()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/s5r;->D:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic h(Ll/s5r;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5r;->p:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/s5r;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ll/s5r;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/s5r;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k()I
    .locals 1

    .line 1
    sget v0, Ll/s5r;->H:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic l()I
    .locals 1

    .line 1
    sget v0, Ll/s5r;->J:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic m()I
    .locals 1

    .line 1
    sget v0, Ll/s5r;->I:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic n(Ll/s5r;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/s5r;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic o(Ll/s5r;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/s5r;->w:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic p(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/s5r;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/s5r;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic r(Ll/s5r;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/s5r;->e:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic s(Ll/s5r;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/s5r;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic t()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/s5r;->K:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic u(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/s5r;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic v(Ll/s5r;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s5r;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic w(Ll/s5r;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/s5r;->c:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic x(Ll/s5r;J)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s5r;->c:J

    .line 2
    .line 3
    add-long/2addr v0, p1

    .line 4
    iput-wide v0, p0, Ll/s5r;->c:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public static synthetic y(Ll/s5r;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/s5r;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic z()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/s5r;->A:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public A([BI)Ljava/nio/ByteBuffer;
    .locals 13

    .line 1
    iget-object v0, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge v0, p2, :cond_1

    .line 10
    .line 11
    :cond_0
    mul-int/lit8 v0, p2, 0x2

    .line 12
    .line 13
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/s5r;->k:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    invoke-virtual {v0, p1, v1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    iget-boolean v0, p0, Ll/s5r;->o:Z

    .line 43
    .line 44
    const-wide/16 v2, 0x3e8

    .line 45
    .line 46
    const/4 v4, 0x1

    .line 47
    const/16 v5, 0x800

    .line 48
    .line 49
    if-eqz v0, :cond_5

    .line 50
    .line 51
    iget-boolean v0, p0, Ll/s5r;->r:Z

    .line 52
    .line 53
    if-eqz v0, :cond_5

    .line 54
    .line 55
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-static {v6, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 64
    .line 65
    .line 66
    iget v6, p0, Ll/s5r;->m:I

    .line 67
    .line 68
    int-to-long v6, v6

    .line 69
    invoke-virtual {p0, v6, v7}, Ll/s5r;->I(J)J

    .line 70
    .line 71
    .line 72
    move-result-wide v6

    .line 73
    iget v8, p0, Ll/s5r;->q:I

    .line 74
    .line 75
    if-ne v8, v4, :cond_3

    .line 76
    .line 77
    const-wide/16 v8, 0x2

    .line 78
    .line 79
    div-long/2addr v6, v8

    .line 80
    :cond_3
    new-instance v8, Ll/oxd0;

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 87
    .line 88
    .line 89
    move-result-wide v9

    .line 90
    div-long/2addr v9, v2

    .line 91
    sget v11, Ll/s5r;->I:I

    .line 92
    .line 93
    invoke-direct {v8, v0, v9, v10, v11}, Ll/oxd0;-><init>([BJI)V

    .line 94
    .line 95
    .line 96
    move v0, v1

    .line 97
    :goto_0
    int-to-long v9, v0

    .line 98
    const-wide/16 v11, 0x800

    .line 99
    .line 100
    div-long v11, v6, v11

    .line 101
    .line 102
    cmp-long v9, v9, v11

    .line 103
    .line 104
    if-gez v9, :cond_4

    .line 105
    .line 106
    iget-object v9, p0, Ll/s5r;->k:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 107
    .line 108
    invoke-virtual {v9, v8}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundExtraData(Ll/oxd0;)V

    .line 109
    .line 110
    .line 111
    add-int/lit8 v0, v0, 0x1

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    iput-boolean v1, p0, Ll/s5r;->o:Z

    .line 115
    .line 116
    iput v1, p0, Ll/s5r;->t:I

    .line 117
    .line 118
    iget-object v0, p0, Ll/s5r;->v:Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 121
    .line 122
    .line 123
    :cond_5
    move v0, v1

    .line 124
    :cond_6
    :goto_1
    mul-int/lit16 v6, v0, 0x800

    .line 125
    .line 126
    if-ge v6, p2, :cond_a

    .line 127
    .line 128
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v7, p1, v6, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 139
    .line 140
    .line 141
    iget v6, p0, Ll/s5r;->h:I

    .line 142
    .line 143
    if-eqz v6, :cond_7

    .line 144
    .line 145
    iget-object v6, p0, Ll/s5r;->l:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 146
    .line 147
    if-eqz v6, :cond_7

    .line 148
    .line 149
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    iget v9, p0, Ll/s5r;->h:I

    .line 154
    .line 155
    invoke-virtual {v6, v8, v5, v9}, Lcom/immomo/mediacore/audio/AudioProcess;->processAudioPitch([BII)[B

    .line 156
    .line 157
    .line 158
    :cond_7
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    iget v8, p0, Ll/s5r;->g:F

    .line 170
    .line 171
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 172
    .line 173
    .line 174
    move-result-object v9

    .line 175
    invoke-static {v7, v5, v8, v9}, Lcom/immomo/mediabase/AudioMixerNative;->setVolume_Native([BIF[B)I

    .line 176
    .line 177
    .line 178
    iget-object v7, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    if-eqz v7, :cond_8

    .line 181
    .line 182
    invoke-virtual {v7}, Ljava/nio/Buffer;->remaining()I

    .line 183
    .line 184
    .line 185
    move-result v7

    .line 186
    if-lt v7, v5, :cond_8

    .line 187
    .line 188
    iget-object v7, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    invoke-virtual {v7, v8, v1, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 195
    .line 196
    .line 197
    :cond_8
    iget-object v7, p0, Ll/s5r;->p:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 198
    .line 199
    invoke-virtual {v7, v6}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    add-int/lit8 v0, v0, 0x1

    .line 203
    .line 204
    iget v7, p0, Ll/s5r;->t:I

    .line 205
    .line 206
    add-int/2addr v7, v4

    .line 207
    iput v7, p0, Ll/s5r;->t:I

    .line 208
    .line 209
    iget-boolean v7, p0, Ll/s5r;->r:Z

    .line 210
    .line 211
    if-eqz v7, :cond_6

    .line 212
    .line 213
    iget v7, p0, Ll/s5r;->q:I

    .line 214
    .line 215
    if-ne v7, v4, :cond_9

    .line 216
    .line 217
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 218
    .line 219
    .line 220
    move-result-object v6

    .line 221
    invoke-static {v6, v5}, Ll/s5r;->a0([BI)[B

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    iget-object v7, p0, Ll/s5r;->v:Ljava/nio/ByteBuffer;

    .line 226
    .line 227
    const/16 v8, 0x400

    .line 228
    .line 229
    invoke-virtual {v7, v6, v1, v8}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 230
    .line 231
    .line 232
    iget v6, p0, Ll/s5r;->t:I

    .line 233
    .line 234
    rem-int/lit8 v6, v6, 0x2

    .line 235
    .line 236
    if-nez v6, :cond_6

    .line 237
    .line 238
    iget-object v6, p0, Ll/s5r;->v:Ljava/nio/ByteBuffer;

    .line 239
    .line 240
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 241
    .line 242
    .line 243
    new-array v6, v5, [B

    .line 244
    .line 245
    iget-object v7, p0, Ll/s5r;->v:Ljava/nio/ByteBuffer;

    .line 246
    .line 247
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    .line 248
    .line 249
    .line 250
    move-result-object v7

    .line 251
    invoke-static {v7, v1, v6, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 252
    .line 253
    .line 254
    iget-object v7, p0, Ll/s5r;->k:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 255
    .line 256
    new-instance v8, Ll/oxd0;

    .line 257
    .line 258
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 259
    .line 260
    .line 261
    move-result-wide v9

    .line 262
    div-long/2addr v9, v2

    .line 263
    sget v11, Ll/s5r;->I:I

    .line 264
    .line 265
    invoke-direct {v8, v6, v9, v10, v11}, Ll/oxd0;-><init>([BJI)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v7, v8}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundExtraData(Ll/oxd0;)V

    .line 269
    .line 270
    .line 271
    iget-object v6, p0, Ll/s5r;->v:Ljava/nio/ByteBuffer;

    .line 272
    .line 273
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 274
    .line 275
    .line 276
    goto/16 :goto_1

    .line 277
    .line 278
    :cond_9
    iget-object v7, p0, Ll/s5r;->k:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 279
    .line 280
    new-instance v8, Ll/oxd0;

    .line 281
    .line 282
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 287
    .line 288
    .line 289
    move-result-wide v9

    .line 290
    div-long/2addr v9, v2

    .line 291
    sget v11, Ll/s5r;->I:I

    .line 292
    .line 293
    invoke-direct {v8, v6, v9, v10, v11}, Ll/oxd0;-><init>([BJI)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v7, v8}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundExtraData(Ll/oxd0;)V

    .line 297
    .line 298
    .line 299
    goto/16 :goto_1

    .line 300
    .line 301
    :cond_a
    iget-object p1, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 302
    .line 303
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 304
    .line 305
    .line 306
    iget-object p0, p0, Ll/s5r;->u:Ljava/nio/ByteBuffer;

    .line 307
    .line 308
    return-object p0
.end method

.method public E(J)J
    .locals 0

    .line 1
    long-to-float p0, p1

    .line 2
    const/high16 p1, 0x447a0000    # 1000.0f

    .line 3
    .line 4
    mul-float/2addr p0, p1

    .line 5
    sget p1, Ll/s5r;->H:I

    .line 6
    .line 7
    sget p2, Ll/s5r;->I:I

    .line 8
    .line 9
    mul-int/2addr p1, p2

    .line 10
    mul-int/lit8 p1, p1, 0x2

    .line 11
    .line 12
    int-to-float p1, p1

    .line 13
    div-float/2addr p0, p1

    .line 14
    float-to-long p0, p0

    .line 15
    return-wide p0
.end method

.method public F()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/s5r;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public G()J
    .locals 4

    .line 1
    sget-wide v0, Ll/s5r;->G:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-gtz v2, :cond_0

    .line 8
    .line 9
    sget-boolean v2, Ll/s5r;->E:Z

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-virtual {p0, v2, v3}, Ll/s5r;->E(J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    :catch_0
    :cond_0
    return-wide v0
.end method

.method public H()F
    .locals 0

    .line 1
    iget p0, p0, Ll/s5r;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public I(J)J
    .locals 2

    .line 1
    long-to-float p0, p1

    .line 2
    const/high16 p1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p0, p1

    .line 5
    sget p1, Ll/s5r;->H:I

    .line 6
    .line 7
    int-to-float p1, p1

    .line 8
    mul-float/2addr p0, p1

    .line 9
    const/high16 p1, 0x447a0000    # 1000.0f

    .line 10
    .line 11
    div-float/2addr p0, p1

    .line 12
    float-to-long p0, p0

    .line 13
    sget p2, Ll/s5r;->I:I

    .line 14
    .line 15
    int-to-long v0, p2

    .line 16
    mul-long/2addr p0, v0

    .line 17
    const-wide/16 v0, 0x2

    .line 18
    .line 19
    mul-long/2addr p0, v0

    .line 20
    return-wide p0
.end method

.method public J(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/s5r;->b:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "HUOHL_KtvPlayer"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/s5r$c;->b(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Ll/s5r;->j:Ll/s5r$b;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/s5r$b;->a()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public M(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s5r;->o:Z

    .line 3
    .line 4
    sget-boolean v0, Ll/s5r;->D:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-wide/16 v0, 0x3e8

    .line 9
    .line 10
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    :cond_0
    iget-object v0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sget-boolean v1, Ll/s5r;->D:Z

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/s5r$c;->c(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p0, Ll/s5r;->j:Ll/s5r$b;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/s5r$b;->b()V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public N(IZ)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Ll/s5r;->r:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s5r;->M(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O()I
    .locals 9

    .line 1
    const-string v0, "##### \u4f34\u594f\u6587\u4ef6 seek to: "

    .line 2
    .line 3
    iget-object v1, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 4
    .line 5
    const/4 v2, -0x2

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/16 v0, 0x1a

    .line 15
    .line 16
    invoke-interface {p0, v3, v0, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return v2

    .line 20
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    .line 21
    .line 22
    .line 23
    move-result-wide v5

    .line 24
    const-wide/16 v7, 0x0

    .line 25
    .line 26
    cmp-long v1, v5, v7

    .line 27
    .line 28
    if-gtz v1, :cond_2

    .line 29
    .line 30
    sget-object v1, Ll/s5r;->y:Ll/gb1;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    const/16 v5, 0x1b

    .line 35
    .line 36
    invoke-interface {v1, v3, v5, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    :catch_0
    :cond_2
    iget-object v1, p0, Ll/s5r;->s:[B

    .line 40
    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    const/16 v1, 0x2000

    .line 44
    .line 45
    new-array v1, v1, [B

    .line 46
    .line 47
    iput-object v1, p0, Ll/s5r;->s:[B

    .line 48
    .line 49
    :cond_3
    const/4 v1, -0x1

    .line 50
    :try_start_1
    iget v5, p0, Ll/s5r;->f:I

    .line 51
    .line 52
    if-ltz v5, :cond_5

    .line 53
    .line 54
    iget-object v6, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 55
    .line 56
    if-eqz v6, :cond_4

    .line 57
    .line 58
    int-to-long v5, v5

    .line 59
    invoke-virtual {p0, v5, v6}, Ll/s5r;->I(J)J

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    iget-object v7, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 64
    .line 65
    invoke-virtual {v7, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 66
    .line 67
    .line 68
    new-instance v5, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget v0, p0, Ll/s5r;->f:I

    .line 74
    .line 75
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/s5r;->p:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :catch_1
    move-exception v0

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    :goto_0
    iput v1, p0, Ll/s5r;->f:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v6, "##### \u8df3\u8fc7\u524d\u594f\u6216\u8005SEEK Error:"

    .line 99
    .line 100
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_5
    :goto_2
    :try_start_2
    iget-object v0, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 118
    .line 119
    if-eqz v0, :cond_6

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    .line 122
    .line 123
    .line 124
    move-result-wide v5

    .line 125
    invoke-virtual {p0, v5, v6}, Ll/s5r;->E(J)J

    .line 126
    .line 127
    .line 128
    move-result-wide v5

    .line 129
    iput-wide v5, p0, Ll/s5r;->e:J

    .line 130
    .line 131
    iget-object v0, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 132
    .line 133
    iget-object v5, p0, Ll/s5r;->s:[B

    .line 134
    .line 135
    invoke-virtual {v0, v5}, Ljava/io/RandomAccessFile;->read([B)I

    .line 136
    .line 137
    .line 138
    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 139
    goto :goto_3

    .line 140
    :catch_2
    move-exception v0

    .line 141
    new-instance v5, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v6, "exception:"

    .line 144
    .line 145
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_6
    move v0, v4

    .line 163
    :goto_3
    if-ne v0, v1, :cond_8

    .line 164
    .line 165
    const-string v0, "##### \u4f34\u594f\u64ad\u653e\u5b8c\u6210\uff0creadPCMData: BUFFER_FLAG_END_OF_STREAM"

    .line 166
    .line 167
    invoke-virtual {p0, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 171
    .line 172
    if-eqz p0, :cond_7

    .line 173
    .line 174
    const/16 v0, 0x13

    .line 175
    .line 176
    invoke-interface {p0, v3, v0, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 177
    .line 178
    .line 179
    :cond_7
    return v1

    .line 180
    :cond_8
    if-nez v0, :cond_a

    .line 181
    .line 182
    const-string v0, "##### Error When \u4f34\u594f\u64ad\u653e\u8bfb\u53d6\u6587\u4ef6\uff0creadPCMData: read error, no data"

    .line 183
    .line 184
    invoke-virtual {p0, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 188
    .line 189
    if-eqz p0, :cond_9

    .line 190
    .line 191
    const/16 v0, 0x1c

    .line 192
    .line 193
    invoke-interface {p0, v3, v0, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 194
    .line 195
    .line 196
    :cond_9
    return v2

    .line 197
    :cond_a
    iget-object v1, p0, Ll/s5r;->s:[B

    .line 198
    .line 199
    invoke-virtual {p0, v1, v0}, Ll/s5r;->A([BI)Ljava/nio/ByteBuffer;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    if-eqz v1, :cond_c

    .line 204
    .line 205
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-eq v2, v0, :cond_b

    .line 210
    .line 211
    const-string v1, "^^^^^^^^^^^^^\u97f3\u6548\u5904\u7406\u5931\u8d25^^^^^^^^^^^^^^^^^^^^^^"

    .line 212
    .line 213
    invoke-virtual {p0, v1}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    goto :goto_4

    .line 217
    :cond_b
    iget-object p0, p0, Ll/s5r;->s:[B

    .line 218
    .line 219
    invoke-virtual {v1, p0, v4, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 220
    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_c
    const-string p0, "HUOHL_KtvPlayer"

    .line 224
    .line 225
    const-string v1, "##### ERROR \u5e94\u7528\u58f0\u97f3\u7279\u6548\u5931\u8d25========== "

    .line 226
    .line 227
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    :goto_4
    return v0
.end method

.method public P()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 2
    .line 3
    const-string v1, "======= ERROR, RecordPcmEx2 \u64ad\u653e\u7ebf\u7a0b\u9000\u51fa\u5f02\u5e38.............."

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/s5r$c;->d()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/s5r$c;->a()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object v0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V

    .line 19
    .line 20
    .line 21
    iput-object v2, p0, Ll/s5r;->i:Ll/s5r$c;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_0
    invoke-virtual {p0, v1}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/s5r;->j:Ll/s5r$b;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/s5r$b;->d()V

    .line 32
    .line 33
    .line 34
    :try_start_1
    iget-object v0, p0, Ll/s5r;->j:Ll/s5r$b;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Ll/s5r;->j:Ll/s5r$b;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :catch_1
    invoke-virtual {p0, v1}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_1
    iget-object v0, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    :try_start_2
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 53
    .line 54
    :catch_2
    :cond_2
    return-void
.end method

.method public S()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/s5r$c;->b(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Ll/s5r;->j:Ll/s5r$b;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/s5r$b;->c()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public T(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/s5r;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public U(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/s5r;->x:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/s5r;->x:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/s5r;->w:Z

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public V(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/s5r;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public W(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/s5r;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public X(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/s5r;->K:Z

    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "setPlayURL: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "HUOHL_KtvPlayer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1, p2}, Ll/s5r;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :try_start_0
    new-instance p1, Ljava/io/RandomAccessFile;

    .line 27
    .line 28
    new-instance p2, Ljava/io/File;

    .line 29
    .line 30
    sget-object v0, Ll/s5r;->A:Ljava/lang/String;

    .line 31
    .line 32
    invoke-direct {p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string v0, "r"

    .line 36
    .line 37
    invoke-direct {p1, p2, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    :catch_0
    return-void
.end method

.method public a()V
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    sput-boolean p0, Ll/s5r;->E:Z

    .line 3
    .line 4
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0xc

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-interface {p0, v2, v0, v1}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/s5r;->D:Z

    .line 3
    .line 4
    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 5
    .line 6
    new-instance v1, Ljava/io/File;

    .line 7
    .line 8
    sget-object v2, Ll/s5r;->A:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v2, "r"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/s5r;->a:Ljava/io/RandomAccessFile;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    :catch_0
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/16 v0, 0xb

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-interface {p0, v2, v0, v1}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public b0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5r;->i:Ll/s5r$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5r$c;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(J)V
    .locals 0

    .line 1
    sput-wide p1, Ll/s5r;->G:J

    .line 2
    .line 3
    return-void
.end method

.method public c0(Lcom/immomo/mediacore/audio/AudioProcess;I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/s5r;->k:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/s5r;->q:I

    .line 8
    .line 9
    if-eq p2, v0, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundExtraFrames()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/s5r;->k:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 15
    .line 16
    iput p2, p0, Ll/s5r;->q:I

    .line 17
    .line 18
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p2, "KtvPlayer: \u66f4\u65b0\u97f3\u9891\u8f93\u51fa\u901a\u9053\u6570\uff1a"

    .line 21
    .line 22
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget p0, p0, Ll/s5r;->q:I

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "HUOHL_KtvPlayer"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public d(ILjava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 p1, 0x19

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-interface {p0, v0, p1, p2}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
