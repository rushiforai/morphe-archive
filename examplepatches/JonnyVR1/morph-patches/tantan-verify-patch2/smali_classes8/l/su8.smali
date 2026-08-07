.class public final synthetic Ll/su8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnCompletionListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Landroid/view/TextureView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;Landroid/view/TextureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/su8;->a:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    iput-object p2, p0, Ll/su8;->b:Ll/x20;

    iput-object p3, p0, Ll/su8;->c:Landroid/view/TextureView;

    return-void
.end method


# virtual methods
.method public final onCompletion()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/su8;->a:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    iget-object v1, p0, Ll/su8;->b:Ll/x20;

    iget-object p0, p0, Ll/su8;->c:Landroid/view/TextureView;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->d(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;Landroid/view/TextureView;)V

    return-void
.end method
