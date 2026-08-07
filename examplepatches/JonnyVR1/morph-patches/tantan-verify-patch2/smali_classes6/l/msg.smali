.class public final synthetic Ll/msg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/TopicMoment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/msg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    iput-object p2, p0, Ll/msg;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/msg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    iget-object p0, p0, Ll/msg;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->e(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method
