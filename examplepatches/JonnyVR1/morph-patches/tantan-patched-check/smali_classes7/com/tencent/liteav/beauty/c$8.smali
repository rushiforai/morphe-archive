.class Lcom/tencent/liteav/beauty/c$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/c;->a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:F

.field final synthetic c:F

.field final synthetic d:Lcom/tencent/liteav/beauty/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/c;FFF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$8;->d:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/c$8;->a:F

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/beauty/c$8;->b:F

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/beauty/c$8;->c:F

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$8;->d:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/tencent/liteav/beauty/c$8;->a:F

    .line 8
    .line 9
    iget v2, p0, Lcom/tencent/liteav/beauty/c$8;->b:F

    .line 10
    .line 11
    iget p0, p0, Lcom/tencent/liteav/beauty/c$8;->c:F

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, p0}, Lcom/tencent/liteav/beauty/b/m;->a(FFF)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
