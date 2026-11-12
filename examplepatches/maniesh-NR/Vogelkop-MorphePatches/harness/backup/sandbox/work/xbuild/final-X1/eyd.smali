.class public final synthetic Leyd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Legd;

.field public final synthetic c:Landroid/media/MediaMetadata$Builder;

.field public final synthetic d:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lwu5;Landroid/content/Context;Legd;Landroid/media/MediaMetadata$Builder;Landroid/net/Uri;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leyd;->a:Landroid/content/Context;

    iput-object p3, p0, Leyd;->b:Legd;

    iput-object p4, p0, Leyd;->c:Landroid/media/MediaMetadata$Builder;

    iput-object p5, p0, Leyd;->d:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 14

    iget-object v0, p0, Leyd;->a:Landroid/content/Context;

    iget-object v1, p0, Leyd;->b:Legd;

    iget-object v9, p0, Leyd;->c:Landroid/media/MediaMetadata$Builder;

    new-instance v10, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v10}, Landroid/media/MediaMetadataRetriever;-><init>()V

    :try_start_b
    invoke-virtual {v1}, Legd;->c()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    const/4 v1, 0x1

    invoke-virtual {v10, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v6

    const/16 v1, 0xd

    invoke-virtual {v10, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v5

    const/4 v1, 0x2

    invoke-virtual {v10, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v4

    const/16 v1, 0x9

    invoke-virtual {v10, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v1
    :try_end_28
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_28} :catch_59
    .catchall {:try_start_b .. :try_end_28} :catchall_53

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_30

    :try_start_2c
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_30
    .catch Ljava/lang/NumberFormatException; {:try_start_2c .. :try_end_30} :catch_30
    .catch Ljava/lang/RuntimeException; {:try_start_2c .. :try_end_30} :catch_59
    .catchall {:try_start_2c .. :try_end_30} :catchall_53

    :catch_30
    :cond_30
    move-wide v7, v2

    const/4 v1, 0x7

    :try_start_32
    invoke-virtual {v10, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10}, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B

    move-result-object v1

    if-eqz v1, :cond_4d

    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget-object v11, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v11, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    array-length v11, v1

    const/4 v12, 0x0

    invoke-static {v1, v12, v11, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    :goto_4b
    move-object v3, v1

    goto :goto_4f

    :cond_4d
    const/4 v1, 0x0

    goto :goto_4b

    :goto_4f
    invoke-static/range {v2 .. v9}, Lwu5;->e(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLandroid/media/MediaMetadata$Builder;)V
    :try_end_52
    .catch Ljava/lang/RuntimeException; {:try_start_32 .. :try_end_52} :catch_59
    .catchall {:try_start_32 .. :try_end_52} :catchall_53

    goto :goto_59

    :catchall_53
    move-exception v0

    move-object p0, v0

    :try_start_55
    invoke-virtual {v10}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_58

    :catch_58
    throw p0

    :catch_59
    :goto_59
    :try_start_59
    invoke-virtual {v10}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_5c} :catch_5c

    :catch_5c
    iget-object p0, p0, Leyd;->d:Landroid/net/Uri;

    invoke-static {p0}, Lzi4;->E(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_67

    invoke-static {v0, p0, v9}, Lwu5;->d(Landroid/content/Context;Landroid/net/Uri;Landroid/media/MediaMetadata$Builder;)V

    :cond_67
    invoke-virtual {v9}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object p0

    return-object p0
.end method
