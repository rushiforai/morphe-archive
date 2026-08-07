.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->w()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$d;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(ZI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$d;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$d;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->k(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$d;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->k(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Ljava/util/Set;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    const-string p0, "special_effects_id"

    .line 41
    .line 42
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    filled-new-array {p0}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "e_camera_video_effect"

    .line 53
    .line 54
    const-string p2, "p_camera_video"

    .line 55
    .line 56
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
