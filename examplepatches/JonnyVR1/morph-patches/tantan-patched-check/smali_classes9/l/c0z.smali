.class public final synthetic Ll/c0z;
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
    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p1, p2}, Ll/u1z;->h1(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method
