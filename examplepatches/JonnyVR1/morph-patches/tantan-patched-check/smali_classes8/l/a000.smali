.class public final synthetic Ll/a000;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a000;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a000;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0}, Ll/j000;->e(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
