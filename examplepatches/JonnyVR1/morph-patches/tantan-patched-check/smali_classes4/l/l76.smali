.class public final synthetic Ll/l76;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iput-object p2, p0, Ll/l76;->b:Landroid/view/View;

    iput-object p3, p0, Ll/l76;->c:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iget-object v1, p0, Ll/l76;->b:Landroid/view/View;

    iget-object p0, p0, Ll/l76;->c:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->b(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;)V

    return-void
.end method
