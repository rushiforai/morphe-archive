.class public final synthetic Ll/lf5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mf5;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/TopicMoment;


# direct methods
.method public synthetic constructor <init>(Ll/mf5;Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lf5;->a:Ll/mf5;

    iput-object p2, p0, Ll/lf5;->b:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    iput-object p3, p0, Ll/lf5;->c:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lf5;->a:Ll/mf5;

    iget-object v1, p0, Ll/lf5;->b:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    iget-object p0, p0, Ll/lf5;->c:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-static {v0, v1, p0, p1}, Ll/mf5;->F(Ll/mf5;Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method
