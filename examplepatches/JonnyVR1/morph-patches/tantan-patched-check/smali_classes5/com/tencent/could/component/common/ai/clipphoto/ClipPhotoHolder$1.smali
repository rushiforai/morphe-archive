.class public Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->dealWithAfterClipPhoto(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

.field public final synthetic val$activity:Landroid/app/Activity;

.field public final synthetic val$isDataFromSysClip:Z


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;ZLandroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->val$isDataFromSysClip:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->val$activity:Landroid/app/Activity;

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
    const-string v0, "e: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$000(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    :try_start_0
    iget-boolean v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->val$isDataFromSysClip:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    :try_start_1
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->val$activity:Landroid/app/Activity;

    .line 18
    .line 19
    invoke-static {v2, v1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$100(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Landroid/app/Activity;)[B

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    goto :goto_3

    .line 26
    :catch_0
    move-exception v1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->val$activity:Landroid/app/Activity;

    .line 29
    .line 30
    invoke-static {v2, v1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$200(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Landroid/app/Activity;)[B

    .line 31
    .line 32
    .line 33
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    :goto_0
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    :try_start_2
    const-string v1, "clip error! bitmapBytes is null"

    .line 39
    .line 40
    invoke-static {v2, v1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$300(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$500(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;)Ljava/io/File;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcom/tencent/could/component/common/ai/clipphoto/FileUtils;->deleteFile(Ljava/io/File;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    const/4 v3, 0x2

    .line 54
    :try_start_3
    invoke-static {v1, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v2, v1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$400(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :goto_1
    const-string v2, "ClipPhotoHolder"

    .line 63
    .line 64
    :try_start_4
    new-instance v3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 84
    .line 85
    const-string v1, "clip error!"

    .line 86
    .line 87
    invoke-static {v0, v1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$300(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 88
    .line 89
    .line 90
    :goto_2
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 91
    .line 92
    invoke-static {p0}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$500(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;)Ljava/io/File;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Lcom/tencent/could/component/common/ai/clipphoto/FileUtils;->deleteFile(Ljava/io/File;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :goto_3
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 101
    .line 102
    invoke-static {p0}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$500(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;)Ljava/io/File;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lcom/tencent/could/component/common/ai/clipphoto/FileUtils;->deleteFile(Ljava/io/File;)V

    .line 107
    .line 108
    .line 109
    throw v0

    .line 110
    :cond_2
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;->this$0:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;

    .line 111
    .line 112
    const-string v0, "get image data is null\uff01"

    .line 113
    .line 114
    invoke-static {p0, v0}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->access$300(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method
