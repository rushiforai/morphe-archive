.class public final Lcom/opera/android/autofill/AffiliateHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lx40;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lx40;

    const-string v1, ""

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lx40;-><init>(Lorg/chromium/url/GURL;Ljava/lang/String;)V

    sput-object v0, Lcom/opera/android/autofill/AffiliateHelper;->a:Lx40;

    return-void
.end method

.method public static a(Landroid/graphics/drawable/Drawable;)Lorg/chromium/url/GURL;
    .registers 6

    const-string v0, "data:image/webp;base64,"

    const/16 v1, 0x40

    invoke-static {p0, v1, v1}, Lz5i;->x(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object p0

    const/4 v1, 0x0

    if-nez p0, :cond_c

    return-object v1

    :cond_c
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_11
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x32

    invoke-virtual {p0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    new-instance p0, Lorg/chromium/url/GURL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    const/4 v2, 0x2

    invoke-static {v0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_35} :catch_36

    return-object p0

    :catch_36
    return-object v1
.end method

.method public static lookup(JJLjava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lvml;->d:Lumi;

    new-instance v1, Lxj;

    const/4 v2, 0x5

    invoke-direct {v1, p4, p5, v2}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p4

    new-instance p5, Lw40;

    invoke-direct {p5, p0, p1, p2, p3}, Lw40;-><init>(JJ)V

    invoke-virtual {v0, p5}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p4, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p4, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
