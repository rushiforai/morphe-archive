.class public final synthetic Ll/xpc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xpc0;->a:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xpc0;->a:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->L(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
