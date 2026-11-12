.class public final Lorg/chromium/services/media_session/MediaImage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lorg/chromium/url/GURL;

.field public b:Ljava/lang/String;

.field public c:Ljava/util/List;


# direct methods
.method public static create(Lorg/chromium/url/GURL;Ljava/lang/String;[Landroid/graphics/Rect;)Lorg/chromium/services/media_session/MediaImage;
    .registers 5

    new-instance v0, Lorg/chromium/services/media_session/MediaImage;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    iput-object p0, v0, Lorg/chromium/services/media_session/MediaImage;->a:Lorg/chromium/url/GURL;

    iput-object p1, v0, Lorg/chromium/services/media_session/MediaImage;->b:Ljava/lang/String;

    iput-object p2, v0, Lorg/chromium/services/media_session/MediaImage;->c:Ljava/util/List;

    return-object v0
.end method

.method public static createRect(II)Landroid/graphics/Rect;
    .registers 4

    new-instance v0, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p1, p0, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lorg/chromium/services/media_session/MediaImage;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lorg/chromium/services/media_session/MediaImage;

    iget-object v1, p0, Lorg/chromium/services/media_session/MediaImage;->a:Lorg/chromium/url/GURL;

    iget-object v3, p1, Lorg/chromium/services/media_session/MediaImage;->a:Lorg/chromium/url/GURL;

    invoke-virtual {v1, v3}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lorg/chromium/services/media_session/MediaImage;->b:Ljava/lang/String;

    iget-object v3, p1, Lorg/chromium/services/media_session/MediaImage;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object p0, p0, Lorg/chromium/services/media_session/MediaImage;->c:Ljava/util/List;

    iget-object p1, p1, Lorg/chromium/services/media_session/MediaImage;->c:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2b

    return v0

    :cond_2b
    return v2
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lorg/chromium/services/media_session/MediaImage;->a:Lorg/chromium/url/GURL;

    iget-object v0, v0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lorg/chromium/services/media_session/MediaImage;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lorg/chromium/services/media_session/MediaImage;->c:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
