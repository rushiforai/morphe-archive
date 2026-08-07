.class public final synthetic Ll/tu8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tu8;->a:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    iput-object p2, p0, Ll/tu8;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onError(II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tu8;->a:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    iget-object p0, p0, Ll/tu8;->b:Ll/x20;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;II)Z

    move-result p0

    return p0
.end method
