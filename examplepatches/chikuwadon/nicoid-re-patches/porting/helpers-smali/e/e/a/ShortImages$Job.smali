.class final Le/e/a/ShortImages$Job;
.super Ljava/lang/Object;
.source "ShortImages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ShortImages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Job"
.end annotation


# instance fields
.field final disk:Le/e/a/ImageDiskCache;

.field final subscribers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/ShortImages$Subscription;",
            ">;"
        }
    .end annotation
.end field

.field final task:Le/e/a/NetworkTask;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Le/e/a/ImageDiskCache;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "disk"    # Le/e/a/ImageDiskCache;

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    .line 84
    iput-object p1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    return-void
.end method

.method private fetch()[B
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 113
    .local v0, "c":Ljava/net/HttpURLConnection;
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_17

    return-object v2

    .line 115
    :cond_17
    const/16 v1, 0x1770

    :try_start_19
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v1, "User-Agent"

    const-string v3, "nicoid Re/1.0"

    invoke-virtual {v0, v1, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v1
    :try_end_2a
    .catchall {:try_start_19 .. :try_end_2a} :catchall_9d

    const/high16 v3, 0x800000

    if-le v1, v3, :cond_37

    .line 125
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 116
    return-object v2

    .line 117
    :cond_37
    :try_start_37
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_3b
    .catchall {:try_start_37 .. :try_end_3b} :catchall_9d

    .local v1, "in":Ljava/io/InputStream;
    :try_start_3b
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_40
    .catchall {:try_start_3b .. :try_end_40} :catchall_91

    .line 118
    .local v4, "bytes":Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x2000

    :try_start_42
    new-array v5, v5, [B

    .line 119
    .local v5, "buffer":[B
    :goto_44
    invoke-virtual {v1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move v7, v6

    .local v7, "n":I
    const/4 v8, -0x1

    if-eq v6, v8, :cond_72

    .line 120
    iget-object v6, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v6}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v6

    if-nez v6, :cond_61

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v7

    if-le v6, v3, :cond_5c

    goto :goto_61

    .line 121
    :cond_5c
    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_60
    .catchall {:try_start_42 .. :try_end_60} :catchall_87

    goto :goto_44

    .line 124
    :cond_61
    :goto_61
    :try_start_61
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_64
    .catchall {:try_start_61 .. :try_end_64} :catchall_91

    if-eqz v1, :cond_69

    :try_start_66
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_69
    .catchall {:try_start_66 .. :try_end_69} :catchall_9d

    .line 125
    :cond_69
    iget-object v3, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v3, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 120
    return-object v2

    .line 123
    .end local v7    # "n":I
    :cond_72
    :try_start_72
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2
    :try_end_76
    .catchall {:try_start_72 .. :try_end_76} :catchall_87

    .line 124
    :try_start_76
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_79
    .catchall {:try_start_76 .. :try_end_79} :catchall_91

    if-eqz v1, :cond_7e

    :try_start_7b
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7e
    .catchall {:try_start_7b .. :try_end_7e} :catchall_9d

    .line 125
    :cond_7e
    iget-object v3, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v3, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 123
    return-object v2

    .line 117
    .end local v5    # "buffer":[B
    :catchall_87
    move-exception v2

    :try_start_88
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_8b
    .catchall {:try_start_88 .. :try_end_8b} :catchall_8c

    goto :goto_90

    :catchall_8c
    move-exception v3

    :try_start_8d
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "c":Ljava/net/HttpURLConnection;
    .end local v1    # "in":Ljava/io/InputStream;
    :goto_90
    throw v2
    :try_end_91
    .catchall {:try_start_8d .. :try_end_91} :catchall_91

    .end local v4    # "bytes":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "c":Ljava/net/HttpURLConnection;
    .restart local v1    # "in":Ljava/io/InputStream;
    :catchall_91
    move-exception v2

    if-eqz v1, :cond_9c

    :try_start_94
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_97
    .catchall {:try_start_94 .. :try_end_97} :catchall_98

    goto :goto_9c

    :catchall_98
    move-exception v3

    :try_start_99
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "c":Ljava/net/HttpURLConnection;
    :cond_9c
    :goto_9c
    throw v2
    :try_end_9d
    .catchall {:try_start_99 .. :try_end_9d} :catchall_9d

    .line 125
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "c":Ljava/net/HttpURLConnection;
    :catchall_9d
    move-exception v1

    iget-object v2, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v1
.end method


# virtual methods
.method synthetic lambda$run$0$e-e-a-ShortImages$Job(Landroid/graphics/Bitmap;)V
    .registers 8
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .line 98
    # getter for: Le/e/a/ShortImages;->jobs:Ljava/util/Map;
    invoke-static {}, Le/e/a/ShortImages;->access$400()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_d

    return-void

    :cond_d
    # getter for: Le/e/a/ShortImages;->jobs:Ljava/util/Map;
    invoke-static {}, Le/e/a/ShortImages;->access$400()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    iget-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ShortImages$Subscription;

    .line 100
    .local v1, "subscriber":Le/e/a/ShortImages$Subscription;
    iget-object v2, v1, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .local v2, "target":Landroid/widget/ImageView;
    iget-object v3, v1, Le/e/a/ShortImages$Subscription;->placeholder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 101
    .local v3, "placeholder":Landroid/widget/TextView;
    if-eqz v2, :cond_5d

    .line 102
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 103
    iget-object v4, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v4}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v4

    if-nez v4, :cond_5d

    if-eqz p1, :cond_5d

    iget-object v4, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 104
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    if-eqz v3, :cond_5d

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 107
    .end local v1    # "subscriber":Le/e/a/ShortImages$Subscription;
    .end local v2    # "target":Landroid/widget/ImageView;
    .end local v3    # "placeholder":Landroid/widget/TextView;
    :cond_5d
    goto :goto_1c

    .line 108
    :cond_5e
    iget-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 109
    return-void
.end method

.method run()V
    .registers 5

    .line 86
    const/4 v0, 0x0

    .line 88
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v1, 0x0

    .local v1, "encoded":[B
    :try_start_2
    iget-object v2, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v3, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Le/e/a/ImageDiskCache;->get(Ljava/lang/String;)[B

    move-result-object v2
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_a} :catch_e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_a} :catch_c

    move-object v1, v2

    goto :goto_f

    .line 95
    .end local v1    # "encoded":[B
    :catch_c
    move-exception v1

    goto :goto_5d

    .line 88
    .restart local v1    # "encoded":[B
    :catch_e
    move-exception v2

    .line 89
    :goto_f
    if-eqz v1, :cond_21

    :try_start_11
    # invokes: Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;
    invoke-static {v1}, Le/e/a/ShortImages;->access$100([B)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_15} :catch_c

    move-object v0, v2

    if-nez v0, :cond_21

    :try_start_18
    iget-object v2, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v3, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Le/e/a/ImageDiskCache;->remove(Ljava/lang/String;)V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1f} :catch_20
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1f} :catch_c

    goto :goto_21

    :catch_20
    move-exception v2

    .line 90
    :cond_21
    :goto_21
    if-nez v0, :cond_4a

    :try_start_23
    iget-object v2, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_4a

    .line 91
    invoke-direct {p0}, Le/e/a/ShortImages$Job;->fetch()[B

    move-result-object v2

    move-object v1, v2

    .line 92
    if-eqz v1, :cond_4a

    iget-object v2, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_4a

    # invokes: Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;
    invoke-static {v1}, Le/e/a/ShortImages;->access$100([B)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_3e} :catch_c

    move-object v0, v2

    if-eqz v0, :cond_4a

    :try_start_41
    iget-object v2, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v3, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Le/e/a/ImageDiskCache;->put(Ljava/lang/String;[B)V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_48} :catch_49
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_48} :catch_c

    goto :goto_4a

    :catch_49
    move-exception v2

    .line 94
    :cond_4a
    :goto_4a
    if-eqz v0, :cond_5d

    :try_start_4c
    iget-object v2, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_5d

    # getter for: Le/e/a/ShortImages;->memory:Landroid/util/LruCache;
    invoke-static {}, Le/e/a/ShortImages;->access$200()Landroid/util/LruCache;

    move-result-object v2

    iget-object v3, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_5d} :catch_c

    .line 95
    .end local v1    # "encoded":[B
    :cond_5d
    :goto_5d
    nop

    .line 96
    move-object v1, v0

    .line 97
    .local v1, "result":Landroid/graphics/Bitmap;
    # getter for: Le/e/a/ShortImages;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ShortImages;->access$300()Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Le/e/a/ShortImages$Job$0;

    invoke-direct {v3, p0, v1}, Le/e/a/ShortImages$Job$0;-><init>(Le/e/a/ShortImages$Job;Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 110
    return-void
.end method
