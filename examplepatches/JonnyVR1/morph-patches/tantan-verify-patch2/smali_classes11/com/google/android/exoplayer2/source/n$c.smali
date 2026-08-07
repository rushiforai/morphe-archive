.class public final Lcom/google/android/exoplayer2/source/n$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwd0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final synthetic b:Lcom/google/android/exoplayer2/source/n;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/n;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/n$c;->b:Lcom/google/android/exoplayer2/source/n;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/google/android/exoplayer2/source/n$c;->a:I

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/source/n$c;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/source/n$c;->a:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/n$c;->b:Lcom/google/android/exoplayer2/source/n;

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/exoplayer2/source/n$c;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/source/n;->U(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/n$c;->b:Lcom/google/android/exoplayer2/source/n;

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/exoplayer2/source/n$c;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/source/n;->P(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public k(J)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/n$c;->b:Lcom/google/android/exoplayer2/source/n;

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/exoplayer2/source/n$c;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Lcom/google/android/exoplayer2/source/n;->e0(IJ)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/n$c;->b:Lcom/google/android/exoplayer2/source/n;

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/exoplayer2/source/n$c;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/n;->a0(ILl/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
