.class public Ll/wdj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zpl;
.implements Ll/gfm;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wdj0$g;,
        Ll/wdj0$i;,
        Ll/wdj0$h;
    }
.end annotation


# static fields
.field private static final L:Ljava/lang/String; = "wdj0"

.field private static volatile M:Ll/wdj0;


# instance fields
.field private A:Z

.field private B:Z

.field private C:Ll/wdj0$g;

.field private D:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/p94;",
            ">;"
        }
    .end annotation
.end field

.field private E:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/p94;",
            ">;"
        }
    .end annotation
.end field

.field private F:Z

.field private G:I

.field private final H:I

.field private I:I

.field private J:Z

.field private K:Z

.field private a:Ll/xxb;

.field private b:Landroid/content/Context;

.field private c:Ll/dql;

.field private d:Ll/cn2;

.field private e:Landroid/graphics/Bitmap;

.field private f:Landroid/graphics/Bitmap;

.field private g:Landroid/graphics/Bitmap;

.field private h:Landroid/graphics/Bitmap;

.field private i:Landroid/graphics/Bitmap;

.field private j:Landroid/graphics/Bitmap;

.field private k:Landroid/graphics/Bitmap;

.field private l:Landroid/os/Handler;

.field private m:Lcom/idv/identity/face/WorkState;

.field private n:Lcom/idv/identity/face/WorkState;

.field private o:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final p:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Ljava/lang/String;

.field private u:Z

.field private v:Ljava/lang/String;

.field private w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

.field private x:I

.field private y:Ljava/lang/Long;

.field private z:Ll/as4;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/idv/identity/face/WorkState;->INIT:Lcom/idv/identity/face/WorkState;

    .line 5
    .line 6
    iput-object v0, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 7
    .line 8
    iput-object v0, p0, Ll/wdj0;->n:Lcom/idv/identity/face/WorkState;

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/wdj0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/wdj0;->p:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 25
    .line 26
    iput-boolean v1, p0, Ll/wdj0;->q:Z

    .line 27
    .line 28
    iput-boolean v2, p0, Ll/wdj0;->r:Z

    .line 29
    .line 30
    iput-boolean v1, p0, Ll/wdj0;->s:Z

    .line 31
    .line 32
    iput-boolean v1, p0, Ll/wdj0;->u:Z

    .line 33
    .line 34
    iput-boolean v1, p0, Ll/wdj0;->A:Z

    .line 35
    .line 36
    iput-boolean v1, p0, Ll/wdj0;->B:Z

    .line 37
    .line 38
    iput-boolean v1, p0, Ll/wdj0;->F:Z

    .line 39
    .line 40
    const/16 v0, 0x1e

    .line 41
    .line 42
    iput v0, p0, Ll/wdj0;->H:I

    .line 43
    .line 44
    const/4 v0, 0x5

    .line 45
    iput v0, p0, Ll/wdj0;->I:I

    .line 46
    .line 47
    iput-boolean v1, p0, Ll/wdj0;->J:Z

    .line 48
    .line 49
    iput-boolean v1, p0, Ll/wdj0;->K:Z

    .line 50
    .line 51
    return-void
.end method

