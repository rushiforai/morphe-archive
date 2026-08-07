.class public Ll/b9j0;
.super Ll/r4h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/r4h<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/r4h;-><init>(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/b9j0;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p3, p0, Ll/b9j0;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic B(Ll/b9j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b9j0;->D(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostSelectedTopicItemView;

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostSelectedTopicItemView;->S(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 7
    .line 8
    .line 9
    new-instance p3, Ll/a9j0;

    .line 10
    .line 11
    invoke-direct {p3, p0, p2}, Ll/a9j0;-><init>(Ll/b9j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p3}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic D(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b9j0;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->W0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/r4h;->z(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/b9j0;->C(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostSelectedTopicItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b9j0;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/NewPostSelectedTopicItemView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
