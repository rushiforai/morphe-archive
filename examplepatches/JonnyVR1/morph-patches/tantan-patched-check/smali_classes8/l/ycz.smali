.class public final synthetic Ll/ycz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ycz;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;

    iput-object p2, p0, Ll/ycz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ycz;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;

    iget-object p0, p0, Ll/ycz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->T(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    return-void
.end method
