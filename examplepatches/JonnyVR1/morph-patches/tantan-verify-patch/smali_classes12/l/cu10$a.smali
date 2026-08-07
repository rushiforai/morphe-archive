.class Ll/cu10$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cu10;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/cu10;


# direct methods
.method public constructor <init>(Ll/cu10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10$a;->a:Ll/cu10;

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
    const/4 v0, 0x0

    .line 2
    :goto_0
    :try_start_0
    iget-object v1, p0, Ll/cu10$a;->a:Ll/cu10;

    .line 3
    .line 4
    invoke-static {v1}, Ll/cu10;->a(Ll/cu10;)Ljava/util/LinkedList;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    new-instance v1, Ljava/io/File;

    .line 15
    .line 16
    iget-object v2, p0, Ll/cu10$a;->a:Ll/cu10;

    .line 17
    .line 18
    invoke-static {v2}, Ll/cu10;->a(Ll/cu10;)Ljava/util/LinkedList;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lcom/immomo/moment/model/VideoFragment;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/immomo/moment/model/VideoFragment;->getVideoPath()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    goto :goto_2

    .line 47
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :goto_2
    const-string v1, "RecoderUtils"

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/cu10$a;->a:Ll/cu10;

    .line 56
    .line 57
    invoke-static {v0}, Ll/cu10;->b(Ll/cu10;)Ll/apw;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Ll/cu10$a;->a:Ll/cu10;

    .line 64
    .line 65
    invoke-static {v0}, Ll/cu10;->b(Ll/cu10;)Ll/apw;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object p0, p0, Ll/cu10$a;->a:Ll/cu10;

    .line 70
    .line 71
    invoke-static {p0}, Ll/cu10;->c(Ll/cu10;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    add-int/lit16 p0, p0, 0x3e9

    .line 76
    .line 77
    const-string v1, "Cancel recording happened file error !!!"

    .line 78
    .line 79
    invoke-interface {v0, p0, v1}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method
