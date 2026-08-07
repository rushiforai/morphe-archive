.class public final Ll/mni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/n5l;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/n5l;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/offline/StreamKey;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/n5l;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n5l;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/offline/StreamKey;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mni;->a:Ll/n5l;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mni;->b:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/source/hls/playlist/c;Lcom/google/android/exoplayer2/source/hls/playlist/b;)Lcom/google/android/exoplayer2/upstream/d$a;
    .locals 2
    .param p2    # Lcom/google/android/exoplayer2/source/hls/playlist/b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/hls/playlist/c;",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b;",
            ")",
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "Ll/m5l;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nni;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mni;->a:Ll/n5l;

    .line 4
    .line 5
    invoke-interface {v1, p1, p2}, Ll/n5l;->a(Lcom/google/android/exoplayer2/source/hls/playlist/c;Lcom/google/android/exoplayer2/source/hls/playlist/b;)Lcom/google/android/exoplayer2/upstream/d$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/mni;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-direct {v0, p1, p0}, Ll/nni;-><init>(Lcom/google/android/exoplayer2/upstream/d$a;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public b()Lcom/google/android/exoplayer2/upstream/d$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "Ll/m5l;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nni;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mni;->a:Ll/n5l;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/n5l;->b()Lcom/google/android/exoplayer2/upstream/d$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/mni;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Ll/nni;-><init>(Lcom/google/android/exoplayer2/upstream/d$a;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
