.class Lcom/immomo/moment/mediautils/i$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/h$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/i;->f0(Ljava/lang/String;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/i;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStartRendingImageToTexture(Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget-wide v1, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Lcom/immomo/moment/mediautils/i;->X(Lcom/immomo/moment/mediautils/i;J)J

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->W(Lcom/immomo/moment/mediautils/i;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-wide v2, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 22
    .line 23
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 24
    .line 25
    iget-wide v4, v0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 26
    .line 27
    sub-long/2addr v2, v4

    .line 28
    const-wide/32 v4, 0x7a120

    .line 29
    .line 30
    .line 31
    cmp-long v0, v2, v4

    .line 32
    .line 33
    if-lez v0, :cond_0

    .line 34
    .line 35
    return v1

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 37
    .line 38
    iget-wide v2, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 39
    .line 40
    invoke-static {v0, v2, v3}, Lcom/immomo/moment/mediautils/i;->N(Lcom/immomo/moment/mediautils/i;J)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v2, 0x1

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-wide v3, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 48
    .line 49
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 50
    .line 51
    iget-wide v5, v0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 52
    .line 53
    cmp-long v3, v3, v5

    .line 54
    .line 55
    if-lez v3, :cond_2

    .line 56
    .line 57
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->F(Lcom/immomo/moment/mediautils/i;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-interface {v0, v3}, Lcom/immomo/moment/mediautils/m$e;->e(Landroid/media/MediaCodec$BufferInfo;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 72
    .line 73
    invoke-static {v0, v2}, Lcom/immomo/moment/mediautils/i;->G(Lcom/immomo/moment/mediautils/i;Z)Z

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 77
    .line 78
    const/16 v0, 0x10

    .line 79
    .line 80
    invoke-static {p0, v0}, Lcom/immomo/moment/mediautils/i;->E(Lcom/immomo/moment/mediautils/i;I)V

    .line 81
    .line 82
    .line 83
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v0, "video end "

    .line 86
    .line 87
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-wide v2, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 91
    .line 92
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string p1, "MediaDecoder"

    .line 100
    .line 101
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_2
    return v1

    .line 105
    :cond_3
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$e;->a:Lcom/immomo/moment/mediautils/i;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 108
    .line 109
    invoke-interface {p0, p1}, Lcom/immomo/moment/mediautils/m$e;->e(Landroid/media/MediaCodec$BufferInfo;)V

    .line 110
    .line 111
    .line 112
    return v2
.end method
