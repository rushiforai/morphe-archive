.class public final synthetic Ll/o900;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/p900;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;


# direct methods
.method public synthetic constructor <init>(Ll/p900;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o900;->a:Ll/p900;

    iput-object p2, p0, Ll/o900;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o900;->a:Ll/p900;

    iget-object p0, p0, Ll/o900;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-static {v0, p0}, Ll/p900;->i(Ll/p900;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    return-void
.end method
