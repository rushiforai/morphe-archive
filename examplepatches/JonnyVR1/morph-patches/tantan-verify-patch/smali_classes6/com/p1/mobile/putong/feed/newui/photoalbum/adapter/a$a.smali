.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 4
    .line 5
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->P(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a$a;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a;->s(Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of p0, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 12
    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->u()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    instance-of p0, p3, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->M()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method
