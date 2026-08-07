.class public Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/graphics/Bitmap;

.field public final synthetic b:Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView$a;->b:Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView$a;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView$a;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView$a;->b:Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
