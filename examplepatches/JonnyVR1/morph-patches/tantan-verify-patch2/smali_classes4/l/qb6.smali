.class public final synthetic Ll/qb6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sj6;


# direct methods
.method public synthetic constructor <init>(Ll/sj6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qb6;->a:Ll/sj6;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qb6;->a:Ll/sj6;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->h1(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
