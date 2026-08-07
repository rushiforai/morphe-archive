.class public final synthetic Ll/xcz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xcz;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcz;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->R(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    return-void
.end method
