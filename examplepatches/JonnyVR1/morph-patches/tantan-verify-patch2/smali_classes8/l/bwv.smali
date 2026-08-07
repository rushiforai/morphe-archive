.class public final synthetic Ll/bwv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/cwv;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Ll/cwv;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bwv;->a:Ll/cwv;

    iput-object p2, p0, Ll/bwv;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bwv;->a:Ll/cwv;

    iget-object p0, p0, Ll/bwv;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, p0}, Ll/cwv;->e(Ll/cwv;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
