.class public final synthetic Ll/y300;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Picture;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y300;->a:Lcom/p1/mobile/putong/data/Picture;

    iput-object p2, p0, Ll/y300;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y300;->a:Lcom/p1/mobile/putong/data/Picture;

    iget-object p0, p0, Ll/y300;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, p0}, Ll/f400;->k0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
