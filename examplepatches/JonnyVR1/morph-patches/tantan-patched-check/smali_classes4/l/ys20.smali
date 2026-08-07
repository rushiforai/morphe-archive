.class public final synthetic Ll/ys20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    move-object p0, p1

    check-cast p0, Lcom/p1/mobile/putong/data/User;

    move-object p1, p2

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    move-object p2, p3

    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    move-object p3, p4

    check-cast p3, Ljava/lang/Integer;

    move-object p4, p5

    check-cast p4, Ll/uxj0;

    move-object p5, p6

    check-cast p5, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->I2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Integer;Ll/uxj0;Lcom/p1/mobile/putong/core/data/Message;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
