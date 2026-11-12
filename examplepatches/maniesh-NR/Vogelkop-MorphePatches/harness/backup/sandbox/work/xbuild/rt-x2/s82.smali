.class public final Ls82;
.super Lase;
.source "SourceFile"


# instance fields
.field public w:Landroid/graphics/Bitmap;

.field public final x:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V
    .registers 7

    invoke-direct/range {p0 .. p6}, Lase;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V

    iget-object p1, p0, Lwbh;->f:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_20

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
    iput-object p1, p0, Ls82;->x:Landroid/net/Uri;

    return-void

    :cond_20
    new-instance p0, Ldjb;

    const-string p1, "title"

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Ls82;->x:Landroid/net/Uri;

    if-eqz v0, :cond_1d

    iget-object v1, p0, Lase;->r:Lnrl;

    iget-object v2, v1, Lnrl;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/res/Resources;

    const v3, 0x7f0707f2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const v4, 0x7f0707f5

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {v1, v0, v3, v2}, Lnrl;->l(Landroid/net/Uri;II)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1e

    :cond_1d
    const/4 v0, 0x0

    :goto_1e
    iput-object v0, p0, Ls82;->w:Landroid/graphics/Bitmap;

    return-void
.end method

.method public final i()Lzn0;
    .registers 1

    sget-object p0, Lzn0;->d:Lzn0;

    return-object p0
.end method

.method public final k()Li16;
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_24

    invoke-virtual {p0}, Lase;->d()Lua7;

    move-result-object v0

    invoke-virtual {p0}, Ls82;->x()Landroid/widget/RemoteViews;

    move-result-object p0

    new-instance v1, Li16;

    iget-object v2, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Ll1f;

    iput-object p0, v2, Ll1f;->C:Landroid/widget/RemoteViews;

    invoke-virtual {v2}, Ll1f;->b()Landroid/app/Notification;

    move-result-object p0

    iget-object v0, v0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lcm;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v0, v2}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :cond_24
    invoke-super {p0}, Lwbh;->k()Li16;

    move-result-object p0

    return-object p0
.end method

.method public final p()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final x()Landroid/widget/RemoteViews;
    .registers 5

    new-instance v0, Landroid/widget/RemoteViews;

    iget-object v1, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0d0192

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iget-object v1, p0, Ls82;->w:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Lase;->y(Landroid/widget/RemoteViews;Landroid/graphics/Bitmap;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_22

    const v1, 0x7f0a0322

    const v2, 0x7f0707f6

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setViewOutlinePreferredRadiusDimen(II)V

    :cond_22
    const-string v1, "setMaxLines"

    const/4 v2, 0x2

    const v3, 0x7f0a06c5

    invoke-virtual {v0, v3, v1, v2}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    iget-object v1, p0, Lwbh;->f:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    iget-object v1, p0, Lwbh;->g:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const v2, 0x7f0a069d

    if-eqz v1, :cond_41

    const/16 p0, 0x8

    invoke-virtual {v0, v2, p0}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    return-object v0

    :cond_41
    iget-object p0, p0, Lwbh;->g:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    return-object v0
.end method
