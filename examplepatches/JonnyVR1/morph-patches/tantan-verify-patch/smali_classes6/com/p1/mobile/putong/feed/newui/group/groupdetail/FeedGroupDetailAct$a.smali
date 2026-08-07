.class public final Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

.field public d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Landroid/content/Intent;
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "groupId"

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    const-string v1, "TopPositionMomentIdAppendInRecommend"

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string v1, "jumpToTabValue"

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->c:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 27
    .line 28
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public b()Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->GROUP_FRIEND:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->c(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;)Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;)Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->c:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
