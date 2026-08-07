.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->K(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/text/SpannableStringBuilder;ZLcom/p1/mobile/putong/feed/data/MomentMessage;)Landroid/text/SpannableStringBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentActivity;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->c:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->c:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyStickerInfo:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->c:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->media:Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->stickerInfo:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 38
    .line 39
    move-object v3, v0

    .line 40
    move-object v0, p1

    .line 41
    move-object p1, v3

    .line 42
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;->c:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v2, p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->X1(Landroid/content/Context;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/StickerInfo;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance p1, Ll/d4h;

    .line 73
    .line 74
    invoke-direct {p1}, Ll/d4h;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    return-void
.end method
