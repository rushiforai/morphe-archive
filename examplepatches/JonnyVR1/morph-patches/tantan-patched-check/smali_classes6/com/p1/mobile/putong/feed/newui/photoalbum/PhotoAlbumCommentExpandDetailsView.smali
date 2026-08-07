.class public abstract Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field public static m:Ljava/lang/String;


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public b:Ll/di5;

.field public c:Ll/n570;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/feed/data/Moment;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Ljava/lang/String;

.field public k:Ll/w30;

.field public l:Ll/w30;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->T(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->y0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->g0(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/data/StickerInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->b0(Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->V(Ljava/lang/String;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c0(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->U()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->m0()V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->n0(Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic l(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d0(Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Landroid/widget/ImageView;Landroid/widget/TextView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a0(Landroid/widget/ImageView;Landroid/widget/TextView;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->Y()V

    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Landroid/widget/ImageView;Landroid/widget/TextView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->Z(Landroid/widget/ImageView;Landroid/widget/TextView;Ll/uxj0;)V

    return-void
.end method

.method public static r0(ZILandroid/widget/ImageView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget p0, Ll/lbc0;->Z0:I

    .line 4
    .line 5
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/k9c0;->K:I

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget p0, Ll/lbc0;->a1:I

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget p2, Ll/k9c0;->n:I

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    :goto_0
    if-lez p1, :cond_1

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    :goto_1
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->i0(Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic t(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->S(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k0()V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->W(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->h0(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->j0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public abstract D()Lcom/p1/mobile/android/app/Act;
.end method

.method public final E(Landroid/text/SpannableStringBuilder;)I
    .locals 4

    .line 1
    const-string v0, "     "

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/otg;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget v2, Ll/lbc0;->C0:I

    .line 17
    .line 18
    invoke-static {p0, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-direct {v0, v1, p0}, Ll/otg;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const/4 v1, 0x3

    .line 30
    sub-int/2addr p0, v1

    .line 31
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int/lit8 v2, v2, -0x2

    .line 36
    .line 37
    const/16 v3, 0x21

    .line 38
    .line 39
    invoke-virtual {p1, v0, p0, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 40
    .line 41
    .line 42
    return v1
.end method

.method public final F()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->u4:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/ka70;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/ka70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1, v2}, Ll/k3h;->w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final G(Ll/w30;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/w30;->d()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/CharSequence;
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentName()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0, p1, p2, p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->N(Ljava/lang/String;Ljava/lang/String;Z)F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    new-instance v8, Ll/v970;

    .line 14
    .line 15
    invoke-direct {v8, p0}, Ll/v970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 16
    .line 17
    .line 18
    move-object v3, p1

    .line 19
    move-object v4, p2

    .line 20
    move-object v5, p3

    .line 21
    move-object v6, p4

    .line 22
    move v7, p5

    .line 23
    invoke-static/range {v1 .. v8}, Ll/h9i;->f(Landroid/graphics/Paint;FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/ucj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const/4 p4, 0x0

    .line 28
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p4

    .line 32
    move-object v3, p4

    .line 33
    check-cast v3, Ljava/lang/String;

    .line 34
    .line 35
    const/4 p4, 0x1

    .line 36
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    move-object v4, p3

    .line 41
    check-cast v4, Ljava/lang/String;

    .line 42
    .line 43
    move-object v0, p0

    .line 44
    move-object v1, p1

    .line 45
    move-object v2, p2

    .line 46
    move v5, p5

    .line 47
    move v6, p6

    .line 48
    move/from16 v7, p7

    .line 49
    .line 50
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public final I(Z)Lcom/p1/mobile/putong/feed/data/CommentStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 11
    .line 12
    return-object p0
.end method

.method public J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/CharSequence;
    .locals 4

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 15
    .line 16
    .line 17
    new-instance p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView$a;

    .line 18
    .line 19
    invoke-direct {p3, p0, p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;I)V

    .line 20
    .line 21
    .line 22
    const/4 p6, 0x0

    .line 23
    const/16 v3, 0x11

    .line 24
    .line 25
    invoke-virtual {v0, p3, p6, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->O(Ljava/lang/String;Landroid/text/SpannableStringBuilder;I)V

    .line 29
    .line 30
    .line 31
    if-eqz p5, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->E(Landroid/text/SpannableStringBuilder;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    new-instance p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView$b;

    .line 38
    .line 39
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 43
    .line 44
    .line 45
    move-result p5

    .line 46
    sub-int/2addr p5, p1

    .line 47
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {v0, p3, p5, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, p4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    .line 57
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView$c;

    .line 58
    .line 59
    invoke-direct {p1, p0, p7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    sub-int/2addr p3, v2

    .line 67
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 68
    .line 69
    .line 70
    move-result p4

    .line 71
    invoke-virtual {v0, p1, p3, p4, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->O(Ljava/lang/String;Landroid/text/SpannableStringBuilder;I)V

    .line 79
    .line 80
    .line 81
    :cond_0
    return-object v0
.end method

.method public K(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->P(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const-string p3, ""

    .line 14
    .line 15
    const-string v1, "\u4f5c\u8005"

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    move-object p1, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object p1, p3

    .line 22
    :goto_0
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 23
    .line 24
    .line 25
    if-eqz p5, :cond_2

    .line 26
    .line 27
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string p5, " "

    .line 30
    .line 31
    invoke-direct {p1, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->P(Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    move-object p3, v1

    .line 67
    :cond_1
    invoke-virtual {v0, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    .line 70
    :cond_2
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public abstract L(Z)Ljava/lang/String;
.end method

.method public final M(Z)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/owi;->b()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->I(Z)Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v1, "selfOnly"

    .line 17
    .line 18
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->k5:I

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->m:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getTime()Lv/VText;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/high16 p1, 0x40a00000    # 5.0f

    .line 46
    .line 47
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-static {p0, p1}, Ll/cai;->g(Landroid/widget/TextView;I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sput-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->m:Ljava/lang/String;

    .line 56
    .line 57
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->m:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public abstract N(Ljava/lang/String;Ljava/lang/String;Z)F
.end method

.method public final O(Ljava/lang/String;Landroid/text/SpannableStringBuilder;I)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->P(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p1, Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "\u4f5c\u8005"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    const/high16 v0, 0x41100000    # 9.0f

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Ll/k9c0;->m:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    const/high16 v0, 0x40800000    # 4.0f

    .line 41
    .line 42
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/high16 v2, 0x40000000    # 2.0f

    .line 47
    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {p1, v1, v3, v0, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 61
    .line 62
    .line 63
    const/16 v0, 0x11

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/4 v1, 0x1

    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 74
    .line 75
    .line 76
    sget v0, Ll/lbc0;->B0:I

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {p1, v1, v2}, Landroid/view/View;->measure(II)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-virtual {p1, v0, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    const-string v0, "  "

    .line 112
    .line 113
    invoke-virtual {p2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/otg;

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-direct {v0, p0, p1}, Ll/otg;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 123
    .line 124
    .line 125
    add-int/lit8 p0, p3, 0x1

    .line 126
    .line 127
    add-int/lit8 p3, p3, 0x2

    .line 128
    .line 129
    const/16 p1, 0x21

    .line 130
    .line 131
    invoke-virtual {p2, v0, p0, p3, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public P(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final Q()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final R()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final synthetic S(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 9
    .line 10
    check-cast p0, Ll/wh00;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/wh00;->a()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic T(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic U()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, v3}, Ll/n570;->l(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/la70;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/la70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/ma70;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/ma70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic V(Ljava/lang/String;Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 14
    .line 15
    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-array v2, v1, [Ljava/lang/CharSequence;

    .line 20
    .line 21
    aput-object p2, v2, v0

    .line 22
    .line 23
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->G0:I

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->v0(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return v1

    .line 75
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->R()Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_4

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 86
    .line 87
    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    new-array v2, v1, [Ljava/lang/CharSequence;

    .line 92
    .line 93
    aput-object p2, v2, v0

    .line 94
    .line 95
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_2

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->G0:I

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    .line 148
    .line 149
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const-string v2, "normal"

    .line 163
    .line 164
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-nez v0, :cond_3

    .line 169
    .line 170
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    :cond_3
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->v0(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return v1

    .line 177
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 182
    .line 183
    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    new-array v2, v1, [Ljava/lang/CharSequence;

    .line 188
    .line 189
    aput-object p2, v2, v0

    .line 190
    .line 191
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_5

    .line 212
    .line 213
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->G0:I

    .line 218
    .line 219
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    .line 231
    .line 232
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->w0(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    return v1
.end method

.method public final synthetic W(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/w970;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/w970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->i:Z

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, Ll/er60;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 33
    .line 34
    invoke-virtual {p1, v0, v1}, Ll/er60;->j(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->y0(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic Y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l:Ll/w30;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l:Ll/w30;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w30;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l:Ll/w30;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k:Ll/w30;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k:Ll/w30;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/w30;->d()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k:Ll/w30;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public final synthetic Z(Landroid/widget/ImageView;Landroid/widget/TextView;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    iget-boolean p3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 4
    .line 5
    xor-int/lit8 v0, p3, 0x1

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    iget p3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 12
    .line 13
    add-int/lit8 p3, p3, 0x1

    .line 14
    .line 15
    iput p3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget p3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 19
    .line 20
    add-int/lit8 p3, p3, -0x1

    .line 21
    .line 22
    iput p3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 23
    .line 24
    :goto_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 25
    .line 26
    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->r0(ZILandroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic a0(Landroid/widget/ImageView;Landroid/widget/TextView;Ll/uxj0;)V
    .locals 3

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 2
    .line 3
    instance-of v0, p3, Ll/wh00;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p3, Ll/wh00;

    .line 8
    .line 9
    invoke-interface {p3}, Ll/wh00;->c()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 13
    .line 14
    iget-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 15
    .line 16
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 17
    .line 18
    xor-int/lit8 v2, v1, 0x1

    .line 19
    .line 20
    iput-boolean v2, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 21
    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    iget v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 32
    .line 33
    add-int/lit8 v1, v1, -0x1

    .line 34
    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 36
    .line 37
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 38
    .line 39
    iget-object v0, v0, Ll/jka;->H0:Ljava/util/Map;

    .line 40
    .line 41
    iget-object v1, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 47
    .line 48
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 49
    .line 50
    iget-boolean v0, p3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 51
    .line 52
    iget p3, p3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 53
    .line 54
    invoke-static {v0, p3, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->r0(ZILandroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 58
    .line 59
    iget-object p1, p1, Ll/jka;->R0:Lrx/subjects/b;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic b0(Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wh00;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->L(Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p1, p2, p0}, Ll/wh00;->d(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic c0(ZLandroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getLikeIndicator()Lv/VImage;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getLikeCount()Lv/VText;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->p0(Landroid/widget/ImageView;Landroid/widget/TextView;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic d0(Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wh00;

    .line 2
    .line 3
    const/4 p3, 0x1

    .line 4
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->L(Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p1, p2, p0}, Ll/wh00;->d(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic e0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    const/4 v0, 0x1

    .line 16
    if-nez p3, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/w1e;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->e:I

    .line 33
    .line 34
    invoke-virtual {p3, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->O3:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    filled-new-array {p3, v1}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-static {p3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const-string v2, "normal"

    .line 61
    .line 62
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_1

    .line 67
    .line 68
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    new-instance p3, Ll/ua70;

    .line 84
    .line 85
    invoke-direct {p3, p1, p2}, Ll/ua70;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 93
    .line 94
    .line 95
    return v0
.end method

.method public final synthetic f0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/sa70;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Ll/sa70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p3, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, p1, p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->X1(Landroid/content/Context;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/StickerInfo;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p1, Ll/d4h;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/d4h;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p3, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public abstract getCommentName()Lv/VText;
.end method

.method public abstract getCommentSticker()Lv/VDraweeView;
.end method

.method public abstract getCommentStickerContent()Landroid/widget/RelativeLayout;
.end method

.method public abstract getCommentText()Lv/VText;
.end method

.method public abstract getLikeCount()Lv/VText;
.end method

.method public abstract getLikeCountContainer()Lv/VRelative;
.end method

.method public abstract getLikeIndicator()Lv/VImage;
.end method

.method public abstract getPic()Lv/VDraweeView;
.end method

.method public abstract getPicFrame()Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;
.end method

.method public abstract getPicVerification()Lv/VImage;
.end method

.method public abstract getReply()Lv/VText;
.end method

.method public abstract getTime()Lv/VText;
.end method

.method public final synthetic h0(ZLandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->j:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/y3i;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 9
    .line 10
    check-cast p2, Ll/wh00;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->L(Z)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p2, v0, p0}, Ll/wh00;->d(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic i0(Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 8
    .line 9
    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    invoke-static {p2, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k:Ll/w30;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->G(Ll/w30;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance p2, Ll/ja70;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/ja70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 31
    .line 32
    .line 33
    const-wide/16 p3, 0xc8

    .line 34
    .line 35
    invoke-static {p1, p2, p3, p4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 46
    .line 47
    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    invoke-static {p2, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->F()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    .line 68
    .line 69
    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 84
    .line 85
    iget-object p4, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 86
    .line 87
    iget-object p3, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    const-string v0, "dynamicReview"

    .line 90
    .line 91
    invoke-static {p2, v0, p4, p1, p3}, Ll/rzi;->V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    const-string p2, "moment_id"

    .line 96
    .line 97
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 102
    .line 103
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-eqz p2, :cond_3

    .line 108
    .line 109
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 110
    .line 111
    iget-object p2, p2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    const-string p2, ""

    .line 115
    .line 116
    :goto_0
    const-string p3, "comment_id"

    .line 117
    .line 118
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    const-string p2, "e_copy_comment"

    .line 127
    .line 128
    const-string p3, "p_comment_interaction_pop"

    .line 129
    .line 130
    invoke-static {p2, p3, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {p1}, Ll/l51;->q(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->F0:I

    .line 145
    .line 146
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k:Ll/w30;

    .line 154
    .line 155
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->G(Ll/w30;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public final synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n0(Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l:Ll/w30;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->G(Ll/w30;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance p2, Ll/ia70;

    .line 13
    .line 14
    invoke-direct {p2, p0}, Ll/ia70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 p3, 0xc8

    .line 18
    .line 19
    invoke-static {p1, p2, p3, p4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    const/4 p2, 0x1

    .line 24
    if-ne p4, p2, :cond_2

    .line 25
    .line 26
    const-string p2, "moment_id"

    .line 27
    .line 28
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string p2, ""

    .line 46
    .line 47
    :goto_0
    const-string p3, "comment_id"

    .line 48
    .line 49
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string p2, "e_copy_comment"

    .line 58
    .line 59
    const-string p3, "p_comment_interaction_pop"

    .line 60
    .line 61
    invoke-static {p2, p3, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p1}, Ll/l51;->q(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->F0:I

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 90
    .line 91
    iget-object p4, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 92
    .line 93
    iget-object p3, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 94
    .line 95
    const-string v0, "dynamicReview"

    .line 96
    .line 97
    invoke-static {p2, v0, p4, p1, p3}, Ll/rzi;->V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l:Ll/w30;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->G(Ll/w30;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final o0(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentName()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x4

    .line 14
    new-array v3, v3, [Landroid/view/View;

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    aput-object p0, v3, v4

    .line 18
    .line 19
    const/4 v4, 0x1

    .line 20
    aput-object v0, v3, v4

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    aput-object v1, v3, v0

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    aput-object v2, v3, v0

    .line 27
    .line 28
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/u970;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/u970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getPic()Lv/VDraweeView;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/na70;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/na70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/oa70;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/oa70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final p0(Landroid/widget/ImageView;Landroid/widget/TextView;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "fake_id_"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 15
    .line 16
    if-eqz p3, :cond_1

    .line 17
    .line 18
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 19
    .line 20
    if-nez v0, :cond_3

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 24
    .line 25
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->i:Z

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const-string v0, "p_immersion_comment_page"

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    const-string v0, "p_user_moment_interactions_details_view"

    .line 37
    .line 38
    :goto_1
    const-string v1, "moment_id"

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "owner_id"

    .line 47
    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v2, v3}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    filled-new-array {v1, v2}, [Ll/tfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "e_comment_like"

    .line 59
    .line 60
    invoke-static {v2, v0, v1}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 64
    .line 65
    if-eqz p3, :cond_4

    .line 66
    .line 67
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->h:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->g:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 72
    .line 73
    iget-object v3, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 76
    .line 77
    xor-int/lit8 v2, v2, 0x1

    .line 78
    .line 79
    invoke-virtual {v0, p3, v1, v3, v2}, Ll/n570;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    new-instance v0, Ll/x970;

    .line 84
    .line 85
    invoke-direct {v0, p0, p1, p2}, Ll/x970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 86
    .line 87
    .line 88
    new-instance p0, Ll/y970;

    .line 89
    .line 90
    invoke-direct {p0}, Ll/y970;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 106
    .line 107
    iget-object v3, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 110
    .line 111
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 112
    .line 113
    xor-int/lit8 v2, v2, 0x1

    .line 114
    .line 115
    invoke-virtual {v0, p3, v1, v3, v2}, Ll/n570;->u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    new-instance v0, Ll/z970;

    .line 120
    .line 121
    invoke-direct {v0, p0, p1, p2}, Ll/z970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 122
    .line 123
    .line 124
    new-instance p0, Ll/aa70;

    .line 125
    .line 126
    invoke-direct {p0}, Ll/aa70;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public q0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->b:Ll/di5;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->j:Ljava/lang/String;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->u0(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance p4, Ll/ta70;

    .line 26
    .line 27
    invoke-direct {p4, p0, p2, p3}, Ll/ta70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->o0(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final s0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 9
    .line 10
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->liked:Z

    .line 11
    .line 12
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 20
    .line 21
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->likes:I

    .line 22
    .line 23
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getLikeIndicator()Lv/VImage;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getLikeCount()Lv/VText;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->r0(ZILandroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getLikeCountContainer()Lv/VRelative;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/t970;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Ll/t970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public setIsFromImmersionVideo(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public t0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/di5;",
            "Ll/n570;",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->b:Ll/di5;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->g:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->h:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->e:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->u0(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 18
    .line 19
    .line 20
    move-result-object p5

    .line 21
    new-instance p6, Ll/s970;

    .line 22
    .line 23
    invoke-direct {p6, p0, p2, p3}, Ll/s970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p5, p6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentName()Lv/VText;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 34
    .line 35
    .line 36
    move-result-object p5

    .line 37
    const/4 p6, 0x3

    .line 38
    new-array p6, p6, [Landroid/view/View;

    .line 39
    .line 40
    const/4 p7, 0x0

    .line 41
    aput-object p0, p6, p7

    .line 42
    .line 43
    aput-object p2, p6, p1

    .line 44
    .line 45
    const/4 p1, 0x2

    .line 46
    aput-object p5, p6, p1

    .line 47
    .line 48
    invoke-static {p6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ll/da70;

    .line 53
    .line 54
    invoke-direct {p2, p0, p3, p4}, Ll/da70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final u0(Z)V
    .locals 12

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 4
    .line 5
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    instance-of v2, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/immersionvideo/ImmersionVideoMomentDetailAct;

    .line 19
    .line 20
    const/4 v8, 0x0

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getPic()Lv/VDraweeView;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getPicFrame()Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2, v8}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getPic()Lv/VDraweeView;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v2, v3, v1}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 58
    .line 59
    invoke-static {v2}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getPicFrame()Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->n0(Lcom/p1/mobile/putong/data/User;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_0
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 73
    .line 74
    sget-object v3, Ll/uqb0;->b0:Ll/sre0;

    .line 75
    .line 76
    iget-object v3, v3, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getPicVerification()Lv/VImage;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-interface {v3, v4, v1, v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 99
    .line 100
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    const/4 v9, 0x0

    .line 107
    if-nez v3, :cond_3

    .line 108
    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 110
    .line 111
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 112
    .line 113
    const-string v4, "-10010"

    .line 114
    .line 115
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-nez v3, :cond_3

    .line 120
    .line 121
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->c:Ll/n570;

    .line 122
    .line 123
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 124
    .line 125
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v3, v4}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    goto :goto_1

    .line 132
    :cond_3
    move-object v3, v9

    .line 133
    :goto_1
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    if-eqz v4, :cond_4

    .line 138
    .line 139
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 140
    .line 141
    invoke-virtual {v4}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-eqz v4, :cond_4

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentName()Lv/VText;

    .line 148
    .line 149
    .line 150
    move-result-object v10

    .line 151
    move-object v4, v1

    .line 152
    iget-object v1, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v5, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 155
    .line 156
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 157
    .line 158
    invoke-static {v6, v2}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 163
    .line 164
    iget-object v7, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 165
    .line 166
    invoke-static {v6, v7}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v6

    .line 170
    move-object v11, v6

    .line 171
    move-object v6, v4

    .line 172
    move-object v4, v11

    .line 173
    invoke-static {v6}, Ll/cai;->a(Lcom/p1/mobile/putong/data/User;)I

    .line 174
    .line 175
    .line 176
    move-result v6

    .line 177
    invoke-static {v3}, Ll/cai;->a(Lcom/p1/mobile/putong/data/User;)I

    .line 178
    .line 179
    .line 180
    move-result v7

    .line 181
    move-object v3, v2

    .line 182
    move-object v2, v5

    .line 183
    const/4 v5, 0x1

    .line 184
    move-object v0, p0

    .line 185
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/CharSequence;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_4
    move-object v6, v1

    .line 194
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-eqz v1, :cond_6

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz v1, :cond_5

    .line 203
    .line 204
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 205
    .line 206
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-nez v1, :cond_6

    .line 213
    .line 214
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentName()Lv/VText;

    .line 215
    .line 216
    .line 217
    move-result-object v10

    .line 218
    iget-object v1, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 219
    .line 220
    iget-object v4, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 221
    .line 222
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 223
    .line 224
    invoke-static {v5, v2}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 229
    .line 230
    iget-object v7, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 231
    .line 232
    invoke-static {v5, v7}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    invoke-static {v6}, Ll/cai;->a(Lcom/p1/mobile/putong/data/User;)I

    .line 237
    .line 238
    .line 239
    move-result v6

    .line 240
    invoke-static {v3}, Ll/cai;->a(Lcom/p1/mobile/putong/data/User;)I

    .line 241
    .line 242
    .line 243
    move-result v7

    .line 244
    move-object v3, v2

    .line 245
    move-object v2, v4

    .line 246
    move-object v4, v5

    .line 247
    const/4 v5, 0x1

    .line 248
    move-object v0, p0

    .line 249
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/CharSequence;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    .line 255
    .line 256
    goto :goto_2

    .line 257
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentName()Lv/VText;

    .line 258
    .line 259
    .line 260
    move-result-object v10

    .line 261
    iget-object v1, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 262
    .line 263
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 264
    .line 265
    invoke-static {v4, v2}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-static {v6}, Ll/cai;->a(Lcom/p1/mobile/putong/data/User;)I

    .line 270
    .line 271
    .line 272
    move-result v6

    .line 273
    invoke-static {v3}, Ll/cai;->a(Lcom/p1/mobile/putong/data/User;)I

    .line 274
    .line 275
    .line 276
    move-result v7

    .line 277
    move-object v3, v2

    .line 278
    const-string v2, ""

    .line 279
    .line 280
    const-string v4, ""

    .line 281
    .line 282
    const/4 v5, 0x0

    .line 283
    move-object v0, p0

    .line 284
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/CharSequence;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    .line 290
    .line 291
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentName()Lv/VText;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 307
    .line 308
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 309
    .line 310
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentText()Lv/VText;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 318
    .line 319
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 320
    .line 321
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 322
    .line 323
    .line 324
    move-result v2

    .line 325
    const/4 v3, 0x1

    .line 326
    xor-int/2addr v2, v3

    .line 327
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 328
    .line 329
    .line 330
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 331
    .line 332
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 333
    .line 334
    const-string v2, "sticker"

    .line 335
    .line 336
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 341
    .line 342
    if-eqz v1, :cond_7

    .line 343
    .line 344
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 345
    .line 346
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Accessory;->id:Ljava/lang/String;

    .line 347
    .line 348
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 349
    .line 350
    .line 351
    move-result v2

    .line 352
    if-nez v2, :cond_8

    .line 353
    .line 354
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->b:Ll/di5;

    .line 355
    .line 356
    iget-object v2, v2, Ll/di5;->d:Ljava/util/List;

    .line 357
    .line 358
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    if-nez v2, :cond_8

    .line 363
    .line 364
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->b:Ll/di5;

    .line 365
    .line 366
    iget-object v2, v2, Ll/di5;->d:Ljava/util/List;

    .line 367
    .line 368
    new-instance v4, Ll/pa70;

    .line 369
    .line 370
    invoke-direct {v4, v1}, Ll/pa70;-><init>(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    invoke-static {v2, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    check-cast v1, Lcom/p1/mobile/putong/data/StickerInfo;

    .line 378
    .line 379
    goto :goto_3

    .line 380
    :cond_7
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 381
    .line 382
    const-string v2, "picture"

    .line 383
    .line 384
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    if-eqz v1, :cond_8

    .line 389
    .line 390
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 391
    .line 392
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 393
    .line 394
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 395
    .line 396
    .line 397
    move-result v2

    .line 398
    if-nez v2, :cond_8

    .line 399
    .line 400
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 405
    .line 406
    move-object v11, v9

    .line 407
    move-object v9, v1

    .line 408
    move-object v1, v11

    .line 409
    goto :goto_3

    .line 410
    :cond_8
    move-object v1, v9

    .line 411
    :goto_3
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result v2

    .line 415
    if-nez v2, :cond_a

    .line 416
    .line 417
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    move-result v2

    .line 421
    if-eqz v2, :cond_9

    .line 422
    .line 423
    goto :goto_4

    .line 424
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentStickerContent()Landroid/widget/RelativeLayout;

    .line 425
    .line 426
    .line 427
    move-result-object v1

    .line 428
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 429
    .line 430
    .line 431
    goto/16 :goto_8

    .line 432
    .line 433
    :cond_a
    :goto_4
    const/high16 v2, 0x41200000    # 10.0f

    .line 434
    .line 435
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 436
    .line 437
    .line 438
    move-result v4

    .line 439
    int-to-float v4, v4

    .line 440
    invoke-static {v4}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 441
    .line 442
    .line 443
    move-result-object v4

    .line 444
    sget-object v5, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 445
    .line 446
    invoke-virtual {v4, v5}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 451
    .line 452
    .line 453
    move-result-object v5

    .line 454
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 455
    .line 456
    .line 457
    move-result-object v5

    .line 458
    check-cast v5, Ll/wlj;

    .line 459
    .line 460
    invoke-virtual {v5, v4}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 461
    .line 462
    .line 463
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 464
    .line 465
    .line 466
    move-result-object v4

    .line 467
    invoke-static {v4, v2}, Ll/ezq;->b(Landroid/view/View;F)V

    .line 468
    .line 469
    .line 470
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    move-result v2

    .line 474
    if-eqz v2, :cond_b

    .line 475
    .line 476
    move-object v2, v9

    .line 477
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 478
    .line 479
    goto :goto_5

    .line 480
    :cond_b
    iget-object v2, v1, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 481
    .line 482
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    move-result-object v2

    .line 486
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 487
    .line 488
    :goto_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 489
    .line 490
    .line 491
    move-result-object v4

    .line 492
    iget-object v5, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 493
    .line 494
    invoke-static {v5}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v5

    .line 498
    invoke-virtual {v4, v5}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    invoke-static {v2, v8}, Ll/qtg;->b(Lcom/p1/mobile/putong/data/Picture;Z)Lcom/p1/mobile/putong/data/Dimension;

    .line 502
    .line 503
    .line 504
    move-result-object v2

    .line 505
    iget v4, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 506
    .line 507
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 508
    .line 509
    if-eqz v4, :cond_10

    .line 510
    .line 511
    const/high16 v5, 0x42f40000    # 122.0f

    .line 512
    .line 513
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 514
    .line 515
    .line 516
    move-result v5

    .line 517
    mul-int/2addr v2, v5

    .line 518
    div-int/2addr v2, v4

    .line 519
    const/high16 v4, 0x43570000    # 215.0f

    .line 520
    .line 521
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 522
    .line 523
    .line 524
    move-result v5

    .line 525
    if-lt v2, v5, :cond_c

    .line 526
    .line 527
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 528
    .line 529
    .line 530
    move-result v2

    .line 531
    goto :goto_6

    .line 532
    :cond_c
    const/high16 v4, 0x428a0000    # 69.0f

    .line 533
    .line 534
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 535
    .line 536
    .line 537
    move-result v5

    .line 538
    if-gt v2, v5, :cond_d

    .line 539
    .line 540
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 541
    .line 542
    .line 543
    move-result v2

    .line 544
    :cond_d
    :goto_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentStickerContent()Landroid/widget/RelativeLayout;

    .line 545
    .line 546
    .line 547
    move-result-object v4

    .line 548
    invoke-static {v4, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 549
    .line 550
    .line 551
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 552
    .line 553
    .line 554
    move-result-object v4

    .line 555
    const/high16 v5, 0x40000000    # 2.0f

    .line 556
    .line 557
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 558
    .line 559
    .line 560
    move-result v6

    .line 561
    sub-int v6, v2, v6

    .line 562
    .line 563
    invoke-static {v4, v6}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 564
    .line 565
    .line 566
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 567
    .line 568
    .line 569
    move-result v4

    .line 570
    const/high16 v6, 0x42f00000    # 120.0f

    .line 571
    .line 572
    if-eqz v4, :cond_e

    .line 573
    .line 574
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 575
    .line 576
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 577
    .line 578
    .line 579
    move-result-object v7

    .line 580
    iget-object v8, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 581
    .line 582
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 583
    .line 584
    .line 585
    move-result v6

    .line 586
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 587
    .line 588
    .line 589
    move-result v5

    .line 590
    sub-int/2addr v2, v5

    .line 591
    invoke-virtual {v4, v7, v8, v6, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 592
    .line 593
    .line 594
    goto :goto_7

    .line 595
    :cond_e
    iget-object v4, v1, Lcom/p1/mobile/putong/data/StickerInfo;->source:Lcom/p1/mobile/putong/data/StickerSourceInfo;

    .line 596
    .line 597
    const-string v7, "shanmeng"

    .line 598
    .line 599
    invoke-static {v4, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 600
    .line 601
    .line 602
    move-result v4

    .line 603
    if-eqz v4, :cond_f

    .line 604
    .line 605
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 606
    .line 607
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 608
    .line 609
    .line 610
    move-result-object v7

    .line 611
    iget-object v10, v1, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 612
    .line 613
    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 614
    .line 615
    .line 616
    move-result-object v8

    .line 617
    check-cast v8, Lcom/p1/mobile/putong/data/Picture;

    .line 618
    .line 619
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 620
    .line 621
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 622
    .line 623
    .line 624
    move-result v6

    .line 625
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 626
    .line 627
    .line 628
    move-result v5

    .line 629
    sub-int/2addr v2, v5

    .line 630
    invoke-virtual {v4, v7, v8, v6, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 631
    .line 632
    .line 633
    goto :goto_7

    .line 634
    :cond_f
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 635
    .line 636
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 637
    .line 638
    .line 639
    move-result-object v4

    .line 640
    iget-object v5, v1, Lcom/p1/mobile/putong/data/StickerInfo;->pictures:Ljava/util/List;

    .line 641
    .line 642
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 643
    .line 644
    .line 645
    move-result-object v5

    .line 646
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 647
    .line 648
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->x0(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 649
    .line 650
    .line 651
    move-result-object v5

    .line 652
    invoke-virtual {v2, v4, v5}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 653
    .line 654
    .line 655
    :cond_10
    :goto_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentStickerContent()Landroid/widget/RelativeLayout;

    .line 656
    .line 657
    .line 658
    move-result-object v2

    .line 659
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 660
    .line 661
    .line 662
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getCommentSticker()Lv/VDraweeView;

    .line 663
    .line 664
    .line 665
    move-result-object v2

    .line 666
    new-instance v3, Ll/qa70;

    .line 667
    .line 668
    invoke-direct {v3, p0, v9, v1}, Ll/qa70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;)V

    .line 669
    .line 670
    .line 671
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 672
    .line 673
    .line 674
    :goto_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getTime()Lv/VText;

    .line 675
    .line 676
    .line 677
    move-result-object v1

    .line 678
    new-instance v2, Ljava/lang/StringBuilder;

    .line 679
    .line 680
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->M(Z)Ljava/lang/String;

    .line 681
    .line 682
    .line 683
    move-result-object v3

    .line 684
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 685
    .line 686
    .line 687
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 688
    .line 689
    iget-wide v3, v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 690
    .line 691
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 692
    .line 693
    .line 694
    move-result-object v3

    .line 695
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    .line 697
    .line 698
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 699
    .line 700
    .line 701
    move-result-object v2

    .line 702
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 703
    .line 704
    .line 705
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->s0(Z)V

    .line 706
    .line 707
    .line 708
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->getReply()Lv/VText;

    .line 709
    .line 710
    .line 711
    move-result-object v1

    .line 712
    new-instance v2, Ll/ra70;

    .line 713
    .line 714
    invoke-direct {v2, p0, p1}, Ll/ra70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Z)V

    .line 715
    .line 716
    .line 717
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 718
    .line 719
    .line 720
    return-void
.end method

.method public v0(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/CharSequence;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_comment_interaction_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "moment_id"

    .line 14
    .line 15
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v2, ""

    .line 33
    .line 34
    :goto_0
    const-string v3, "comment_id"

    .line 35
    .line 36
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/w30$b;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-direct {v1, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    new-instance v3, Ll/ba70;

    .line 66
    .line 67
    invoke-direct {v3, p0}, Ll/ba70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    new-instance v3, Ll/ca70;

    .line 79
    .line 80
    invoke-direct {v3, v0}, Ll/ca70;-><init>(Ll/l4g0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    filled-new-array {p1}, [I

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    sget v2, Ll/k9c0;->o:I

    .line 106
    .line 107
    filled-new-array {v2}, [I

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, p1, v2}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v0, Ll/ea70;

    .line 116
    .line 117
    invoke-direct {v0, p0, p2}, Ll/ea70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->k:Ll/w30;

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public w0(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/CharSequence;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_comment_interaction_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "moment_id"

    .line 14
    .line 15
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v2, ""

    .line 33
    .line 34
    :goto_0
    const-string v3, "comment_id"

    .line 35
    .line 36
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/w30$b;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-direct {v1, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    new-instance v3, Ll/fa70;

    .line 66
    .line 67
    invoke-direct {v3, p0}, Ll/fa70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    new-instance v3, Ll/ga70;

    .line 75
    .line 76
    invoke-direct {v3, v0}, Ll/ga70;-><init>(Ll/l4g0;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v3}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    filled-new-array {v2}, [I

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    sget v3, Ll/k9c0;->o:I

    .line 102
    .line 103
    filled-new-array {v3}, [I

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v0, v2, v3}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v0, Ll/ha70;

    .line 116
    .line 117
    invoke-direct {v0, p0, p2}, Ll/ha70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->l:Ll/w30;

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x5

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    div-int/lit8 p0, p0, 0x4

    .line 15
    .line 16
    const-string v0, ".png"

    .line 17
    .line 18
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final y0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "all_comment_detail_item"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0, p1, v1}, Ll/at0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->D()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-static {v0, p0, p1, v1, v2}, Ll/at0;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
