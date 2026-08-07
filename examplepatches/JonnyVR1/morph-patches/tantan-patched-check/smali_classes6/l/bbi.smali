.class public final synthetic Ll/bbi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jbi;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;


# direct methods
.method public synthetic constructor <init>(Ll/jbi;Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bbi;->a:Ll/jbi;

    iput-object p2, p0, Ll/bbi;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bbi;->a:Ll/jbi;

    iget-object p0, p0, Ll/bbi;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    invoke-static {v0, p0}, Ll/jbi;->x0(Ll/jbi;Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    return-void
.end method
