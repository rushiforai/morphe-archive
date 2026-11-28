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

    invoke-static {v0}, Lnicoid/network238/ReadOnlyConnection239;->openImage(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 134
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 136
    :cond_0
    const/16 v1, 0x1770

    :try_start_0
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v1, "User-Agent"

    const-string v3, "nicoid Re/1.0"

    invoke-virtual {v0, v1, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    const/high16 v3, 0x800000

    if-le v1, v3, :cond_1

    .line 146
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 137
    return-object v2

    .line 138
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 139
    const/16 v5, 0x2000

    :try_start_3
    new-array v5, v5, [B

    .line 140
    nop

    :goto_0
    invoke-virtual {v1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_3

    .line 144
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 145
    :try_start_4
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v1, :cond_2

    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 146
    :cond_2
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 144
    return-object v3

    .line 141
    :cond_3
    :try_start_6
    iget-object v7, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v7}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    add-int/2addr v7, v6

    if-le v7, v3, :cond_4

    goto :goto_1

    .line 142
    :cond_4
    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    .line 145
    :cond_5
    :goto_1
    :try_start_7
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-eqz v1, :cond_6

    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 146
    :cond_6
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 141
    return-object v2

    .line 144
    :catchall_0
    move-exception v2

    .line 145
    :try_start_9
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :catchall_1
    move-exception v3

    if-nez v2, :cond_7

    move-object v2, v3

    goto :goto_2

    :cond_7
    if-eq v2, v3, :cond_8

    :try_start_a
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    :goto_2
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_9
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception v1

    if-eqz v2, :cond_b

    if-eq v2, v1, :cond_a

    :try_start_b
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    move-object v1, v2

    :cond_b
    throw v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 146
    :catchall_3
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

    if-eq v0, p0, :cond_0

    return-void

    :cond_0
    # getter for: Le/e/a/ShortImages;->jobs:Ljava/util/Map;
    invoke-static {}, Le/e/a/ShortImages;->access$4()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    iget-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 129
    iget-object p1, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 130
    return-void

    .line 118
    :cond_2
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
    if-eqz v2, :cond_1

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
    if-eqz v4, :cond_3

    iget-object v5, v4, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    if-ne v5, v1, :cond_3

    const/4 v1, 0x0

    iput-object v1, v4, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    .line 124
    :cond_3
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 125
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    if-eqz v3, :cond_1

    const/16 v1, 0x8

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method run()V
    .registers 5

    .line 105
    nop

    .line 107
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Le/e/a/ImageDiskCache;->get(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :catch_0
    move-exception v1

    move-object v1, v0

    .line 108
    :goto_0
    if-eqz v1, :cond_0

    :try_start_1
    # invokes: Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;
    invoke-static {v1}, Le/e/a/ShortImages;->access$1([B)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-nez v0, :cond_0

    :try_start_2
    iget-object v1, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Le/e/a/ImageDiskCache;->remove(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 114
    :catch_1
    move-exception v1

    goto :goto_3

    .line 108
    :catch_2
    move-exception v1

    .line 109
    :cond_0
    :goto_1
    if-nez v0, :cond_1

    :try_start_3
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 110
    invoke-direct {p0}, Le/e/a/ShortImages$Job;->fetch()[B

    move-result-object v1

    .line 111
    if-eqz v1, :cond_1

    iget-object v2, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_1

    # invokes: Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;
    invoke-static {v1}, Le/e/a/ShortImages;->access$1([B)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    if-eqz v0, :cond_1

    :try_start_4
    iget-object v2, p0, Le/e/a/ShortImages$Job;->disk:Le/e/a/ImageDiskCache;

    iget-object v3, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Le/e/a/ImageDiskCache;->put(Ljava/lang/String;[B)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    :catch_3
    move-exception v1

    .line 113
    :cond_1
    :goto_2
    if-eqz v0, :cond_2

    :try_start_5
    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_2

    # getter for: Le/e/a/ShortImages;->memory:Landroid/util/LruCache;
    invoke-static {}, Le/e/a/ShortImages;->access$2()Landroid/util/LruCache;

    move-result-object v1

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 114
    :goto_3
    nop

    .line 115
    :cond_2
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
