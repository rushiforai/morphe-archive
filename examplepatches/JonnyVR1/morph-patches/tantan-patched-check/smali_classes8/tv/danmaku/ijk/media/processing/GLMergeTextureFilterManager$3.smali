.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->G2(JLandroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Landroid/graphics/Bitmap;

.field final synthetic c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JLandroid/graphics/Bitmap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->b:Landroid/graphics/Bitmap;

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
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 10
    .line 11
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-wide v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->a:J

    .line 16
    .line 17
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 28
    .line 29
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-wide v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->a:J

    .line 34
    .line 35
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;->b:Landroid/graphics/Bitmap;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->l2(Landroid/graphics/Bitmap;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method
