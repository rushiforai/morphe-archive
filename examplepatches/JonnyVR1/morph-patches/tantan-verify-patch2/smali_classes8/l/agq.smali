.class public final synthetic Ll/agq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/agq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    iput-object p2, p0, Ll/agq;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p3, p0, Ll/agq;->c:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/agq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    iget-object v1, p0, Ll/agq;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/agq;->c:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->d(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method
