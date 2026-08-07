.class public final synthetic Ll/eb8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Conversation;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eb8;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-boolean p2, p0, Ll/eb8;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eb8;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-boolean p0, p0, Ll/eb8;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->e4(Lcom/p1/mobile/putong/core/data/Conversation;Z)V

    return-void
.end method
