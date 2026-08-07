.class public final synthetic Ll/oom;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oom;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

    iput-boolean p2, p0, Ll/oom;->b:Z

    iput-object p3, p0, Ll/oom;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oom;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;

    iget-boolean v1, p0, Ll/oom;->b:Z

    iget-object p0, p0, Ll/oom;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;->c(Lcom/p1/mobile/putong/core/newui/messages/anim/view/ImpressSignalConversationHeadView;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
