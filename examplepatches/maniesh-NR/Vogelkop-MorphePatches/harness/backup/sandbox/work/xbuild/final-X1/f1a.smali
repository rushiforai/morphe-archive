.class public final Lf1a;
.super Ll6e;
.source "SourceFile"


# instance fields
.field public final l:Li6e;

.field public final m:Li6e;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILi6e;Li6e;)V
    .registers 9

    move-object v0, p2

    move-object p2, p1

    move p1, p5

    move-object p5, p4

    move-object p4, p3

    move-object p3, v0

    invoke-direct/range {p0 .. p5}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p6, p0, Lf1a;->l:Li6e;

    iput-object p7, p0, Lf1a;->m:Li6e;

    return-void
.end method


# virtual methods
.method public final a(ILp6l;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    invoke-super {p0, p1, p2, p3}, Ll6e;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "#{OPRClient}"

    invoke-virtual {p3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9f

    iget-object p0, p0, Lf1a;->m:Li6e;

    invoke-virtual {p0}, Li6e;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh1a;

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const-string v1, "android-ofa-ntp-re"

    if-eqz p1, :cond_7c

    const/4 v2, 0x2

    if-eq p1, v2, :cond_84

    packed-switch p1, :pswitch_data_a0

    goto :goto_84

    :pswitch_24
    invoke-virtual {p0}, Lh1a;->k()Ljava/lang/String;

    move-result-object p0

    const-string p1, "android-ofa-msw-re"

    invoke-static {p0, p1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_84

    :pswitch_2f
    sget-object p1, Lp6l;->b:Lp6l;

    if-ne p2, p1, :cond_3f

    invoke-virtual {p0}, Lh1a;->d()Ljava/lang/String;

    move-result-object p0

    const-string p1, "android-ofa-nep-pr"

    invoke-static {p0, p1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_3d
    move-object v1, p0

    goto :goto_84

    :cond_3f
    invoke-virtual {p0}, Lh1a;->e()Ljava/lang/String;

    move-result-object p0

    const-string p1, "android-ofa-nep-re"

    invoke-static {p0, p1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3d

    :pswitch_4a
    sget-object p1, Lp6l;->b:Lp6l;

    if-ne p2, p1, :cond_59

    invoke-virtual {p0}, Lh1a;->a()Ljava/lang/String;

    move-result-object p0

    const-string p1, "android-ofa-cm-pr"

    invoke-static {p0, p1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3d

    :cond_59
    invoke-virtual {p0}, Lh1a;->b()Ljava/lang/String;

    move-result-object p0

    const-string p1, "android-ofa-cm-re"

    invoke-static {p0, p1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3d

    :pswitch_64
    sget-object p1, Lp6l;->b:Lp6l;

    if-ne p2, p1, :cond_73

    invoke-virtual {p0}, Lh1a;->g()Ljava/lang/String;

    move-result-object p0

    const-string p1, "android-ofa-ntp-pr"

    invoke-static {p0, p1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3d

    :cond_73
    invoke-virtual {p0}, Lh1a;->h()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3d

    :cond_7c
    :pswitch_7c
    invoke-virtual {p0}, Lh1a;->f()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_84
    :goto_84
    new-instance p0, Ljava/lang/StringBuilder;

    const/4 p1, 0x0

    invoke-virtual {p3, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0xc

    invoke-virtual {p3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9f
    return-object p3

    :pswitch_data_a0
    .packed-switch 0x4
        :pswitch_64
        :pswitch_64
        :pswitch_7c
        :pswitch_4a
        :pswitch_2f
        :pswitch_24
    .end packed-switch
.end method

.method public final c()Z
    .registers 1

    iget-object p0, p0, Lf1a;->l:Li6e;

    invoke-virtual {p0}, Li6e;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final g([BLandroid/util/Size;Landroid/util/Size;Ljava/lang/String;)Llsc;
    .registers 11

    const-string p0, "https://lens.google.com/upload"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string p4, "ep"

    const-string v0, "ocm"

    invoke-virtual {p0, p4, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p4

    invoke-static {p4}, Lsfe;->b0(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p4

    const-string v0, "hl"

    invoke-virtual {p0, v0, p4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    move-result p4

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p4

    const-string v0, "vpw"

    invoke-virtual {p0, v0, p4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    move-result p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    const-string p4, "vph"

    invoke-virtual {p0, p4, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    const-string p4, "st"

    invoke-virtual {p0, p4, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p3

    new-instance p4, Lg54;

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p3, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-direct {p4, v0}, Lg54;-><init>([B)V

    iput-object p3, p4, Lg54;->c:Ljava/lang/String;

    sget-object p3, Lsce;->e:Lesd;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    sget-object v0, Lsce;->e:Lesd;

    iget-object v1, v0, Lesd;->b:Ljava/lang/String;

    const-string v2, "multipart"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_da

    sget-object v1, Lrvh;->Companion:Lqvh;

    sget-object v3, Lesd;->e:Lkotlin/text/Regex;

    const-string v3, "image/jpeg"

    invoke-static {v3}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v3

    const/4 v4, 0x6

    const/4 v5, 0x0

    invoke-static {v1, p1, v3, v5, v4}, Lqvh;->d(Lqvh;[BLesd;II)Lpvh;

    move-result-object p1

    const-string v3, "encoded_image"

    invoke-static {v3, v2, p1}, Lw7d;->l(Ljava/lang/String;Ljava/lang/String;Lrvh;)Lrce;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result p1

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result p2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1, v2}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object p1

    const-string p2, "processed_image_dimensions"

    invoke-static {p2, v2, p1}, Lw7d;->l(Ljava/lang/String;Ljava/lang/String;Lrvh;)Lrce;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_d4

    new-instance p1, Lsce;

    invoke-static {p3}, Lokhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    invoke-direct {p1, p4, v0, p2}, Lsce;-><init>(Lg54;Lesd;Ljava/util/List;)V

    new-instance p2, Llsc;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0, v5}, Lksc;-><init>(Ljava/lang/String;I)V

    invoke-static {p2, p1}, Ll6e;->o(Llsc;Lsce;)Llsc;

    move-result-object p0

    return-object p0

    :cond_d4
    const-string p0, "Multipart body must have at least one part."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_da
    const-string p0, "multipart != "

    invoke-static {v0, p0}, Lodf;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v2
.end method

.method public final m()I
    .registers 1

    const/16 p0, 0x3e8

    return p0
.end method

.method public final n(Lpqk;)Lh6e;
    .registers 6

    new-instance v0, Le1a;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Le1a;-><init>(Lpqk;IB)V

    new-instance v1, Ld1a;

    invoke-direct {v1, p0, p1}, Ld1a;-><init>(Lf1a;Lpqk;)V

    new-instance p0, Le1a;

    const/4 v3, 0x1

    invoke-direct {p0, p1, v2, v3}, Le1a;-><init>(Lpqk;IB)V

    iput-object p0, v1, Lh6e;->b:Ljava/lang/Object;

    iput-object v1, v0, Lh6e;->b:Ljava/lang/Object;

    return-object v0
.end method
