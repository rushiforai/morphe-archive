.class public Ll/v31$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v31;->n(Ljava/util/List;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

.field public final synthetic c:Ll/v31;


# direct methods
.method public constructor <init>(Ll/v31;Ljava/util/List;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v31$b;->c:Ll/v31;

    .line 2
    .line 3
    iput-object p2, p0, Ll/v31$b;->a:Ljava/util/List;

    .line 4
    .line 5
    iput-object p3, p0, Ll/v31$b;->b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

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
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v31$b;->c:Ll/v31;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v31$b;->a:Ljava/util/List;

    .line 4
    .line 5
    iget-object v2, p0, Ll/v31$b;->b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/v31;->b(Ll/v31;Ljava/util/List;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "createJsonFile zipFile!!!"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    new-array v2, v2, [Ljava/lang/Object;

    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object v1, p0, Ll/v31$b;->c:Ll/v31;

    .line 42
    .line 43
    iget-object v2, p0, Ll/v31$b;->b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Ll/v31;->c(Ll/v31;Ljava/io/File;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Landroid/util/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    new-instance v0, Ll/u31;

    .line 52
    .line 53
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v1, Ll/v31$e;

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ll/u31;-><init>(Ll/v31$e;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/v31$b;->c:Ll/v31;

    .line 61
    .line 62
    invoke-static {p0, v0}, Ll/v31;->d(Ll/v31;Ll/u31;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Ll/nki;->f(Ljava/io/File;)Z

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method
