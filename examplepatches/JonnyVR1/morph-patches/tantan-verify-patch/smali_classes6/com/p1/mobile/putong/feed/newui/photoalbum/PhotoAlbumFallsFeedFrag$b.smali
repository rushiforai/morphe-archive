.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;->a:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;->a:I

    .line 2
    .line 3
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 6
    .line 7
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 8
    .line 9
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 10
    .line 11
    return-void
.end method
