.class public abstract Ll/xpf0;
.super Ll/wof0;
.source "SourceFile"

# interfaces
.implements Ll/odg0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wof0<",
        "Ll/rdg0;",
        "Ll/sdg0;",
        "Lcom/google/android/exoplayer2/text/SubtitleDecoderException;",
        ">;",
        "Ll/odg0;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [Ll/rdg0;

    .line 3
    .line 4
    new-array v0, v0, [Ll/sdg0;

    .line 5
    .line 6
    invoke-direct {p0, v1, v0}, Ll/wof0;-><init>([Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;[Ll/lid;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/xpf0;->n:Ljava/lang/String;

    .line 10
    .line 11
    const/16 p1, 0x400

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/wof0;->u(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic v(Ll/xpf0;Ll/lid;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wof0;->r(Ll/lid;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract A([BIZ)Ll/mdg0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation
.end method

.method public b(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic g()Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xpf0;->w()Ll/rdg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic h()Ll/lid;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xpf0;->x()Ll/sdg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i(Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/decoder/DecoderException;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xpf0;->y(Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/text/SubtitleDecoderException;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic j(Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;Ll/lid;Z)Lcom/google/android/exoplayer2/decoder/DecoderException;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    check-cast p1, Ll/rdg0;

    .line 2
    .line 3
    check-cast p2, Ll/sdg0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xpf0;->z(Ll/rdg0;Ll/sdg0;Z)Lcom/google/android/exoplayer2/text/SubtitleDecoderException;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final w()Ll/rdg0;
    .locals 0

    .line 1
    new-instance p0, Ll/rdg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/rdg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final x()Ll/sdg0;
    .locals 1

    .line 1
    new-instance v0, Ll/xpf0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xpf0$a;-><init>(Ll/xpf0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final y(Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
    .locals 1

    .line 1
    new-instance p0, Lcom/google/android/exoplayer2/text/SubtitleDecoderException;

    .line 2
    .line 3
    const-string v0, "Unexpected decode error"

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Lcom/google/android/exoplayer2/text/SubtitleDecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public final z(Ll/rdg0;Ll/sdg0;Z)Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
    .locals 8
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0, v1, v0, p3}, Ll/xpf0;->A([BIZ)Ll/mdg0;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    iget-wide v3, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 22
    .line 23
    iget-wide v6, p1, Ll/rdg0;->i:J

    .line 24
    .line 25
    move-object v2, p2

    .line 26
    invoke-virtual/range {v2 .. v7}, Ll/sdg0;->v(JLl/mdg0;J)V

    .line 27
    .line 28
    .line 29
    const/high16 p0, -0x80000000

    .line 30
    .line 31
    invoke-virtual {v2, p0}, Ll/ah3;->j(I)V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/text/SubtitleDecoderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    :catch_0
    move-exception v0

    .line 37
    move-object p0, v0

    .line 38
    return-object p0
.end method
