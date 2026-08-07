.class public final synthetic Ll/nom;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nom;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

    iput-object p2, p0, Ll/nom;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/nom;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nom;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

    iget-object v1, p0, Ll/nom;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/nom;->c:Z

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;->g(Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;Ljava/lang/String;ZZ)V

    return-void
.end method
