.class public final synthetic Ll/r2q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ll/pol;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Ll/pol;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

    iput-object p2, p0, Ll/r2q;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/r2q;->c:Ll/pol;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r2q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

    iget-object v1, p0, Ll/r2q;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/r2q;->c:Ll/pol;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Landroid/view/View;)V

    return-void
.end method
