.class public final Lcom/opera/android/siteicons/URLColorTable;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;
    }
.end annotation


# direct methods
.method public static a(Ljava/lang/String;)Loa5;
    .registers 5

    invoke-static {p0}, LJ/N;->MKfNycY4(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;

    iget-boolean v1, v0, Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;->b:Z

    if-eqz v1, :cond_45

    invoke-static {p0}, Llah;->h(Ljava/lang/String;)Lanj;

    move-result-object v1

    iget-object v1, v1, Lanj;->b:Ljava/lang/String;

    sget-object v2, Laik;->a:[Ljava/lang/String;

    invoke-static {p0, v2}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_45

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_45

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v0, v3

    const/4 v3, 0x0

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LJ/N;->MKfNycY4(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;

    :cond_45
    iget-object p0, v0, Lcom/opera/android/siteicons/URLColorTable$NativeColorResult;->a:Loa5;

    return-object p0
.end method

.method public static getDataTable()[B
    .registers 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    :try_start_0
    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "lut_pruned.bin"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v1

    if-lez v1, :cond_1c

    instance-of v2, v0, Landroid/content/res/AssetManager$AssetInputStream;

    if-eqz v2, :cond_1c

    new-array v1, v1, [B

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    return-object v1

    :cond_1c
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-static {v0, v2}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_28} :catch_29

    return-object v0

    :catch_29
    const/4 v0, 0x0

    new-array v0, v0, [B

    return-object v0
.end method
