.class Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->executeStickerCacheThread(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$sticker:Lcom/momo/mcamera/mask/Sticker;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->val$context:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->access$000(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->access$100(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->val$sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->val$context:Landroid/content/Context;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 21
    .line 22
    invoke-static {v3}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->access$200(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {v1, v2, v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->access$300(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)Ll/umw;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {v2, v1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->access$300(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)Ll/umw;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    iget-object p0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;->this$0:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-static {p0, v1}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->access$102(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    goto :goto_1

    .line 68
    :catch_0
    :cond_0
    :goto_0
    :try_start_1
    monitor-exit v0

    .line 69
    return-void

    .line 70
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    throw p0
.end method
