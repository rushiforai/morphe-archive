.class public final synthetic Ll/dw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/scj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/List;

    check-cast p2, Ljava/util/List;

    check-cast p3, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/api/g;->Z8(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Conversation;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
