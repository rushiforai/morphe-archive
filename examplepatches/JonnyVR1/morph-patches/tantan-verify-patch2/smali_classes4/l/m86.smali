.class public final synthetic Ll/m86;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->s(Lcom/p1/mobile/putong/core/api/CoreLikers$a;Ljava/lang/Boolean;)Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    move-result-object p0

    return-object p0
.end method
