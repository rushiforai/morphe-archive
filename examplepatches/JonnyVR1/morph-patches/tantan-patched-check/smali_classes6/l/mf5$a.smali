.class public Ll/mf5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mf5;->J(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public final synthetic c:Ll/mf5;


# direct methods
.method public constructor <init>(Ll/mf5;Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mf5$a;->c:Ll/mf5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mf5$a;->a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/mf5$a;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mf5$a;->c:Ll/mf5;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mf5$a;->a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/mf5;->H(Ll/mf5;Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/cng;->g()Ll/cng;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/mf5$a;->c:Ll/mf5;

    .line 16
    .line 17
    invoke-static {v1}, Ll/mf5;->G(Ll/mf5;)Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/mf5$a;->c:Ll/mf5;

    .line 22
    .line 23
    iget-object v3, p0, Ll/mf5$a;->a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->f:Landroid/widget/ImageView;

    .line 26
    .line 27
    invoke-static {v2, v3}, Ll/mf5;->I(Ll/mf5;Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Ll/mf5$a;->a:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;

    .line 32
    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostTopicItemView;->f:Landroid/widget/ImageView;

    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Ll/mf5$a;->b:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v3, p0}, Ll/cng;->c(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
