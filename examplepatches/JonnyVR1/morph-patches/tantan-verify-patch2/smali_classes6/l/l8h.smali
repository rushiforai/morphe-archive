.class public Ll/l8h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o7h;


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l8h;->a:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/dsl;)Landroidx/fragment/app/Fragment;
    .locals 0
    .param p1    # Ll/dsl;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/l8h;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->N4(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public b()Landroid/os/Bundle;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e()Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->GROUP_TOPIC:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u76f8\u5173\u8bdd\u9898"

    .line 2
    .line 3
    return-object p0
.end method
