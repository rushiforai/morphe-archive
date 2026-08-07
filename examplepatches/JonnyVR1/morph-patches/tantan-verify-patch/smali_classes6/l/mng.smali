.class public final synthetic Ll/mng;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mng;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;

    iput p2, p0, Ll/mng;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mng;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;

    iget p0, p0, Ll/mng;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;->p(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/FeedAlbumInterestedEntranceView;ILandroid/view/View;)V

    return-void
.end method
