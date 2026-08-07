.class Lcom/tencent/liteav/d$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/c/o;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/basic/c/o;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/basic/c/o;

.field final synthetic b:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;Lcom/tencent/liteav/basic/c/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$6;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/d$6;->a:Lcom/tencent/liteav/basic/c/o;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onTakePhotoComplete(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/d$6;->a:Lcom/tencent/liteav/basic/c/o;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/liteav/basic/c/o;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
