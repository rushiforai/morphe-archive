.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->o7(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    aget-object v0, v0, v1

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->z5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    aget-object v0, v0, v1

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->B5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    aget-object v0, v0, v1

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget v1, Ll/lbc0;->u1:I

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    aget-object v0, v0, v1

    .line 76
    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 78
    .line 79
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->z5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    aget-object v0, v0, v1

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget v1, Ll/lbc0;->v1:I

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
