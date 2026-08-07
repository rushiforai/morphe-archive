.class public Ll/p7h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o7h;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p7h;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p7h;->b:Ljava/lang/String;

    .line 7
    .line 8
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
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b()Landroid/os/Bundle;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "groupId"

    .line 7
    .line 8
    iget-object v2, p0, Ll/p7h;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "user_id"

    .line 14
    .line 15
    iget-object p0, p0, Ll/p7h;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public e()Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->GROUP_NEWEST:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6700\u65b0"

    .line 2
    .line 3
    return-object p0
.end method
