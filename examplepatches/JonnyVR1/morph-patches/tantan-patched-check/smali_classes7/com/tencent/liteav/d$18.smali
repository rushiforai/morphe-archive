.class Lcom/tencent/liteav/d$18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(IIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;III)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$18;->d:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/d$18;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/d$18;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/d$18;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d$18;->d:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/d;->g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/d$18;->d:Lcom/tencent/liteav/d;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tencent/liteav/d;->g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v0, p0, Lcom/tencent/liteav/d$18;->d:Lcom/tencent/liteav/d;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tencent/liteav/d;->g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget v0, p0, Lcom/tencent/liteav/d$18;->a:I

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget v0, p0, Lcom/tencent/liteav/d$18;->b:I

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget v0, p0, Lcom/tencent/liteav/d$18;->c:I

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    filled-new-array/range {v1 .. v6}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "QOS restart big encoder old resolution %dx%d fps %d, new resolution %dx%d fps %d"

    .line 60
    .line 61
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "TXCCaptureAndEnc"

    .line 66
    .line 67
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/tencent/liteav/d$18;->d:Lcom/tencent/liteav/d;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/tencent/liteav/d;->g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget v1, p0, Lcom/tencent/liteav/d$18;->a:I

    .line 77
    .line 78
    iput v1, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 79
    .line 80
    iget-object v0, p0, Lcom/tencent/liteav/d$18;->d:Lcom/tencent/liteav/d;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/tencent/liteav/d;->g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget v1, p0, Lcom/tencent/liteav/d$18;->b:I

    .line 87
    .line 88
    iput v1, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 89
    .line 90
    iget-object p0, p0, Lcom/tencent/liteav/d$18;->d:Lcom/tencent/liteav/d;

    .line 91
    .line 92
    invoke-static {p0}, Lcom/tencent/liteav/d;->h(Lcom/tencent/liteav/d;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
