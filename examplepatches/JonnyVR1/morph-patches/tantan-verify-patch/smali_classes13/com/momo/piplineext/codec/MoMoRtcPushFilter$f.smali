.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field private a:Z

.field final synthetic b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->a:Z

    .line 3
    .line 4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 9
    .line 10
    const-string v2, "SoftCodecThread quit"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->a:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-wide/16 v0, 0x42

    .line 12
    .line 13
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_1

    .line 17
    :catch_0
    move-exception v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    :goto_1
    sget-object v0, Ll/pwk;->f:[B

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget v0, v0, Ll/tow;->m:I

    .line 32
    .line 33
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget v1, v1, Ll/tow;->n:I

    .line 40
    .line 41
    mul-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x3

    .line 43
    .line 44
    div-int/lit8 v0, v0, 0x2

    .line 45
    .line 46
    new-array v0, v0, [B

    .line 47
    .line 48
    sput-object v0, Ll/pwk;->f:[B

    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 51
    .line 52
    sget-object v1, Ll/pwk;->f:[B

    .line 53
    .line 54
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o1(Ljava/nio/ByteBuffer;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-void
.end method
