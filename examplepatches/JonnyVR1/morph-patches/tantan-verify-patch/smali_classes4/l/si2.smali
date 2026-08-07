.class public final synthetic Ll/si2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

.field public final synthetic b:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/si2;->a:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    iput-object p2, p0, Ll/si2;->b:Lv/VText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/si2;->a:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    iget-object p0, p0, Ll/si2;->b:Lv/VText;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->v(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lv/VText;Landroid/view/View;)V

    return-void
.end method
