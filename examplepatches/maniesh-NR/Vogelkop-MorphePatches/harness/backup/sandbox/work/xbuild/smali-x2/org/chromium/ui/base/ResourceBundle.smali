.class public final Lorg/chromium/ui/base/ResourceBundle;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:[Ljava/lang/String;


# direct methods
.method public static a(ILjava/lang/String;)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_12

    const/4 v0, 0x2

    if-eq p0, v0, :cond_f

    const/4 v0, 0x3

    if-eq p0, v0, :cond_c

    const-string p0, ""

    goto :goto_14

    :cond_c
    const-string p0, "_NEUTER"

    goto :goto_14

    :cond_f
    const-string p0, "_MASCULINE"

    goto :goto_14

    :cond_12
    const-string p0, "_FEMININE"

    :goto_14
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getLocalePakResourcePath(Ljava/lang/String;IZZ)Ljava/lang/String;
    .registers 7

    sget-object v0, Lorg/chromium/ui/base/ResourceBundle;->a:[Ljava/lang/String;

    if-eqz v0, :cond_cc

    invoke-static {v0, p0}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_cc

    if-eqz p2, :cond_6e

    const-string p2, "en-US"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_17

    const-string p2, "assets/fallback-locales/"

    goto :goto_70

    :cond_17
    const/16 p2, 0x2d

    invoke-virtual {p0, p2}, Ljava/lang/String;->indexOf(I)I

    move-result p2

    const/4 v0, 0x0

    if-gez p2, :cond_22

    move-object p2, p0

    goto :goto_26

    :cond_22
    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    :goto_26
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, -0x1

    sparse-switch v1, :sswitch_data_ce

    goto :goto_55

    :sswitch_2f
    const-string v0, "fil"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    const/4 v0, 0x3

    goto :goto_56

    :sswitch_39
    const-string v0, "yi"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    const/4 v0, 0x2

    goto :goto_56

    :sswitch_43
    const-string v0, "id"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    const/4 v0, 0x1

    goto :goto_56

    :sswitch_4d
    const-string v1, "he"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_56

    :cond_55
    :goto_55
    move v0, v2

    :cond_56
    :goto_56
    packed-switch v0, :pswitch_data_e0

    goto :goto_65

    :pswitch_5a
    const-string p2, "tl"

    goto :goto_65

    :pswitch_5d
    const-string p2, "ji"

    goto :goto_65

    :pswitch_60
    const-string p2, "in"

    goto :goto_65

    :pswitch_63
    const-string p2, "iw"

    :goto_65
    const-string v0, "assets/locales#lang_"

    const-string v1, "/"

    invoke-static {v0, p2, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_70

    :cond_6e
    const-string p2, "assets/stored-locales/"

    :goto_70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/chromium/ui/base/ResourceBundle;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".pak"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "op/"

    invoke-static {p2, v2, p0, v1}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v2, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    :try_start_92
    invoke-virtual {v2, p2}, Landroid/content/res/AssetManager;->openNonAssetFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p2

    if-eqz p2, :cond_9b

    invoke-virtual {p2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_9b
    .catch Ljava/io/IOException; {:try_start_92 .. :try_end_9b} :catch_9c

    :cond_9b
    return-object v0

    :catch_9c
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "assets/locales/"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lorg/chromium/ui/base/ResourceBundle;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "assets/locales/op/"

    invoke-static {p2, p0, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object p2, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p2

    :try_start_be
    invoke-virtual {p2, p0}, Landroid/content/res/AssetManager;->openNonAssetFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0

    if-eqz p0, :cond_c7

    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_c7
    .catch Ljava/io/IOException; {:try_start_be .. :try_end_c7} :catch_c8

    :cond_c7
    return-object p1

    :catch_c8
    if-eqz p3, :cond_cc

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    :cond_cc
    const/4 p0, 0x0

    return-object p0

    :sswitch_data_ce
    .sparse-switch
        0xcfd -> :sswitch_4d
        0xd1b -> :sswitch_43
        0xf10 -> :sswitch_39
        0x18c09 -> :sswitch_2f
    .end sparse-switch

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_63
        :pswitch_60
        :pswitch_5d
        :pswitch_5a
    .end packed-switch
.end method
