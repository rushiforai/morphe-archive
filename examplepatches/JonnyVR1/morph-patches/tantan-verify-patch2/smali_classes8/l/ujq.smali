.class public final synthetic Ll/ujq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ujq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;

    iput-object p2, p0, Ll/ujq;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;

    iget-object p0, p0, Ll/ujq;->b:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method
