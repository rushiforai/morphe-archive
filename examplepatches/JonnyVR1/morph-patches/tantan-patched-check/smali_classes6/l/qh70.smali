.class public final synthetic Ll/qh70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

.field public final synthetic b:I

.field public final synthetic c:Landroid/widget/TextView;

.field public final synthetic d:Lv/VImage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;ILandroid/widget/TextView;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qh70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    iput p2, p0, Ll/qh70;->b:I

    iput-object p3, p0, Ll/qh70;->c:Landroid/widget/TextView;

    iput-object p4, p0, Ll/qh70;->d:Lv/VImage;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qh70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    iget v1, p0, Ll/qh70;->b:I

    iget-object v2, p0, Ll/qh70;->c:Landroid/widget/TextView;

    iget-object p0, p0, Ll/qh70;->d:Lv/VImage;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;ILandroid/widget/TextView;Lv/VImage;Landroid/view/View;)V

    return-void
.end method
