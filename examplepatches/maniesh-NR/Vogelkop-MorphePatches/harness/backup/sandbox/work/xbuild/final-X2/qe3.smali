.class public final Lqe3;
.super Lej8;
.source "SourceFile"


# instance fields
.field public final A:Ljava/lang/String;

.field public y:Landroid/graphics/Bitmap;

.field public final z:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V
    .registers 7

    invoke-direct/range {p0 .. p6}, Lej8;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V

    iget-object p1, p0, Lwbh;->f:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2a

    const-string p1, "news_icon_url"

    invoke-virtual {p4, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1c

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_1d

    :cond_1c
    const/4 p1, 0x0

    :goto_1d
    iput-object p1, p0, Lqe3;->z:Landroid/net/Uri;

    const-string p1, "news_domain"

    const-string p2, ""

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lqe3;->A:Ljava/lang/String;

    return-void

    :cond_2a
    new-instance p0, Ldjb;

    const-string p1, "title"

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lqe3;->z:Landroid/net/Uri;

    if-eqz v0, :cond_24

    iget-object v1, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x43800000    # 256.0f

    invoke-static {v3, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    int-to-float v2, v2

    const/high16 v4, 0x3f100000    # 0.5625f

    div-float/2addr v2, v4

    float-to-int v2, v2

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v3, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iget-object v3, p0, Lase;->r:Lnrl;

    invoke-virtual {v3, v0, v2, v1}, Lnrl;->l(Landroid/net/Uri;II)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_25

    :cond_24
    const/4 v0, 0x0

    :goto_25
    iput-object v0, p0, Lqe3;->y:Landroid/graphics/Bitmap;

    return-void
.end method

.method public final i()Lzn0;
    .registers 1

    sget-object p0, Lzn0;->e:Lzn0;

    return-object p0
.end method

.method public final p()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final w()Z
    .registers 5

    invoke-super {p0}, Lase;->w()Z

    move-result v0

    if-nez v0, :cond_31

    iget-object v0, p0, Lase;->t:Lcue;

    sget-object v1, Lcue;->c:Lcue;

    if-ne v0, v1, :cond_33

    iget-object v0, p0, Lase;->s:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_33

    iget-object p0, p0, Lase;->u:Lua7;

    iget-object v1, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqre;

    new-instance v2, Lrqd;

    const/16 v3, 0x12

    invoke-direct {v2, v3}, Lrqd;-><init>(B)V

    invoke-static {v1, v0, p0, v2}, Lxqe;->c(Landroid/content/Context;Ljava/lang/String;Lqre;Lwqe;)Lmsh;

    move-result-object p0

    if-eqz p0, :cond_33

    :cond_31
    const/4 p0, 0x1

    return p0

    :cond_33
    const/4 p0, 0x0

    return p0
.end method

.method public final x()Landroid/widget/RemoteViews;
    .registers 4

    new-instance v0, Landroid/widget/RemoteViews;

    iget-object v1, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0d0194

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iget-object v1, p0, Lqe3;->y:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Lase;->y(Landroid/widget/RemoteViews;Landroid/graphics/Bitmap;)V

    const v1, 0x7f0a04f9

    iget-object v2, p0, Lej8;->w:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_32

    const v1, 0x7f0a0322

    const v2, 0x7f0707f6

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setViewOutlinePreferredRadiusDimen(II)V

    const v1, 0x7f0a00af

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    :cond_32
    const v1, 0x7f0a06c5

    iget-object p0, p0, Lwbh;->f:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    return-object v0
.end method

.method public final z()Landroid/widget/RemoteViews;
    .registers 6

    new-instance v0, Landroid/widget/RemoteViews;

    iget-object v1, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0d0188

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iget-object v1, p0, Lqe3;->y:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_2e

    const v2, 0x7f0a00ce

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    const/4 v1, 0x0

    const v3, 0x7f0a01ce

    invoke-virtual {v0, v3, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v1, v4, :cond_2e

    const v1, 0x7f0707f3

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setViewOutlinePreferredRadiusDimen(II)V

    invoke-virtual {v0, v3, v1}, Landroid/widget/RemoteViews;->setViewOutlinePreferredRadiusDimen(II)V

    :cond_2e
    const v1, 0x7f0a04f9

    iget-object v2, p0, Lej8;->w:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v1, 0x7f0a044d

    iget-object v2, p0, Lwbh;->f:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v1, 0x7f0a01db

    iget-object p0, p0, Lqe3;->A:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    return-object v0
.end method
