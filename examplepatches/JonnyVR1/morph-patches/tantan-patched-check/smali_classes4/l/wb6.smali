.class public final synthetic Ll/wb6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sj6;


# direct methods
.method public synthetic constructor <init>(Ll/sj6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wb6;->a:Ll/sj6;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wb6;->a:Ll/sj6;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->u(Ll/sj6;Landroid/view/View;)V

    return-void
.end method
