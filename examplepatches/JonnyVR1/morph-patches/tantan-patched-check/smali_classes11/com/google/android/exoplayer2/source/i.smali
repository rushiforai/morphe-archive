.class public interface abstract Lcom/google/android/exoplayer2/source/i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/i$c;,
        Lcom/google/android/exoplayer2/source/i$b;,
        Lcom/google/android/exoplayer2/source/i$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# virtual methods
.method public abstract addDrmEventListener(Landroid/os/Handler;Lcom/google/android/exoplayer2/drm/b;)V
.end method

.method public abstract addEventListener(Landroid/os/Handler;Lcom/google/android/exoplayer2/source/j;)V
.end method

.method public abstract createPeriod(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;
.end method

.method public abstract disable(Lcom/google/android/exoplayer2/source/i$c;)V
.end method

.method public abstract enable(Lcom/google/android/exoplayer2/source/i$c;)V
.end method

.method public getInitialTimeline()Lcom/google/android/exoplayer2/c0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract getMediaItem()Lcom/google/android/exoplayer2/n;
.end method

.method public isSingleWindow()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public abstract maybeThrowSourceInfoRefreshError()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract prepareSource(Lcom/google/android/exoplayer2/source/i$c;Ll/pgj0;Ll/bf80;)V
    .param p2    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract releasePeriod(Lcom/google/android/exoplayer2/source/h;)V
.end method

.method public abstract releaseSource(Lcom/google/android/exoplayer2/source/i$c;)V
.end method

.method public abstract removeDrmEventListener(Lcom/google/android/exoplayer2/drm/b;)V
.end method

.method public abstract removeEventListener(Lcom/google/android/exoplayer2/source/j;)V
.end method
