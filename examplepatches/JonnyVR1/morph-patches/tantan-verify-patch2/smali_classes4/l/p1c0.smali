.class public final synthetic Ll/p1c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderUserView;


# direct methods
.method public synthetic constructor <init>(Ll/z20;ZLcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderUserView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p1c0;->a:Ll/z20;

    iput-boolean p2, p0, Ll/p1c0;->b:Z

    iput-object p3, p0, Ll/p1c0;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderUserView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p1c0;->a:Ll/z20;

    iget-boolean v1, p0, Ll/p1c0;->b:Z

    iget-object p0, p0, Ll/p1c0;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderUserView;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderUserView;->l0(Ll/z20;ZLcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderUserView;Landroid/view/View;)V

    return-void
.end method
