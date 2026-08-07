.class Ll/ioh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eae$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ioh0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/ioh0$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/ioh0$b;

.field final synthetic c:Ll/ioh0;


# direct methods
.method public constructor <init>(Ll/ioh0;Ljava/lang/String;Ll/ioh0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ioh0$a;->c:Ll/ioh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ioh0$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ioh0$a;->b:Ll/ioh0$b;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onDownloadFailed $s"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/ioh0$a;->a:Ljava/lang/String;

    .line 16
    .line 17
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "SDKResource"

    .line 22
    .line 23
    invoke-static {v2, v0, v1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ioh0$a;->b:Ll/ioh0$b;

    .line 27
    .line 28
    iput-object p1, v0, Ll/ioh0$b;->b:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p0, p0, Ll/ioh0$a;->c:Ll/ioh0;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-static {p0, p1}, Ll/ioh0;->a(Ll/ioh0;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ioh0$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SDKResource"

    .line 8
    .line 9
    const-string v2, "onDownloadSuccess"

    .line 10
    .line 11
    invoke-static {v1, v2, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ioh0$a;->c:Ll/ioh0;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-static {p0, v0}, Ll/ioh0;->a(Ll/ioh0;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onDownloading(I)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "SDKResource"

    .line 10
    .line 11
    const-string v2, "onDownloading %d"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ioh0$a;->c:Ll/ioh0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/ioh0;->b(Ll/ioh0;)Ll/ioh0$c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/ioh0$a;->c:Ll/ioh0;

    .line 25
    .line 26
    invoke-static {p0}, Ll/ioh0;->b(Ll/ioh0;)Ll/ioh0$c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    int-to-float p1, p1

    .line 31
    const-wide/16 v0, 0x0

    .line 32
    .line 33
    invoke-interface {p0, p1, v0, v1}, Ll/ioh0$c;->a(FD)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
