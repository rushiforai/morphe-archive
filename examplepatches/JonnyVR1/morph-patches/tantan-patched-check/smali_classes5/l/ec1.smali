.class public final synthetic Ll/ec1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

.field public final synthetic b:Ll/b5c0;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;Ll/b5c0;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ec1;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

    iput-object p2, p0, Ll/ec1;->b:Ll/b5c0;

    iput-object p3, p0, Ll/ec1;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ec1;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

    iget-object v1, p0, Ll/ec1;->b:Ll/b5c0;

    iget-object p0, p0, Ll/ec1;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->b(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;Ll/b5c0;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Landroid/view/View;)V

    return-void
.end method
