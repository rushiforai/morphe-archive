.class public final synthetic Ll/rm6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Ll/vg60;

    check-cast p3, Lcom/p1/mobile/putong/data/User;

    check-cast p4, Lcom/p1/mobile/putong/core/data/Conversation;

    check-cast p5, Ll/pf60;

    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->a(Lcom/p1/mobile/putong/data/User;Ll/vg60;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Ll/pf60;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
