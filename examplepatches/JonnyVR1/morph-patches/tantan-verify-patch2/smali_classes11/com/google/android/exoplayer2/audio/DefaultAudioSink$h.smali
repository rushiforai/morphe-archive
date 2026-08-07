.class public Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cc1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/audio/DefaultAudioSink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field public final a:[Lcom/google/android/exoplayer2/audio/AudioProcessor;

.field public final b:Lcom/google/android/exoplayer2/audio/i;

.field public final c:Lcom/google/android/exoplayer2/audio/j;


# direct methods
.method public varargs constructor <init>([Lcom/google/android/exoplayer2/audio/AudioProcessor;)V
    .locals 2

    .line 29
    new-instance v0, Lcom/google/android/exoplayer2/audio/i;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/audio/i;-><init>()V

    new-instance v1, Lcom/google/android/exoplayer2/audio/j;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/audio/j;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;-><init>([Lcom/google/android/exoplayer2/audio/AudioProcessor;Lcom/google/android/exoplayer2/audio/i;Lcom/google/android/exoplayer2/audio/j;)V

    return-void
.end method

.method public constructor <init>([Lcom/google/android/exoplayer2/audio/AudioProcessor;Lcom/google/android/exoplayer2/audio/i;Lcom/google/android/exoplayer2/audio/j;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    add-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    new-array v0, v0, [Lcom/google/android/exoplayer2/audio/AudioProcessor;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->a:[Lcom/google/android/exoplayer2/audio/AudioProcessor;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    array-length v2, p1

    .line 13
    invoke-static {p1, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->b:Lcom/google/android/exoplayer2/audio/i;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->c:Lcom/google/android/exoplayer2/audio/j;

    .line 19
    .line 20
    array-length p0, p1

    .line 21
    aput-object p2, v0, p0

    .line 22
    .line 23
    array-length p0, p1

    .line 24
    add-int/lit8 p0, p0, 0x1

    .line 25
    .line 26
    aput-object p3, v0, p0

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a()[Lcom/google/android/exoplayer2/audio/AudioProcessor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->a:[Lcom/google/android/exoplayer2/audio/AudioProcessor;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Lcom/google/android/exoplayer2/s;)Lcom/google/android/exoplayer2/s;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->c:Lcom/google/android/exoplayer2/audio/j;

    .line 2
    .line 3
    iget v1, p1, Lcom/google/android/exoplayer2/s;->a:F

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/audio/j;->d(F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->c:Lcom/google/android/exoplayer2/audio/j;

    .line 9
    .line 10
    iget v0, p1, Lcom/google/android/exoplayer2/s;->b:F

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/audio/j;->b(F)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->b:Lcom/google/android/exoplayer2/audio/i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/i;->p()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public d(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->c:Lcom/google/android/exoplayer2/audio/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/audio/j;->a(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public e(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$h;->b:Lcom/google/android/exoplayer2/audio/i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/audio/i;->v(Z)V

    .line 4
    .line 5
    .line 6
    return p1
.end method
