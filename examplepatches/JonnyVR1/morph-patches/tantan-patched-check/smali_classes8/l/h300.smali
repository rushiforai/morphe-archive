.class public final synthetic Ll/h300;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h300;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;

    iput-object p2, p0, Ll/h300;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h300;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;

    iget-object p0, p0, Ll/h300;->b:Ljava/lang/Runnable;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->R(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Ljava/lang/Runnable;Ljava/lang/Boolean;)V

    return-void
.end method
