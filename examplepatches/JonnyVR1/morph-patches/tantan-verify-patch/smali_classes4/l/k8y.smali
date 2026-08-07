.class public final synthetic Ll/k8y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l8y;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;


# direct methods
.method public synthetic constructor <init>(Ll/l8y;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k8y;->a:Ll/l8y;

    iput-object p2, p0, Ll/k8y;->b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k8y;->a:Ll/l8y;

    iget-object p0, p0, Ll/k8y;->b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    invoke-static {v0, p0, p1}, Ll/l8y;->h(Ll/l8y;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;Landroid/view/View;)V

    return-void
.end method
