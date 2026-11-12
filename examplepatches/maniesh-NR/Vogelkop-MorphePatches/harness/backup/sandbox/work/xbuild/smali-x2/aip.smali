.class public final Laip;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/ArrayList;

.field public final c:Lwhp;

.field public d:Landroid/graphics/Bitmap;

.field public e:I

.field public f:Liy8;

.field public g:Lyhp;

.field public h:Z

.field public i:I

.field public j:[B

.field public k:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lwhp;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Laip;->b:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput v0, p0, Laip;->e:I

    iput-object p1, p0, Laip;->a:Landroid/content/Context;

    iput-object p2, p0, Laip;->c:Lwhp;

    return-void
.end method

.method public static c(Ljava/io/File;)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_27

    :try_start_3
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_8} :catch_27

    const/4 v2, 0x6

    :try_start_9
    new-array v3, v2, [B

    invoke-virtual {v1, v3, v0, v2}, Ljava/io/FileInputStream;->read([BII)I

    move-result v4
    :try_end_f
    .catchall {:try_start_9 .. :try_end_f} :catchall_1d

    if-eq v4, v2, :cond_15

    :try_start_11
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_14} :catch_27

    goto :goto_27

    :cond_15
    :try_start_15
    invoke-static {v3}, Laip;->d([B)Z

    move-result v2
    :try_end_19
    .catchall {:try_start_15 .. :try_end_19} :catchall_1d

    :try_start_19
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_27

    goto :goto_28

    :catchall_1d
    move-exception v2

    :try_start_1e
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_21
    .catchall {:try_start_1e .. :try_end_21} :catchall_22

    goto :goto_26

    :catchall_22
    move-exception v1

    :try_start_23
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_26
    throw v2
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_27} :catch_27

    :catch_27
    :cond_27
    :goto_27
    move v2, v0

    :goto_28
    if-nez v2, :cond_54

    if-eqz p0, :cond_51

    :try_start_2c
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_31} :catch_51

    const/16 p0, 0xc

    :try_start_33
    new-array v2, p0, [B

    invoke-virtual {v1, v2, v0, p0}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3
    :try_end_39
    .catchall {:try_start_33 .. :try_end_39} :catchall_47

    if-eq v3, p0, :cond_3f

    :try_start_3b
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_3b .. :try_end_3e} :catch_51

    goto :goto_51

    :cond_3f
    :try_start_3f
    invoke-static {v2}, Laip;->f([B)Z

    move-result p0
    :try_end_43
    .catchall {:try_start_3f .. :try_end_43} :catchall_47

    :try_start_43
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_46} :catch_51

    goto :goto_52

    :catchall_47
    move-exception p0

    :try_start_48
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_4c

    goto :goto_50

    :catchall_4c
    move-exception v1

    :try_start_4d
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_50
    throw p0
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_4d .. :try_end_51} :catch_51

    :catch_51
    :cond_51
    :goto_51
    move p0, v0

    :goto_52
    if-eqz p0, :cond_55

    :cond_54
    const/4 v0, 0x1

    :cond_55
    return v0
.end method

