.class public final synthetic Ll/ct6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ct6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    iput-object p2, p0, Ll/ct6;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ct6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    iget-object p0, p0, Ll/ct6;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X4(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
