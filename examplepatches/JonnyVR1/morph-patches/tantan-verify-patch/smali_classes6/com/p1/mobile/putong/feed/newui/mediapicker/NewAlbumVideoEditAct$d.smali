.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$d;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ll/fam;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->H2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
