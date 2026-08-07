.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;

.field final synthetic val$invokerFinal:Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;->this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;->val$invokerFinal:Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;

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
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;->this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 15
    .line 16
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$400(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Ljava/lang/String;I)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    const-string p1, ".so"

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    const-string p1, ".odex"

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    const-string p1, ".oat"

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    const-string p1, ".dex"

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    :cond_0
    const-string p1, "Warming up so %s"

    .line 55
    .line 56
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v3, "Matrix.WarmUpDelegate"

    .line 61
    .line 62
    invoke-static {v3, p1, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;->val$invokerFinal:Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;

    .line 66
    .line 67
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;->warmUp(Ljava/lang/String;I)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;->this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 76
    .line 77
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$500(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return v1
.end method
