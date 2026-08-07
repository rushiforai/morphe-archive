.class public final synthetic Ll/w38;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w38;->a:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    iput-object p2, p0, Ll/w38;->b:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w38;->a:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    iget-object p0, p0, Ll/w38;->b:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->O5(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
