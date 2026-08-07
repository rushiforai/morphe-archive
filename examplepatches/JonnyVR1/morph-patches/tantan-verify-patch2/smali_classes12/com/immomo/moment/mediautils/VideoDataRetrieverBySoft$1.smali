.class Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->executeFrameFilter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "executeFrameFilter is called\uff0cthread will run!"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/byx;->a()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$200(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ll/o3m;

    .line 21
    .line 22
    .line 23
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$600(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 36
    .line 37
    invoke-static {v2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    mul-int/2addr v1, v2

    .line 42
    mul-int/lit8 v1, v1, 0x3

    .line 43
    .line 44
    div-int/lit8 v1, v1, 0x2

    .line 45
    .line 46
    new-array v1, v1, [B

    .line 47
    .line 48
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->access$700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;[B)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$800(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :try_start_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 59
    .line 60
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$600(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->doFrameFilter()V

    .line 65
    .line 66
    .line 67
    monitor-exit v0

    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception v1

    .line 70
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 72
    :catch_0
    move-exception v0

    .line 73
    iget-object v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const-string v2, "executeFrameFilter thread is exception, will release!"

    .line 80
    .line 81
    invoke-static {v1, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 93
    .line 94
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    if-eqz v1, :cond_1

    .line 99
    .line 100
    iget-object v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 101
    .line 102
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-interface {v1, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;->doFilterError(Ljava/lang/Exception;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    :goto_0
    invoke-static {}, Ll/byx;->a()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 116
    .line 117
    invoke-static {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$200(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ll/o3m;

    .line 118
    .line 119
    .line 120
    :cond_2
    return-void
.end method
