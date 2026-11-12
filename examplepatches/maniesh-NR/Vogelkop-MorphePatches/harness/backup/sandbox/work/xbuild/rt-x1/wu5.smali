.class public final Lwu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La47;
.implements Lch7;
.implements Lcs9;
.implements Lo9d;
.implements Lqye;


# static fields
.field public static a:Lhr5;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Landroid/content/Context;Landroid/net/Uri;Landroid/media/MediaMetadata$Builder;)V
    .registers 7

    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->normalizeScheme()Landroid/net/Uri;

    move-result-object p1

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance p1, Lbkh;

    invoke-direct {p1, p0}, Lbkh;-><init>(Ljava/io/File;)V

    goto :goto_23

    :cond_1f
    invoke-static {p0, p1}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object p1

    :goto_23
    invoke-virtual {p1}, Ldd7;->j()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-lez p0, :cond_32

    const-string p0, "com.opera.android.media.FILE_LENGTH"

    invoke-virtual {p2, p0, v0, v1}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;

    :cond_32
    invoke-virtual {p1}, Ldd7;->h()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_41

    const-string p1, "com.opera.android.media.FILE_TYPE"

    invoke-virtual {p2, p1, p0}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;
    :try_end_41
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_41} :catch_41

    :catch_41
    :cond_41
    return-void
.end method

.method public static e(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLandroid/media/MediaMetadata$Builder;)V
    .registers 9

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "android.media.metadata.TITLE"

    invoke-virtual {p7, v0, p0}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    :cond_b
    if-eqz p1, :cond_12

    const-string p0, "android.media.metadata.ART"

    invoke-virtual {p7, p0, p1}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    :cond_12
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1d

    const-string p0, "android.media.metadata.ARTIST"

    invoke-virtual {p7, p0, p2}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    :cond_1d
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_28

    const-string p0, "android.media.metadata.ALBUM_ARTIST"

    invoke-virtual {p7, p0, p3}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    :cond_28
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_33

    const-string p0, "android.media.metadata.ALBUM"

    invoke-virtual {p7, p0, p4}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    :cond_33
    const-wide/16 p0, 0x0

    cmp-long p0, p5, p0

    if-lez p0, :cond_3e

    const-string p0, "android.media.metadata.DURATION"

    invoke-virtual {p7, p0, p5, p6}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;

    :cond_3e
    return-void
.end method

.method public static f(Ljava/lang/String;)Lf7h;
    .registers 4

    sget-object v0, Lf7h;->c:Lf7h;

    const-string v1, "http/1.0"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    return-object v0

    :cond_b
    sget-object v0, Lf7h;->d:Lf7h;

    const-string v1, "http/1.1"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    return-object v0

    :cond_16
    sget-object v0, Lf7h;->g:Lf7h;

    const-string v1, "h2_prior_knowledge"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    return-object v0

    :cond_21
    sget-object v0, Lf7h;->f:Lf7h;

    const-string v1, "h2"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c

    return-object v0

    :cond_2c
    sget-object v0, Lf7h;->e:Lf7h;

    const-string v1, "spdy/3.1"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_37

    return-object v0

    :cond_37
    sget-object v0, Lf7h;->h:Lf7h;

    const-string v1, "quic"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    return-object v0

    :cond_42
    sget-object v0, Lf7h;->i:Lf7h;

    const-string v1, "h3"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_4e

    return-object v0

    :cond_4e
    const-string v0, "Unexpected protocol: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static h(Ljava/lang/String;)Le9i;
    .registers 4

    sget-object v0, Le9i;->h:Lh58;

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Le9i;

    iget-object v2, v2, Le9i;->a:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x0

    :goto_1d
    check-cast v1, Le9i;

    if-nez v1, :cond_2c

    sget-object p0, Le9i;->h:Lh58;

    sget-object v0, Luih;->a:Ltih;

    invoke-static {p0, v0}, Lkotlin/collections/CollectionsKt;->X(Ljava/util/Collection;Ltih;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le9i;

    return-object p0

    :cond_2c
    return-object v1
.end method

.method public static i(Lj2b;)Lj2b;
    .registers 5

    sget-object v0, Lj2b;->f:Lh58;

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lj2b;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    if-ne v2, v3, :cond_6

    goto :goto_21

    :cond_20
    const/4 v1, 0x0

    :goto_21
    check-cast v1, Lj2b;

    return-object v1
.end method

.method public static j(Ljava/util/ArrayList;Ljava/lang/StringBuilder;)V
    .registers 8

    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ldjh;->h(Lkotlin/ranges/IntRange;I)Lkotlin/ranges/a;

    move-result-object v0

    iget v1, v0, Lkotlin/ranges/a;->a:I

    iget v2, v0, Lkotlin/ranges/a;->b:I

    iget v0, v0, Lkotlin/ranges/a;->c:I

    if-lez v0, :cond_18

    if-le v1, v2, :cond_1c

    :cond_18
    if-gez v0, :cond_42

    if-gt v2, v1, :cond_42

    :cond_1c
    :goto_1c
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-lez v1, :cond_31

    const/16 v5, 0x26

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_31
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_3e

    const/16 v3, 0x3d

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3e
    if-eq v1, v2, :cond_42

    add-int/2addr v1, v0

    goto :goto_1c

    :cond_42
    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    return-void
.end method

.method public final b(Lzg3;Landroid/graphics/Bitmap;)V
    .registers 3

    return-void
.end method

.method public final c(Ljava/lang/Object;)[Ljava/lang/String;
    .registers 2

    const-string p0, "data"

    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p1, p0}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final g(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 3

    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final k(Landroid/app/assist/AssistStructure$ViewNode;)Lnf2;
    .registers 6

    invoke-virtual {p1}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillHints()[Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_2e

    array-length v0, p0

    const/4 v1, 0x0

    :goto_9
    if-ge v1, v0, :cond_26

    aget-object v2, p0, v1

    sget-object v3, Lls2;->a:Lu9d;

    if-eqz v2, :cond_20

    invoke-static {v2}, Lt0h;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_20

    sget-object v3, Lls2;->a:Lu9d;

    invoke-virtual {v3, v2}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lks2;

    goto :goto_21

    :cond_20
    move-object v2, p1

    :goto_21
    if-nez v2, :cond_27

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_26
    move-object v2, p1

    :cond_27
    if-eqz v2, :cond_2e

    invoke-interface {v2}, Lks2;->d()Lnf2;

    move-result-object p0

    return-object p0

    :cond_2e
    return-object p1
.end method

.method public final l(Ludg;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p1, Ludg;->I:Ljava/lang/String;

    return-object p0
.end method

.method public final m(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final y(Lkotlin/jvm/functions/Function1;)V
    .registers 2

    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result p0

    if-eqz p0, :cond_9

    sget-object p0, Lz37;->b:Lz37;

    goto :goto_b

    :cond_9
    sget-object p0, Lz37;->a:Lz37;

    :goto_b
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
