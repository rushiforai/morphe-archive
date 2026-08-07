.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;

.field final synthetic val$count:[J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;[J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4$1;->this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4$1;->val$count:[J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4$1;->val$count:[J

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-wide v1, p0, v0

    .line 5
    .line 6
    const-wide/16 v3, 0x1

    .line 7
    .line 8
    add-long/2addr v1, v3

    .line 9
    aput-wide v1, p0, v0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    aget-wide v2, p0, v1

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 21
    .line 22
    .line 23
    move-result-wide v4

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-wide/16 v4, 0x0

    .line 26
    .line 27
    :goto_0
    add-long/2addr v2, v4

    .line 28
    aput-wide v2, p0, v1

    .line 29
    .line 30
    return v0
.end method
