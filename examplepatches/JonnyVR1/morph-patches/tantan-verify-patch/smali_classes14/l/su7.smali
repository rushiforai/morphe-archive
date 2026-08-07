.class public final synthetic Ll/su7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/su7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/su7;->b:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/su7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Ll/su7;->b:Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->p8(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