.method public static d([B)Z
    .registers 5

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x6

    if-ge v0, v2, :cond_6

    return v1

    :cond_6
    new-instance v0, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1, v2, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    const-string p0, "GIF87a"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    const-string p0, "GIF89a"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    return v1

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public static f([B)Z
    .registers 7

    array-length v0, p0

    const/16 v1, 0xc

    const/4 v2, 0x0

    if-ge v0, v1, :cond_7

    return v2

    :cond_7
    new-instance v0, Ljava/lang/String;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    const/4 v3, 0x4

    invoke-direct {v0, p0, v2, v3, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    new-instance v4, Ljava/lang/String;

    const/16 v5, 0x8

    invoke-direct {v4, p0, v5, v3, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    const-string p0, "RIFF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_28

    const-string p0, "WEBP"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_28

    const/4 p0, 0x1

    return p0

    :cond_28
    return v2
.end method


# virtual methods
.method public final a(IILjava/lang/String;)Ljava/lang/Object;
    .registers 10

    const-string v0, "MD5"

    iget-object v1, p0, Laip;->c:Lwhp;

    iget-object v2, v1, Lwhp;->e:Lvhp;

    invoke-static {v2}, Lfip;->c(Lvhp;)Lz9p;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_78

    :try_start_d
    invoke-static {p3, v0}, Ldyg;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1b

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    :cond_1b
    invoke-virtual {v3, v5}, Lz9p;->o(Ljava/lang/String;)Lgt6;

    move-result-object p3
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_1f} :catch_64
    .catch Ljava/lang/ClassCastException; {:try_start_d .. :try_end_1f} :catch_69
    .catchall {:try_start_d .. :try_end_1f} :catchall_67

    if-eqz p3, :cond_6e

    :try_start_21
    invoke-static {v2}, Lfip;->c(Lvhp;)Lz9p;

    move-result-object v2
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_25} :catch_62
    .catch Ljava/lang/ClassCastException; {:try_start_21 .. :try_end_25} :catch_6e
    .catchall {:try_start_21 .. :try_end_25} :catchall_72

    if-eqz v2, :cond_3c

    :try_start_27
    iget-object v1, v1, Lwhp;->b:Ljava/lang/String;

    invoke-static {v1, v0}, Ldyg;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_37

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :cond_37
    invoke-virtual {v2, v0}, Lz9p;->p(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_3b} :catch_3c
    .catch Ljava/lang/ClassCastException; {:try_start_27 .. :try_end_3b} :catch_6e
    .catchall {:try_start_27 .. :try_end_3b} :catchall_72

    goto :goto_3d

    :catch_3c
    :cond_3c
    move-object v0, v4

    :goto_3d
    :try_start_3d
    invoke-static {v0}, Laip;->c(Ljava/io/File;)Z

    move-result v1
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_41} :catch_62
    .catch Ljava/lang/ClassCastException; {:try_start_3d .. :try_end_41} :catch_6e
    .catchall {:try_start_3d .. :try_end_41} :catchall_72

    if-eqz v1, :cond_4e

    if-eqz v0, :cond_6e

    :try_start_45
    invoke-static {v0}, Landroid/graphics/ImageDecoder;->createSource(Ljava/io/File;)Landroid/graphics/ImageDecoder$Source;

    move-result-object p1

    invoke-static {p1}, Landroid/graphics/ImageDecoder;->decodeDrawable(Landroid/graphics/ImageDecoder$Source;)Landroid/graphics/drawable/Drawable;

    move-result-object v4
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_4d} :catch_6e
    .catch Ljava/lang/ClassCastException; {:try_start_45 .. :try_end_4d} :catch_6e
    .catchall {:try_start_45 .. :try_end_4d} :catchall_72

    goto :goto_6e

    :cond_4e
    :try_start_4e
    iget-object v0, p3, Lgt6;->b:Ljava/lang/Object;

    check-cast v0, [Ljava/io/InputStream;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    check-cast v0, Ljava/io/FileInputStream;

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lnro;->b(Ljava/io/FileDescriptor;II)Landroid/graphics/Bitmap;

    move-result-object v4
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_5f} :catch_62
    .catch Ljava/lang/ClassCastException; {:try_start_4e .. :try_end_5f} :catch_6e
    .catchall {:try_start_4e .. :try_end_5f} :catchall_72

    goto :goto_6e

    :goto_60
    move-object v4, p3

    goto :goto_74

    :catch_62
    move-exception p1

    goto :goto_6b

    :catch_64
    move-exception p1

    move-object p3, v4

    goto :goto_6b

    :catchall_67
    move-exception p0

    goto :goto_74

    :catch_69
    move-object p3, v4

    goto :goto_6e

    :goto_6b
    :try_start_6b
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    :try_end_6e
    .catchall {:try_start_6b .. :try_end_6e} :catchall_72

    :catch_6e
    :cond_6e
    :goto_6e
    invoke-static {p3}, Lr9h;->l(Ljava/io/Closeable;)V

    goto :goto_78

    :catchall_72
    move-exception p0

    goto :goto_60

    :goto_74
    invoke-static {v4}, Lr9h;->l(Ljava/io/Closeable;)V

    throw p0

    :cond_78
    :goto_78
    if-nez v4, :cond_7d

    const/4 p1, 0x1

    iput-boolean p1, p0, Laip;->h:Z

    :cond_7d
    return-object v4
.end method

