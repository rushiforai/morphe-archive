.class public final synthetic Ll/peq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/peq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

    iput-object p2, p0, Ll/peq;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/peq;->c:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/peq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

    iget-object v1, p0, Ll/peq;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/peq;->c:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->c(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method
