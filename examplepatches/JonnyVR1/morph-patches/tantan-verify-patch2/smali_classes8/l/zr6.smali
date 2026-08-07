.class public final synthetic Ll/zr6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zr6;->a:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    iput-boolean p2, p0, Ll/zr6;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zr6;->a:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    iget-boolean p0, p0, Ll/zr6;->b:Z

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->A(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;ZLl/bkj0;)V

    return-void
.end method
