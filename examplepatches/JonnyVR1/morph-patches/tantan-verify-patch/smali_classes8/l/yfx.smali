.class public final synthetic Ll/yfx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Lcom/p1/mobile/putong/core/data/Message;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yfx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    iput-object p2, p0, Ll/yfx;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-boolean p3, p0, Ll/yfx;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yfx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    iget-object v1, p0, Ll/yfx;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-boolean p0, p0, Ll/yfx;->c:Z

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->r(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Lcom/p1/mobile/putong/core/data/Message;ZLjava/lang/Throwable;)V

    return-void
.end method
