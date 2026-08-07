.class public Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->c(Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$a;->i:Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$a;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$a;->t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "p_nearby"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/er60;->c(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V
    .locals 0

    .line 1
    return-void
.end method
