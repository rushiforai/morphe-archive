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

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    .line 103
    iput-object p1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    return-void
.end method

.method private fetch()[B
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 134
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_17

    return-object v2

    .line 136
    :cond_17
    const/16 v1, 0x1770

    :try_start_19
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v1, "User-Agent"

    const-string v3, "nicoid Re/1.0"

    invoke-virtual {v0, v1, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v1
    :try_end_2a
    .catchall {:try_start_19 .. :try_end_2a} :catchall_a6

    const/high16 v3, 0x800000

    if-le v1, v3, :cond_37

    .line 146
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 137
    return-object v2

    .line 138
    :cond_37
    :try_start_37
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_3b
    .catchall {:try_start_37 .. :try_end_3b} :catchall_9c

    :try_start_3b
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_40
    .catchall {:try_start_3b .. :try_end_40} :catchall_8c

    .line 139
    const/16 v5, 0x2000

    :try_start_42
    new-array v5, v5, [B

    .line 140
    nop

    :goto_45
    invoke-virtual {v1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_61

    .line 144
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_50
    .catchall {:try_start_42 .. :try_end_50} :catchall_87

    .line 145
    :try_start_50
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_53
    .catchall {:try_start_50 .. :try_end_53} :catchall_8c

    if-eqz v1, :cond_58

    :try_start_55
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_58
    .catchall {:try_start_55 .. :try_end_58} :catchall_9c

    .line 146
    :cond_58
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 144
    return-object v3

    .line 141
    :cond_61
    :try_start_61
    iget-object v7, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v7}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v7

    if-nez v7, :cond_76

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    add-int/2addr v7, v6

    if-le v7, v3, :cond_71

    goto :goto_76

    .line 142
    :cond_71
    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_75
    .catchall {:try_start_61 .. :try_end_75} :catchall_87

    goto :goto_45

    .line 145
    :cond_76
    :goto_76
    :try_start_76
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_79
    .catchall {:try_start_76 .. :try_end_79} :catchall_8c

    if-eqz v1, :cond_7e

    :try_start_7b
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7e
    .catchall {:try_start_7b .. :try_end_7e} :catchall_9c

    .line 146
    :cond_7e
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 141
    return-object v2

    .line 144
    :catchall_87
    move-exception v2

    .line 145
    :try_start_88
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v2
    :try_end_8c
    .catchall {:try_start_88 .. :try_end_8c} :catchall_8c

    :catchall_8c
    move-exception v3

    if-nez v2, :cond_91

    move-object v2, v3

    goto :goto_96

    :cond_91
    if-eq v2, v3, :cond_96

    :try_start_93
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_96
    :goto_96
    if-eqz v1, :cond_9b

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_9b
    throw v2
    :try_end_9c
    .catchall {:try_start_93 .. :try_end_9c} :catchall_9c

    :catchall_9c
    move-exception v1

    if-eqz v2, :cond_a5

    if-eq v2, v1, :cond_a4

    :try_start_a1
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a4
    move-object v1, v2

    :cond_a5
    throw v1
    :try_end_a6
    .catchall {:try_start_a1 .. :try_end_a6} :catchall_a6

    .line 146
    :catchall_a6
    move-exception v1

    iget-object v2, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v1
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-ShortImages$Job(Landroid/graphics/Bitmap;)V
    .registers 8

    .line 117
    # getter for: Le/e/a/ShortImages;->jobs:Ljava/util/Map;
    invoke-static {}, Le/e/a/ShortImages;->access$4()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_d

    return-void

    :cond_d
    # getter for: Le/e/a/ShortImages;->jobs:Ljava/util/Map;
    invoke-static {}, Le/e/a/ShortImages;->access$4()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    iget-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1c
    :goto_1c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_28

    .line 129
    iget-object p1, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 130
    return-void

    .line 118
    :cond_28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ShortImages$Subscription;

    .line 119
    iget-object v2, v1, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iget-object v3, v1, Le/e/a/ShortImages$Subscription;->placeholder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 120
    if-eqz v2, :cond_1c

    .line 121
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 122
    # getter for: Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ShortImages;->access$5()Ljava/util/WeakHashMap;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/ShortImages$Binding;

    .line 123
    if-eqz v4, :cond_56

    iget-object v5, v4, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    if-ne v5, v1, :cond_56

    const/4 v1, 0x0

    iput-object v1, v4, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    .line 124
    :cond_56
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_1c

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1c

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 125
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    if-eqz v3, :cond_1c

    const/16 v1, 0x8

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1c
.end method

.method run()V
    .registers 5

    .line 105
    nop

    .line 107
    const/4 v0, 0x0

    :try_start_2
    iget-object v1, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Le/e/a/ImageDiskCache;->get(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_a} :catch_b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_a} :catch_1d

    goto :goto_d

    :catch_b
    move-exception v1

    move-object v1, v0

    .line 108
    :goto_d
    if-eqz v1, :cond_20

    :try_start_f
    # invokes: Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;
    invoke-static {v1}, Le/e/a/ShortImages;->access$1([B)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_13} :catch_1d

    if-nez v0, :cond_20

    :try_start_15
    iget-object v1, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Le/e/a/ImageDiskCache;->remove(Ljava/lang/String;)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_1c} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_1c} :catch_1d

    goto :goto_20

    .line 114
    :catch_1d
    move-exception v1

    goto :goto_5a

    .line 108
    :catch_1f
    move-exception v1

    .line 109
    :cond_20
    :goto_20
    if-nez v0, :cond_47

    :try_start_22
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_47

    .line 110
    invoke-direct {p0}, Le/e/a/ShortImages$Job;->fetch()[B

    move-result-object v1

    .line 111
    if-eqz v1, :cond_47

    iget-object v2, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_47

    # invokes: Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;
    invoke-static {v1}, Le/e/a/ShortImages;->access$1([B)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_3c} :catch_1d

    if-eqz v0, :cond_47

    :try_start_3e
    iget-object v2, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v3, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Le/e/a/ImageDiskCache;->put(Ljava/lang/String;[B)V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_45} :catch_46
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_45} :catch_1d

    goto :goto_47

    :catch_46
    move-exception v1

    .line 113
    :cond_47
    :goto_47
    if-eqz v0, :cond_5b

    :try_start_49
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_5b

    # getter for: Le/e/a/ShortImages;->memory:Landroid/util/LruCache;
    invoke-static {}, Le/e/a/ShortImages;->access$2()Landroid/util/LruCache;

    move-result-object v1

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_5a} :catch_1d

    .line 114
    :goto_5a
    nop

    .line 115
    :cond_5b
    nop

    .line 116
    # getter for: Le/e/a/ShortImages;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ShortImages;->access$3()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Le/e/a/ShortImages$Job$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Le/e/a/ShortImages$Job$$ExternalSyntheticLambda0;-><init>(Le/e/a/ShortImages$Job;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 131
    return-void
.end method
