.class public final synthetic Ll/id6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/sj6;


# direct methods
.method public synthetic constructor <init>(Ll/sj6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/id6;->a:Ll/sj6;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/id6;->a:Ll/sj6;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->A1(Ll/sj6;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method
