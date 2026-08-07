.class public final synthetic Ll/gxh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostTopicItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/TopicMoment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gxh;->a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostTopicItemView;

    iput-object p2, p0, Ll/gxh;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gxh;->a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostTopicItemView;

    iget-object p0, p0, Ll/gxh;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostTopicItemView;->a(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    return-void
.end method