.method public static synthetic A(Ll/wdj0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wdj0;->Y(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private B()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdj0;->c:Ll/dql;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ll/dql;->o()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-direct {p0}, Ll/wdj0;->P()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    rsub-int p0, v0, 0x168

    .line 16
    .line 17
    rem-int/lit16 p0, p0, 0x168

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    return v0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdj0;->c:Ll/dql;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ll/dql;->o()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-direct {p0}, Ll/wdj0;->P()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    rsub-int p0, v0, 0x168

    .line 16
    .line 17
    rem-int/lit16 p0, p0, 0x168

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    return v0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private E(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/p94;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private F()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/wdj0;->e:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    sget-object v1, Lcom/idv/identity/face/WorkState;->INIT:Lcom/idv/identity/face/WorkState;

    .line 5
    .line 6
    iput-object v1, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 7
    .line 8
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/wdj0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Ll/wdj0;->u:Z

    .line 18
    .line 19
    iput-boolean v2, p0, Ll/wdj0;->q:Z

    .line 20
    .line 21
    iput-boolean v1, p0, Ll/wdj0;->r:Z

    .line 22
    .line 23
    :try_start_0
    iget-object v1, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->p()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    :goto_0
    iput-boolean v2, p0, Ll/wdj0;->F:Z

    .line 42
    .line 43
    iput v2, p0, Ll/wdj0;->G:I

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/wdj0;->E0()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private G(Ll/p94;)[B
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/p94;->a()Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    array-length v1, v0

    .line 11
    new-array p1, v1, [B

    .line 12
    .line 13
    array-length v1, v0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/nio/ReadOnlyBufferException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    return-object p1

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_3

    .line 21
    :catch_0
    move-exception v0

    .line 22
    goto :goto_0

    .line 23
    :catch_1
    move-exception v0

    .line 24
    goto :goto_1

    .line 25
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    new-array p1, p1, [B

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :goto_1
    :try_start_2
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    .line 50
    .line 51
    if-nez p1, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    new-array p1, p1, [B

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    :cond_0
    :goto_2
    return-object p1

    .line 63
    :goto_3
    if-nez p1, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    new-array p1, p1, [B

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    :cond_1
    throw v0
.end method

.method private H0(III)V
    .locals 4

    .line 1
    const-string v0, "zipVideoFrames:"

    .line 2
    .line 3
    const-string v1, "/toyger_verify_video.zip"

    .line 4
    .line 5
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ljava/io/File;

    .line 31
    .line 32
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p0, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 45
    .line 46
    invoke-static {p0}, Ll/cd4;->e(Ljava/util/List;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0, v2, p1, p2, p3}, Ll/bqq0;->c(Ljava/util/ArrayList;Ljava/io/File;III)V

    .line 51
    .line 52
    .line 53
    sget-object p0, Ll/wdj0;->L:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p0, p1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, v1}, Ll/wdj0;->B0(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_0
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/4 p1, 0x0

    .line 75
    invoke-virtual {p0, p1}, Ll/wdj0;->B0(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, p1}, Ll/wdj0;->y0(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static I()Ll/wdj0;
    .locals 2

    .line 1
    sget-object v0, Ll/wdj0;->M:Ll/wdj0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/wdj0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/wdj0;->M:Ll/wdj0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/wdj0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/wdj0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/wdj0;->M:Ll/wdj0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/wdj0;->M:Ll/wdj0;

    .line 27
    .line 28
    return-object v0
.end method

.method private O()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 2
    .line 3
    const-string v1, "config"

    .line 4
    .line 5
    const-string v2, "ConfigIdentityService"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 14
    .line 15
    const-string v3, "IdentityFaceService is null"

    .line 16
    .line 17
    filled-new-array {v1, v3}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v0, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_DEBUG:Lcom/idv/identity/platform/log/RecordLevel;

    .line 30
    .line 31
    const-string v4, "IdentityFaceService "

    .line 32
    .line 33
    filled-new-array {v1, v4}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v3, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :try_start_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/afm;->E()Lcom/idv/identity/platform/config/IdentityFarNearConfig;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ll/afm;->g()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;

    .line 57
    .line 58
    invoke-direct {v2}, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;-><init>()V

    .line 59
    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    const-string v3, "Y"

    .line 64
    .line 65
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    iput-boolean v1, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->isOpenQualityCheck:Z

    .line 73
    .line 74
    :cond_1
    invoke-virtual {p0}, Ll/wdj0;->J()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->livenessCombinations:Ljava/lang/String;

    .line 79
    .line 80
    const/4 v1, 0x4

    .line 81
    iput v1, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->detectImageFormat:I

    .line 82
    .line 83
    iget-boolean v1, p0, Ll/wdj0;->A:Z

    .line 84
    .line 85
    iput-boolean v1, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->isOpenDegrade:Z

    .line 86
    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    iget v1, v0, Lcom/idv/identity/platform/config/IdentityFarNearConfig;->maxFarThreshold:F

    .line 90
    .line 91
    iput v1, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->maxFarThreshold:F

    .line 92
    .line 93
    iget v1, v0, Lcom/idv/identity/platform/config/IdentityFarNearConfig;->minFarThreshold:F

    .line 94
    .line 95
    iput v1, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->minFarThreshold:F

    .line 96
    .line 97
    iget v1, v0, Lcom/idv/identity/platform/config/IdentityFarNearConfig;->maxNearThreshold:F

    .line 98
    .line 99
    iput v1, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->maxNearThreshold:F

    .line 100
    .line 101
    iget v0, v0, Lcom/idv/identity/platform/config/IdentityFarNearConfig;->minNearThreshold:F

    .line 102
    .line 103
    iput v0, v2, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->minNearThreshold:F

    .line 104
    .line 105
    :cond_2
    iget-object v0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 106
    .line 107
    iget-object v1, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 108
    .line 109
    invoke-virtual {v0, v1, v2, p0}, Ll/cn2;->init(Landroid/content/Context;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Ll/gfm;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-nez p0, :cond_3

    .line 114
    .line 115
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 120
    .line 121
    const-string v1, "IdentityFaceService"

    .line 122
    .line 123
    const-string v2, "status"

    .line 124
    .line 125
    const-string v3, "error"

    .line 126
    .line 127
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {p0, v0, v1, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .line 133
    .line 134
    :cond_3
    return-void

    .line 135
    :catch_0
    move-exception p0

    .line 136
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 141
    .line 142
    new-instance v2, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string v3, "init error"

    .line 145
    .line 146
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    filled-new-array {p0}, [Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const-string v2, "ToygerFaceService"

    .line 165
    .line 166
    invoke-virtual {v0, v1, v2, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method private P()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method private S(Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/CopyOnWriteArrayList;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/p94;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    const-string v1, "onCompleteMakeVideo: encode"

    .line 4
    .line 5
    const-string v2, "onCompleteMakeVideo:"

    .line 6
    .line 7
    iget-object v3, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 8
    .line 9
    if-eqz v3, :cond_2

    .line 10
    .line 11
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3}, Ll/wdj0;->L()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/16 v4, 0x386

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-lez v3, :cond_0

    .line 28
    .line 29
    sget-object v3, Ll/wdj0;->L:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v5, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v3, v2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-virtual {v0, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Ll/p94;

    .line 56
    .line 57
    invoke-virtual {v3}, Ll/p94;->g()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {v0, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    check-cast v5, Ll/p94;

    .line 66
    .line 67
    invoke-virtual {v5}, Ll/p94;->f()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    invoke-virtual {v0, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Ll/p94;

    .line 76
    .line 77
    invoke-virtual {v2}, Ll/p94;->e()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    :goto_0
    move v10, v2

    .line 82
    move v8, v3

    .line 83
    move v9, v5

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    sget-object v2, Ll/wdj0;->L:Ljava/lang/String;

    .line 86
    .line 87
    const-string v3, "onCompleteMakeVideo: is null"

    .line 88
    .line 89
    invoke-static {v2, v3}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0}, Ll/wdj0;->C()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    iget-object v2, p0, Ll/wdj0;->c:Ll/dql;

    .line 97
    .line 98
    invoke-interface {v2}, Ll/dql;->m()I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    iget-object v2, p0, Ll/wdj0;->c:Ll/dql;

    .line 103
    .line 104
    invoke-interface {v2}, Ll/dql;->j()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    goto :goto_0

    .line 109
    :goto_1
    sget-object v2, Ll/wdj0;->L:Ljava/lang/String;

    .line 110
    .line 111
    new-instance v3, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v1, " _width"

    .line 128
    .line 129
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, " _height"

    .line 136
    .line 137
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-static {v2, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v0}, Ll/cd4;->e(Ljava/util/List;)Ljava/util/ArrayList;

    .line 151
    .line 152
    .line 153
    move-result-object v7

    .line 154
    sget-object v12, Lcom/idv/identity/face/photinus/VideoFormatConfig;->L:Lcom/idv/identity/face/photinus/VideoFormatConfig;

    .line 155
    .line 156
    new-instance v13, Ll/wdj0$i;

    .line 157
    .line 158
    invoke-direct {v13, p0}, Ll/wdj0$i;-><init>(Ll/wdj0;)V

    .line 159
    .line 160
    .line 161
    move-object v6, p1

    .line 162
    move-object/from16 v11, p2

    .line 163
    .line 164
    invoke-static/range {v6 .. v13}, Lcom/idv/identity/face/photinus/b;->b(Landroid/content/Context;Ljava/util/List;IIILjava/lang/String;Lcom/idv/identity/face/photinus/VideoFormatConfig;Ll/ep50;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :catchall_0
    invoke-direct {p0, v4}, Ll/wdj0;->m0(I)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_1
    invoke-direct {p0, v4}, Ll/wdj0;->m0(I)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_2
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 181
    .line 182
    const-string v1, "onCompleteMakeVideo"

    .line 183
    .line 184
    const-string v2, "uiHandler is null"

    .line 185
    .line 186
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    const-string v2, "TOYGER_UI_MSG_ERROR_CODE"

    .line 191
    .line 192
    invoke-virtual {p0, v0, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method private U(I)V
    .locals 11

    .line 1
    if-eqz p1, :cond_8

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_6

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    const-string v2, "yyyy-MM-dd HH:mm:ss:SSS"

    .line 8
    .line 9
    const-string v3, "ACTION NAME"

    .line 10
    .line 11
    if-eq p1, v1, :cond_5

    .line 12
    .line 13
    const/4 v1, 0x6

    .line 14
    if-eq p1, v1, :cond_4

    .line 15
    .line 16
    const/16 v1, 0x12c

    .line 17
    .line 18
    if-eq p1, v1, :cond_3

    .line 19
    .line 20
    const/16 v1, 0xc9

    .line 21
    .line 22
    if-eq p1, v1, :cond_2

    .line 23
    .line 24
    const/16 v1, 0xca

    .line 25
    .line 26
    if-eq p1, v1, :cond_0

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :cond_0
    iget-boolean v1, p0, Ll/wdj0;->J:Z

    .line 31
    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    const-string v1, "ACTION NAME :blink end"

    .line 35
    .line 36
    invoke-static {v3, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 44
    .line 45
    new-instance v4, Ljava/text/SimpleDateFormat;

    .line 46
    .line 47
    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 48
    .line 49
    invoke-direct {v4, v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Ljava/util/Date;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v10, v2, Ll/afm;->C0:Ljava/lang/String;

    .line 66
    .line 67
    const-string v5, "time"

    .line 68
    .line 69
    const-string v7, "currentPage"

    .line 70
    .line 71
    const-string v8, "FACE"

    .line 72
    .line 73
    const-string v9, "productCode"

    .line 74
    .line 75
    filled-new-array/range {v5 .. v10}, [Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    const-string v4, "END_BLINK_LIVENESS"

    .line 80
    .line 81
    invoke-virtual {v1, v3, v4, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 89
    .line 90
    .line 91
    :cond_1
    const/4 v1, 0x5

    .line 92
    iput v1, p0, Ll/wdj0;->I:I

    .line 93
    .line 94
    iput-boolean v0, p0, Ll/wdj0;->J:Z

    .line 95
    .line 96
    goto/16 :goto_0

    .line 97
    .line 98
    :cond_2
    iget-boolean v1, p0, Ll/wdj0;->K:Z

    .line 99
    .line 100
    if-nez v1, :cond_9

    .line 101
    .line 102
    iput-boolean v0, p0, Ll/wdj0;->K:Z

    .line 103
    .line 104
    const-string v0, "ACTION NAME :blink start"

    .line 105
    .line 106
    invoke-static {v3, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 114
    .line 115
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 116
    .line 117
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 118
    .line 119
    invoke-direct {v3, v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 120
    .line 121
    .line 122
    new-instance v2, Ljava/util/Date;

    .line 123
    .line 124
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iget-object v9, v2, Ll/afm;->C0:Ljava/lang/String;

    .line 136
    .line 137
    const-string v4, "time"

    .line 138
    .line 139
    const-string v6, "currentPage"

    .line 140
    .line 141
    const-string v7, "FACE"

    .line 142
    .line 143
    const-string v8, "productCode"

    .line 144
    .line 145
    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    const-string v3, "START_BLINK_LIVENESS"

    .line 150
    .line 151
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 159
    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_3
    iget-boolean v1, p0, Ll/wdj0;->q:Z

    .line 164
    .line 165
    if-nez v1, :cond_9

    .line 166
    .line 167
    iget-object v1, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 168
    .line 169
    iput-object v1, p0, Ll/wdj0;->n:Lcom/idv/identity/face/WorkState;

    .line 170
    .line 171
    sget-object v1, Lcom/idv/identity/face/WorkState;->PHOTINUS:Lcom/idv/identity/face/WorkState;

    .line 172
    .line 173
    iput-object v1, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 174
    .line 175
    iput-boolean v0, p0, Ll/wdj0;->q:Z

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_4
    const-string v0, "ACTION NAME :end moving far"

    .line 180
    .line 181
    invoke-static {v3, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 189
    .line 190
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 191
    .line 192
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 193
    .line 194
    invoke-direct {v3, v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 195
    .line 196
    .line 197
    new-instance v2, Ljava/util/Date;

    .line 198
    .line 199
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v3, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    iget-object v9, v2, Ll/afm;->C0:Ljava/lang/String;

    .line 211
    .line 212
    const-string v4, "time"

    .line 213
    .line 214
    const-string v6, "currentPage"

    .line 215
    .line 216
    const-string v7, "FACE"

    .line 217
    .line 218
    const-string v8, "productCode"

    .line 219
    .line 220
    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    const-string v3, "MOVE_FAR_LIVENESS"

    .line 225
    .line 226
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 234
    .line 235
    .line 236
    goto :goto_0

    .line 237
    :cond_5
    const-string v0, "ACTION NAME :end moving near"

    .line 238
    .line 239
    invoke-static {v3, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 247
    .line 248
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 249
    .line 250
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 251
    .line 252
    invoke-direct {v3, v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 253
    .line 254
    .line 255
    new-instance v2, Ljava/util/Date;

    .line 256
    .line 257
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v3, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v5

    .line 264
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    iget-object v9, v2, Ll/afm;->C0:Ljava/lang/String;

    .line 269
    .line 270
    const-string v4, "time"

    .line 271
    .line 272
    const-string v6, "currentPage"

    .line 273
    .line 274
    const-string v7, "FACE"

    .line 275
    .line 276
    const-string v8, "productCode"

    .line 277
    .line 278
    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    const-string v3, "MOVE_NEAR_LIVENESS"

    .line 283
    .line 284
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 292
    .line 293
    .line 294
    goto :goto_0

    .line 295
    :cond_6
    iget-object v0, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 296
    .line 297
    instance-of v1, v0, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 298
    .line 299
    if-eqz v1, :cond_9

    .line 300
    .line 301
    check-cast v0, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->H1()Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-virtual {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->r()Z

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    if-eqz v2, :cond_7

    .line 312
    .line 313
    new-instance v2, Ljava/lang/Thread;

    .line 314
    .line 315
    new-instance v3, Ll/wdj0$d;

    .line 316
    .line 317
    invoke-direct {v3, p0, v1, v0}, Ll/wdj0$d;-><init>(Ll/wdj0;Lcom/idv/identity/face/ui/widget/EllipseHoleView;Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 318
    .line 319
    .line 320
    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 324
    .line 325
    .line 326
    goto :goto_0

    .line 327
    :cond_7
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->B2()V

    .line 328
    .line 329
    .line 330
    goto :goto_0

    .line 331
    :cond_8
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-virtual {v0}, Ll/wdj0;->D0()V

    .line 336
    .line 337
    .line 338
    :cond_9
    :goto_0
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 339
    .line 340
    if-eqz v0, :cond_a

    .line 341
    .line 342
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    const/16 v1, 0x390

    .line 347
    .line 348
    iput v1, v0, Landroid/os/Message;->what:I

    .line 349
    .line 350
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 351
    .line 352
    iget-object p0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 353
    .line 354
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 355
    .line 356
    .line 357
    :cond_a
    return-void
.end method

.method private V(ILcom/idv/identity/base/algorithm/IdentityFaceAttr;)V
    .locals 2

    .line 1
    const/16 p2, 0x65

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ll/wdj0;->p:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    invoke-virtual {p2, v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wdj0;->f0()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/16 p2, 0x66

    .line 17
    .line 18
    if-ne p1, p2, :cond_1

    .line 19
    .line 20
    iget-object p2, p0, Ll/wdj0;->p:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 21
    .line 22
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/16 p2, 0x67

    .line 27
    .line 28
    if-ne p1, p2, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wdj0;->f0()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const/16 p2, 0x68

    .line 35
    .line 36
    if-ne p1, p2, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/wdj0;->f0()V

    .line 39
    .line 40
    .line 41
    :cond_3
    :goto_0
    iget-object p2, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 42
    .line 43
    if-eqz p2, :cond_4

    .line 44
    .line 45
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    const/16 v0, 0x38f

    .line 50
    .line 51
    iput v0, p2, Landroid/os/Message;->what:I

    .line 52
    .line 53
    iput p1, p2, Landroid/os/Message;->arg1:I

    .line 54
    .line 55
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 56
    .line 57
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 58
    .line 59
    .line 60
    iput p1, p0, Ll/wdj0;->G:I

    .line 61
    .line 62
    :cond_4
    return-void
.end method

.method private Y(I)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x393

    .line 6
    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ll/wdj0;->l0(Landroid/os/Message;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private Z(II)Z
    .locals 10

    .line 1
    const/16 v0, 0x394

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/wdj0;->m0(I)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 7
    .line 8
    iget-object v2, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {v0}, Ll/wdj0;->C()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    const/4 v8, 0x2

    .line 19
    const/4 v9, 0x0

    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v7, 0x4

    .line 22
    move v3, p1

    .line 23
    move v4, p2

    .line 24
    invoke-virtual/range {v1 .. v9}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->r(Landroid/content/Context;IIIIIIZ)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_0
    iget-object p1, p0, Ll/wdj0;->c:Ll/dql;

    .line 33
    .line 34
    invoke-interface {p1}, Ll/dql;->o()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Ll/wdj0;->x:I

    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide p1

    .line 44
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/wdj0;->y:Ljava/lang/Long;

    .line 49
    .line 50
    iget-object p1, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 51
    .line 52
    new-instance p2, Ll/wdj0$h;

    .line 53
    .line 54
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-direct {p2, v0}, Ll/wdj0$h;-><init>(Ll/wdj0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p2}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->v(Ll/y270;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->j()V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget-object p1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 74
    .line 75
    new-instance p2, Ljava/text/SimpleDateFormat;

    .line 76
    .line 77
    const-string v0, "yyyy-MM-dd HH:mm:ss:SSS"

    .line 78
    .line 79
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 80
    .line 81
    invoke-direct {p2, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 82
    .line 83
    .line 84
    new-instance v0, Ljava/util/Date;

    .line 85
    .line 86
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    iget-object v6, p2, Ll/afm;->C0:Ljava/lang/String;

    .line 98
    .line 99
    const-string v1, "time"

    .line 100
    .line 101
    const-string v3, "currentPage"

    .line 102
    .line 103
    const-string v4, "FACE"

    .line 104
    .line 105
    const-string v5, "productCode"

    .line 106
    .line 107
    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    const-string v0, "START_PHOTINUS"

    .line 112
    .line 113
    invoke-virtual {p0, p1, v0, p2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const/4 p0, 0x1

    .line 117
    return p0
.end method

.method private a0(Ll/p94;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/wdj0;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/p94;->d()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Ll/p94;->c()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {p0, v0, v1}, Ll/wdj0;->Z(II)Z

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Ll/wdj0;->r:Z

    .line 18
    .line 19
    :cond_0
    new-instance v0, Ll/z270;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/wdj0;->G(Ll/p94;)[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v0, p1}, Ll/z270;-><init>([B)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Ll/wdj0;->x:I

    .line 29
    .line 30
    iput p1, v0, Ll/f6j;->b:I

    .line 31
    .line 32
    iget-object p0, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->i(Ll/z270;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private c0()V
    .locals 1

    .line 1
    new-instance v0, Ll/wdj0$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wdj0$c;-><init>(Ll/wdj0;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/wdj0;->n0(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private d0(I)V
    .locals 3

    .line 1
    sget-object v0, Ll/wdj0;->L:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "recordFaceOutFrames: messageCode"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " outVideoDataFrames:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-boolean v0, p0, Ll/wdj0;->s:Z

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/16 v0, 0x386

    .line 45
    .line 46
    if-ne p1, v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/wdj0;->x0()V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method private i0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/wdj0;->I:I

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/wdj0;->J:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/wdj0;->K:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 9
    .line 10
    invoke-direct {p0, v0}, Ll/wdj0;->E(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private j0(Ll/p94;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Ll/wdj0;->L:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "saveVideoFrame blinkPassed:"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-boolean v2, p0, Ll/wdj0;->J:Z

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, "  frameCountAfterAction:"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v2, p0, Ll/wdj0;->I:I

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v0, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-boolean v1, p0, Ll/wdj0;->J:Z

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget v1, p0, Ll/wdj0;->I:I

    .line 48
    .line 49
    add-int/lit8 v1, v1, -0x1

    .line 50
    .line 51
    iput v1, p0, Ll/wdj0;->I:I

    .line 52
    .line 53
    if-gez v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/wdj0;->x0()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    iget-object v1, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 60
    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 64
    .line 65
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v1, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 69
    .line 70
    :cond_2
    iget-object v1, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    const/16 v2, 0x1e

    .line 77
    .line 78
    if-le v1, v2, :cond_3

    .line 79
    .line 80
    iget-object v1, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    invoke-virtual {v1, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    :cond_3
    iget-object v1, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 87
    .line 88
    invoke-virtual {v1, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    new-instance p1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v1, "saveVideoFrame videoDataFrames:"

    .line 94
    .line 95
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 99
    .line 100
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {v0, p0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method private k0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0x387

    .line 10
    .line 11
    iput v1, v0, Landroid/os/Message;->what:I

    .line 12
    .line 13
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object p0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private l0(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic m(Ll/wdj0;)Ll/cn2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 2
    .line 3
    return-object p0
.end method

.method private declared-synchronized m0(I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public static synthetic n(Ll/wdj0;)Lcom/idv/identity/face/photinus/PhotinusEmulator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 2
    .line 3
    return-object p0
.end method

.method private declared-synchronized n0(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public static synthetic o(Ll/wdj0;)Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->y:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method private o0(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    sget v0, Ll/t0g0$a;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/wdj0;->k:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic p(Ll/wdj0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wdj0;->q:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic q(Ll/wdj0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Ll/wdj0;Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/CopyOnWriteArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/wdj0;->S(Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/CopyOnWriteArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/wdj0;->L:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic t(Ll/wdj0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wdj0;->m0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ll/wdj0;)Ll/dql;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->c:Ll/dql;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Ll/wdj0;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wdj0;->C()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic w(Ll/wdj0;III)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/wdj0;->H0(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/wdj0;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y(Ll/wdj0;Ljava/util/concurrent/CopyOnWriteArrayList;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic z(Ll/wdj0;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public declared-synchronized A0(Z)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-boolean p1, p0, Ll/wdj0;->s:Z

    .line 3
    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    iget-object p1, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/wdj0;->D:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-direct {p0, p1}, Ll/wdj0;->E(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p1, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    invoke-direct {p0, p1}, Ll/wdj0;->E(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    :goto_1
    invoke-direct {p0}, Ll/wdj0;->i0()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    :cond_2
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p1
.end method

.method public B0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wdj0;->t:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/afm;->T1(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C0(Lcom/idv/identity/face/WorkState;)Lcom/idv/identity/face/WorkState;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 2
    .line 3
    iput-object p1, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 4
    .line 5
    return-object v0
.end method

.method public D()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/wdj0;->E:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public D0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wdj0;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 9
    .line 10
    instance-of v1, v0, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    check-cast v0, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {p0, v1}, Ll/wdj0;->r0(Z)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/wdj0$b;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/wdj0$b;-><init>(Ll/wdj0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/idv/identity/face/ui/ToygerActivity;->r2(Landroid/animation/Animator$AnimatorListener;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public E0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/wdj0;->F0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public F0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wdj0;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/cn2;->setFarNeatAction(Z)Z

    .line 14
    .line 15
    .line 16
    :cond_1
    invoke-virtual {p0, v1}, Ll/wdj0;->r0(Z)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget-object p1, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 22
    .line 23
    instance-of v0, p1, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 28
    .line 29
    new-instance v0, Ll/wdj0$a;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/wdj0$a;-><init>(Ll/wdj0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->d2(Landroid/animation/Animator$AnimatorListener;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    :goto_0
    return-void
.end method

.method public G0()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "/toyger_photinus_video.zip"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ljava/io/File;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v1, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 47
    .line 48
    iget-object v2, p0, Ll/wdj0;->c:Ll/dql;

    .line 49
    .line 50
    invoke-interface {v2}, Ll/dql;->h()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iget-object v3, p0, Ll/wdj0;->c:Ll/dql;

    .line 55
    .line 56
    invoke-interface {v3}, Ll/dql;->i()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-direct {p0}, Ll/wdj0;->C()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->z(Ljava/lang/String;III)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_1

    .line 73
    .line 74
    iput-object v0, p0, Ll/wdj0;->v:Ljava/lang/String;

    .line 75
    .line 76
    :cond_1
    return-object v0

    .line 77
    :cond_2
    const-string p0, ""

    .line 78
    .line 79
    return-object p0
.end method

.method public H()Ll/as4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->z:Ll/as4;

    .line 2
    .line 3
    return-object p0
.end method

.method public J()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/afm;->C0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/afm;->y0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const-string v0, "faceBlinkLiveness"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/afm;->A0()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    const-string v0, "PhotinusLiveness"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/afm;->z0()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    const-string v0, "faceBlinkLiveness#PhotinusLiveness"

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    :cond_3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/afm;->v0()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    const-string v0, "faceBlinkLiveness#faceFarNearLiveness#PhotinusLiveness"

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    :cond_4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ll/afm;->w0()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    const-string v0, "faceFarNearLiveness#PhotinusLiveness"

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    :cond_5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ll/afm;->x0()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_6

    .line 105
    .line 106
    const-string v0, "faceBlinkLiveness#shakeHeadLiveness#OpenMouthLiveness#faceFarNearLiveness#PhotinusLiveness"

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    :cond_6
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ll/afm;->B0()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_7

    .line 120
    .line 121
    const-string v0, "shakeHeadLiveness#faceFarNearLiveness"

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    :cond_7
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method

.method public K()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wdj0;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public M()Lcom/idv/identity/face/WorkState;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 2
    .line 3
    return-object p0
.end method

.method public N(Landroid/content/Context;Landroid/os/Handler;Ll/dql;Ll/wdj0$g;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wdj0;->F()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wdj0;->c:Ll/dql;

    .line 9
    .line 10
    iput-object p4, p0, Ll/wdj0;->C:Ll/wdj0$g;

    .line 11
    .line 12
    const-string p1, "com.idv.identity.service.IdentityFaceService"

    .line 13
    .line 14
    const-class p2, Ll/cn2;

    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/ofm;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/cn2;

    .line 21
    .line 22
    iput-object p1, p0, Ll/wdj0;->d:Ll/cn2;

    .line 23
    .line 24
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/afm;->u0()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput-boolean p1, p0, Ll/wdj0;->u:Z

    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    :try_start_0
    new-instance p1, Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 37
    .line 38
    invoke-direct {p1}, Lcom/idv/identity/face/photinus/PhotinusEmulator;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget-object p2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 50
    .line 51
    const-string p3, "status"

    .line 52
    .line 53
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {p3, p0}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p3, "ClientConfigError"

    .line 62
    .line 63
    invoke-virtual {p1, p2, p3, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    return p0

    .line 68
    :cond_0
    :goto_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/afm;->r0()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    new-instance p1, Ll/as4;

    .line 79
    .line 80
    invoke-direct {p1}, Ll/as4;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Ll/wdj0;->z:Ll/as4;

    .line 84
    .line 85
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ll/afm;->q()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iput-boolean p1, p0, Ll/wdj0;->A:Z

    .line 94
    .line 95
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Ll/afm;->w()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string p2, "Y"

    .line 104
    .line 105
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    invoke-virtual {p0, p1}, Ll/wdj0;->A0(Z)V

    .line 110
    .line 111
    .line 112
    sget-object p1, Lcom/idv/identity/face/WorkState;->FACE_CAPTURING:Lcom/idv/identity/face/WorkState;

    .line 113
    .line 114
    iput-object p1, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 115
    .line 116
    invoke-direct {p0}, Ll/wdj0;->O()V

    .line 117
    .line 118
    .line 119
    const/4 p0, 0x1

    .line 120
    return p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wdj0;->B:Z

    .line 2
    .line 3
    return p0
.end method

.method public R()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wdj0;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public T(ILjava/lang/Throwable;)V
    .locals 1

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "unknown Camera Code =>"

    .line 7
    .line 8
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :pswitch_0
    sget-object p1, Ll/dfm;->j:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :pswitch_1
    if-eqz p2, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, p2}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    sget-object p1, Ll/dfm;->i:Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :pswitch_2
    sget-object p1, Ll/dfm;->g:Ljava/lang/String;

    .line 35
    .line 36
    :goto_0
    invoke-direct {p0, p1}, Ll/wdj0;->k0(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    nop

    .line 41
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public W()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wdj0;->c:Ll/dql;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Ll/wdj0;->c:Ll/dql;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iput-object v1, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 13
    .line 14
    :cond_1
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iput-object v1, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 19
    .line 20
    :cond_2
    iget-object v0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/cn2;->release()V

    .line 25
    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Ll/wdj0;->z:Ll/as4;

    .line 28
    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/as4;->r()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Ll/wdj0;->z:Ll/as4;

    .line 35
    .line 36
    :cond_4
    :try_start_0
    iget-object v0, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 37
    .line 38
    if-eqz v0, :cond_5

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->p()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :cond_5
    :goto_0
    sput-object v1, Ll/wdj0;->M:Ll/wdj0;

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-virtual {p0, v0}, Ll/wdj0;->r0(Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x386

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ll/wdj0;->d0(I)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/wdj0$e;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/wdj0$e;-><init>(Ll/wdj0;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v0}, Ll/wdj0;->n0(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget-object v0, Lcom/idv/identity/face/WorkState;->FACE_COMPLETED:Lcom/idv/identity/face/WorkState;

    .line 19
    .line 20
    iput-object v0, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 21
    .line 22
    return-void
.end method

.method public a(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/wdj0;->o0(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public b(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "frame"

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "onHighQualityFrame"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/wdj0;->v0(Landroid/graphics/Bitmap;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public b0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdj0;->c:Ll/dql;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/dql;->b()Landroid/hardware/Camera;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/wdj0;->z:Ll/as4;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/as4;->s(Landroid/hardware/Camera;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public c(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wdj0;->s0(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public d(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wdj0;->u0(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/util/Map;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const-string v0, "INIT_LOAD_MODEL_ERROR"

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const-string v2, "INIT_LOAD_SO_ERROR"

    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    sparse-switch p2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :sswitch_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v3, 0x2

    .line 26
    goto :goto_0

    .line 27
    :sswitch_1
    const-string p2, "INIT_LOAD_MODEL_SUCCESS"

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v3, v1

    .line 37
    goto :goto_0

    .line 38
    :sswitch_2
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-nez p2, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v3, 0x0

    .line 46
    :goto_0
    const-string p2, "onEvent >>>> : [eventCode]:"

    .line 47
    .line 48
    packed-switch v3, :pswitch_data_0

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :pswitch_0
    sget-object v2, Ll/wdj0;->L:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v3, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, "\u6a21\u578b\u52a0\u8f7d\u5931\u8d25"

    .line 63
    .line 64
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {v2, p1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :pswitch_1
    sget-object v0, Ll/wdj0;->L:Ljava/lang/String;

    .line 76
    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v2, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p1, "\u6a21\u578b\u52a0\u8f7d\u6210\u529f"

    .line 86
    .line 87
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {v0, p1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :goto_1
    const-string v0, ""

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :pswitch_2
    sget-object v0, Ll/wdj0;->L:Ljava/lang/String;

    .line 101
    .line 102
    new-instance v3, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string p1, "so\u5e93\u52a0\u8f7d\u5931\u8d25"

    .line 111
    .line 112
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {v0, p1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    move-object v0, v2

    .line 123
    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_3

    .line 128
    .line 129
    invoke-direct {p0, v0}, Ll/wdj0;->k0(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    return v1

    .line 133
    :sswitch_data_0
    .sparse-switch
        -0x31f24371 -> :sswitch_2
        0x135790a3 -> :sswitch_1
        0x6833cea8 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e0()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wdj0;->U(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wdj0;->b:Landroid/content/Context;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/idv/identity/face/ui/ToygerActivity;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/ToygerActivity;->h2()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/wdj0;->w:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 19
    .line 20
    sget-object v4, Lcom/idv/identity/face/WorkState;->PHOTINUS:Lcom/idv/identity/face/WorkState;

    .line 21
    .line 22
    if-ne v3, v4, :cond_1

    .line 23
    .line 24
    iget-boolean v3, p0, Ll/wdj0;->q:Z

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    iget-object v3, p0, Ll/wdj0;->n:Lcom/idv/identity/face/WorkState;

    .line 29
    .line 30
    iput-object v3, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 31
    .line 32
    iput-boolean v1, p0, Ll/wdj0;->r:Z

    .line 33
    .line 34
    iput-boolean v2, p0, Ll/wdj0;->q:Z

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->b()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/wdj0;->C:Ll/wdj0$g;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-interface {v0}, Ll/wdj0$g;->R()V

    .line 44
    .line 45
    .line 46
    :cond_1
    iput-boolean v2, p0, Ll/wdj0;->q:Z

    .line 47
    .line 48
    iput-boolean v2, p0, Ll/wdj0;->J:Z

    .line 49
    .line 50
    iput-boolean v2, p0, Ll/wdj0;->K:Z

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ll/wdj0;->F0(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/wdj0;->h0()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/wdj0;->D()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public g(ILjava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget p1, Ll/t0g0$a;->c:I

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-static {p1, p2}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    sget-object p1, Ll/wdj0;->L:Ljava/lang/String;

    .line 8
    .line 9
    new-instance p2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "onComplete:[usePhotinus]"

    .line 12
    .line 13
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v0, p0, Ll/wdj0;->u:Z

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, " Thread Name:"

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p1, p2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/16 p1, 0x391

    .line 41
    .line 42
    invoke-direct {p0, p1}, Ll/wdj0;->m0(I)V

    .line 43
    .line 44
    .line 45
    iget-boolean p1, p0, Ll/wdj0;->u:Z

    .line 46
    .line 47
    iget-object p2, p0, Ll/wdj0;->z:Ll/as4;

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    if-eqz p2, :cond_0

    .line 53
    .line 54
    invoke-virtual {p2, v0}, Ll/as4;->j(I)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    :cond_0
    invoke-direct {p0}, Ll/wdj0;->c0()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    if-eqz p2, :cond_3

    .line 65
    .line 66
    invoke-virtual {p2, v0}, Ll/as4;->j(I)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    return-void

    .line 74
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/wdj0;->X()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public g0(DD)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0x385

    .line 10
    .line 11
    iput v1, v0, Landroid/os/Message;->what:I

    .line 12
    .line 13
    double-to-int p1, p1

    .line 14
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 15
    .line 16
    double-to-int p1, p3

    .line 17
    iput p1, v0, Landroid/os/Message;->arg2:I

    .line 18
    .line 19
    iget-object p0, p0, Ll/wdj0;->l:Landroid/os/Handler;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public h(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/wdj0;->f:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Ll/afm;->b1(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "resetIdentityFaceService------------"

    .line 6
    .line 7
    invoke-static {v0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/idv/identity/base/algorithm/IIdentityDelegate;->reset()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public i(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wdj0;->t0(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public j(Lcom/idv/identity/base/algorithm/IDFrame;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdj0;->d:Ll/cn2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cn2;->processImage(Lcom/idv/identity/base/algorithm/IDFrame;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k(ILcom/idv/identity/base/algorithm/IdentityFaceAttr;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/wdj0;->V(ILcom/idv/identity/base/algorithm/IdentityFaceAttr;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/wdj0;->g:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Ll/afm;->i1(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public p0(Ll/p94;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/wdj0;->F:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    sget-object v0, Lcom/idv/identity/face/WorkState;->PHOTINUS:Lcom/idv/identity/face/WorkState;

    .line 8
    .line 9
    iget-object v1, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-boolean v1, p0, Ll/wdj0;->q:Z

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/wdj0;->a0(Ll/p94;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v1, p0, Ll/wdj0;->m:Lcom/idv/identity/face/WorkState;

    .line 21
    .line 22
    sget-object v2, Lcom/idv/identity/face/WorkState;->FACE_CAPTURING:Lcom/idv/identity/face/WorkState;

    .line 23
    .line 24
    if-eq v1, v2, :cond_2

    .line 25
    .line 26
    sget-object v2, Lcom/idv/identity/face/WorkState;->FACE_CAPTURING_DARK:Lcom/idv/identity/face/WorkState;

    .line 27
    .line 28
    if-eq v1, v2, :cond_2

    .line 29
    .line 30
    if-eq v1, v0, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    iget-object v0, p0, Ll/wdj0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    invoke-direct {p0}, Ll/wdj0;->B()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-virtual {p1, v5}, Ll/p94;->h(I)Ll/p94;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/wdj0;->L()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-direct {p0, p1}, Ll/wdj0;->j0(Ll/p94;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    iget-object v0, p0, Ll/wdj0;->C:Ll/wdj0$g;

    .line 64
    .line 65
    if-eqz v0, :cond_5

    .line 66
    .line 67
    invoke-interface {v0}, Ll/wdj0$g;->c0()V

    .line 68
    .line 69
    .line 70
    :cond_5
    invoke-virtual {p1}, Ll/p94;->a()Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p0, Ll/wdj0;->d:Ll/cn2;

    .line 75
    .line 76
    if-eqz v1, :cond_6

    .line 77
    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    :try_start_0
    new-instance v1, Lcom/idv/identity/base/algorithm/IDFrame;

    .line 81
    .line 82
    iget-object v2, p1, Ll/p94;->q:[B

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/p94;->d()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-virtual {p1}, Ll/p94;->c()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    invoke-virtual {p1}, Ll/p94;->b()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    const/4 v7, 0x1

    .line 97
    invoke-direct/range {v1 .. v7}, Lcom/idv/identity/base/algorithm/IDFrame;-><init>([BIIIII)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v1}, Ll/wdj0;->j(Lcom/idv/identity/base/algorithm/IDFrame;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catch_0
    move-exception v0

    .line 105
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 106
    .line 107
    .line 108
    :cond_6
    :goto_0
    iget-object v0, p0, Ll/wdj0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/wdj0;->z:Ll/as4;

    .line 115
    .line 116
    if-eqz v0, :cond_8

    .line 117
    .line 118
    invoke-virtual {v0, p1}, Ll/as4;->k(Ll/p94;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_8

    .line 123
    .line 124
    iget-boolean p1, p0, Ll/wdj0;->u:Z

    .line 125
    .line 126
    if-eqz p1, :cond_7

    .line 127
    .line 128
    invoke-direct {p0}, Ll/wdj0;->c0()V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_7
    invoke-virtual {p0}, Ll/wdj0;->X()V

    .line 133
    .line 134
    .line 135
    :cond_8
    :goto_1
    return-void
.end method

.method public preProcess()V
    .locals 0

    .line 1
    return-void
.end method

.method public q0(Ll/xxb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wdj0;->a:Ll/xxb;

    .line 2
    .line 3
    return-void
.end method

.method public r0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wdj0;->B:Z

    .line 2
    .line 3
    return-void
.end method

.method public s0(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    sget v0, Ll/t0g0$a;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/wdj0;->i:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    return-void
.end method

.method public t0(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    sget v0, Ll/t0g0$a;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/wdj0;->j:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    return-void
.end method

.method public u0(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    sget v0, Ll/t0g0$a;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/wdj0;->h:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    return-void
.end method

.method public v0(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    sget v0, Ll/t0g0$a;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/wdj0;->e:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ll/afm;->W0(Landroid/graphics/Bitmap;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public w0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wdj0;->F:Z

    .line 2
    .line 3
    return-void
.end method

.method public x0()V
    .locals 1

    .line 1
    new-instance v0, Ll/wdj0$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wdj0$f;-><init>(Ll/wdj0;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/wdj0;->n0(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wdj0;->v:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/afm;->M1(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wdj0;->u:Z

    .line 2
    .line 3
    return-void
.end method
