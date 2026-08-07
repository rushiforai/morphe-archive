.class public Lcom/tantanapp/media/ttns/TTNsProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static sLoadSuccessful:Z


# instance fields
.field private final ERROR:I

.field private final SUCCESS:I

.field private mFs:I

.field private mNsInstance:J

.field private mNsMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "ttns"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Lcom/tantanapp/media/ttns/TTNsProcessor;->sLoadSuccessful:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-boolean v0, Lcom/tantanapp/media/ttns/TTNsProcessor;->sLoadSuccessful:Z

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->ERROR:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->SUCCESS:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput v0, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsMode:I

    .line 12
    .line 13
    sget-boolean v0, Lcom/tantanapp/media/ttns/TTNsProcessor;->sLoadSuccessful:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/tantanapp/media/ttns/TTNsProcessor;->nativeNsCreate()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsInstance:J

    .line 23
    .line 24
    iput p1, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mFs:I

    .line 25
    .line 26
    return-void
.end method

.method private native nativeNsCreate()J
.end method

.method private native nativeNsFree(J)V
.end method

.method private native nativeNsInit(JI)I
.end method

.method private native nativeNsProcess(J[SI[S)I
.end method

.method private native nativeNsSetConfig(JI)I
.end method

.method public static newInstance(I)Lcom/tantanapp/media/ttns/TTNsProcessor;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttns/TTNsProcessor;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/media/ttns/TTNsProcessor;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public free()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/ttns/TTNsProcessor;->sLoadSuccessful:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v0, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsInstance:J

    .line 7
    .line 8
    invoke-direct {p0, v0, v1}, Lcom/tantanapp/media/ttns/TTNsProcessor;->nativeNsFree(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public init()I
    .locals 4

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/ttns/TTNsProcessor;->sLoadSuccessful:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-wide v2, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsInstance:J

    .line 8
    .line 9
    iget v0, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mFs:I

    .line 10
    .line 11
    invoke-direct {p0, v2, v3, v0}, Lcom/tantanapp/media/ttns/TTNsProcessor;->nativeNsInit(JI)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsInstance:J

    .line 18
    .line 19
    iget v2, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsMode:I

    .line 20
    .line 21
    invoke-direct {p0, v0, v1, v2}, Lcom/tantanapp/media/ttns/TTNsProcessor;->nativeNsSetConfig(JI)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    return v1
.end method

.method public process([SI[S)I
    .locals 6

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/ttns/TTNsProcessor;->sLoadSuccessful:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-wide v1, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsInstance:J

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p1

    .line 11
    move v4, p2

    .line 12
    move-object v5, p3

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/tantanapp/media/ttns/TTNsProcessor;->nativeNsProcess(J[SI[S)I

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public setNsMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttns/TTNsProcessor;->mNsMode:I

    .line 2
    .line 3
    return-void
.end method
