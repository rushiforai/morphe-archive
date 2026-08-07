.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v2(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

.field final synthetic c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;->b:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 3
    .line 4
    iget v2, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 5
    .line 6
    const/4 v3, -0x1

    .line 7
    if-ge v0, v2, :cond_1

    .line 8
    .line 9
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;->a:J

    .line 10
    .line 11
    iget-object v2, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 12
    .line 13
    aget-wide v6, v2, v0

    .line 14
    .line 15
    cmp-long v2, v4, v6

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v0, v3

    .line 24
    :goto_1
    if-eq v0, v3, :cond_2

    .line 25
    .line 26
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;->b:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 27
    .line 28
    invoke-virtual {v1, v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q2(Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 32
    .line 33
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v:[I

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    aput v1, p0, v0

    .line 37
    .line 38
    :cond_2
    return-void
.end method
