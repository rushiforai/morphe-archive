.class public final synthetic Ll/e8j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e8j0;->a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e8j0;->a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->X1(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