.method public final b(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Laip;->c:Lwhp;

    iget-object v0, v0, Lwhp;->e:Lvhp;

    invoke-static {v0}, Lfip;->c(Lvhp;)Lz9p;

    move-result-object v0

    if-eqz v0, :cond_63

    const/4 v1, 0x0

    :try_start_b
    const-string v2, "MD5"

    invoke-static {p1, v2}, Ldyg;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1b

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    :cond_1b
    invoke-virtual {v0, v2}, Lz9p;->h(Ljava/lang/String;)Leyi;

    move-result-object p1
    :try_end_1f
    .catch Ljava/lang/IllegalStateException; {:try_start_b .. :try_end_1f} :catch_48
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_1f} :catch_41
    .catchall {:try_start_b .. :try_end_1f} :catchall_57

    if-eqz p1, :cond_3a

    :try_start_21
    invoke-virtual {p1}, Leyi;->b()Lm9p;

    move-result-object v0

    iget-object p0, p0, Laip;->j:[B

    invoke-virtual {v0, p0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v0}, Lm9p;->close()V
    :try_end_2d
    .catch Ljava/lang/IllegalStateException; {:try_start_21 .. :try_end_2d} :catch_37
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_2d} :catch_34
    .catchall {:try_start_21 .. :try_end_2d} :catchall_31

    :try_start_2d
    invoke-virtual {p1}, Leyi;->e()V
    :try_end_30
    .catch Ljava/lang/IllegalStateException; {:try_start_2d .. :try_end_30} :catch_48
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_30} :catch_41
    .catchall {:try_start_2d .. :try_end_30} :catchall_57

    goto :goto_3b

    :catchall_31
    move-exception p0

    move-object v1, p1

    goto :goto_58

    :catch_34
    move-exception p0

    move-object v1, p1

    goto :goto_42

    :catch_37
    move-exception p0

    move-object v1, p1

    goto :goto_49

    :cond_3a
    move-object v1, p1

    :goto_3b
    if-eqz v1, :cond_63

    :try_start_3d
    invoke-virtual {v1}, Leyi;->d()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_52

    return-void

    :catch_41
    move-exception p0

    :goto_42
    :try_start_42
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    if-eqz v1, :cond_63

    goto :goto_4e

    :catch_48
    move-exception p0

    :goto_49
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    :try_end_4c
    .catchall {:try_start_42 .. :try_end_4c} :catchall_57

    if-eqz v1, :cond_63

    :goto_4e
    :try_start_4e
    invoke-virtual {v1}, Leyi;->d()V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_51} :catch_52

    goto :goto_63

    :catch_52
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    goto :goto_63

    :catchall_57
    move-exception p0

    :goto_58
    if-eqz v1, :cond_62

    :try_start_5a
    invoke-virtual {v1}, Leyi;->d()V
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_5d} :catch_5e

    goto :goto_62

    :catch_5e
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    :cond_62
    :goto_62
    throw p0

    :cond_63
    :goto_63
    return-void
.end method

.method public final e()V
    .registers 4

    iget-object p0, p0, Laip;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_d
    if-ge v1, v0, :cond_1b

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lzhp;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_d

    :cond_1b
    return-void
.end method

.method public final g()V
    .registers 9

    sget-object v0, Lgxo;->c:Lgxo;

    iget-object v0, p0, Laip;->c:Lwhp;

    iget v1, v0, Lwhp;->d:I

    iget v2, v0, Lwhp;->c:I

    const/4 v3, 0x0

    iput-object v3, p0, Laip;->f:Liy8;

    iput-object v3, p0, Laip;->g:Lyhp;

    iget-boolean v3, p0, Laip;->h:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object v6, p0, Laip;->b:Ljava/util/ArrayList;

    if-eqz v3, :cond_31

    iput-boolean v4, p0, Laip;->h:Z

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_31

    sget-object v1, Lfip;->d:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Laip;->e()V

    sget-boolean p0, Lfip;->f:Z

    if-nez p0, :cond_a4

    sput-boolean v5, Lfip;->f:Z

    sget-object p0, Lfip;->h:Lkoj;

    invoke-static {p0}, Lgxo;->c(Ljava/lang/Runnable;)V

    return-void

    :cond_31
    sget-object v3, Lfip;->a:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Laip;->d:Landroid/graphics/Bitmap;

    if-nez v0, :cond_5c

    iget-object v0, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_73

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    iget-object v0, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    iget-object v0, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    mul-int/lit8 v0, v0, 0x64

    iget-object v3, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    :goto_54
    mul-int/2addr v3, v0

    mul-int/2addr v2, v1

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    div-int/2addr v3, v0

    goto :goto_73

    :cond_5c
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    iget-object v0, p0, Laip;->d:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    iget-object v0, p0, Laip;->d:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    mul-int/lit8 v0, v0, 0x64

    iget-object v3, p0, Laip;->d:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    goto :goto_54

    :cond_73
    :goto_73
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a4

    iget-object v0, p0, Laip;->d:Landroid/graphics/Bitmap;

    iget-object v1, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v4

    :goto_85
    if-ge v3, v2, :cond_a1

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Lzhp;

    iget-object v7, p0, Laip;->d:Landroid/graphics/Bitmap;

    if-nez v7, :cond_9d

    iget-object v7, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    if-nez v7, :cond_9d

    iget v7, p0, Laip;->e:I

    invoke-interface {v5, v7}, Lzhp;->a(I)V

    goto :goto_85

    :cond_9d
    invoke-interface {v5, v0, v1, v4}, Lzhp;->b(Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Z)V

    goto :goto_85

    :cond_a1
    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    :cond_a4
    return-void
.end method
