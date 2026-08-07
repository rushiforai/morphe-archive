.class public Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$d;
.super Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->y(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Landroid/view/TextureView$SurfaceTextureListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$d;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$f;-><init>(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$d;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->i(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->j(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
