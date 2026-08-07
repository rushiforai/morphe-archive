.class public Ll/ozv$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ozv;-><init>(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

.field public final synthetic c:Ll/ozv;


# direct methods
.method public constructor <init>(Ll/ozv;Ljava/lang/String;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ozv$a;->c:Ll/ozv;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ozv$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ozv$a;->b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

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
    :try_start_0
    iget-object v0, p0, Ll/ozv$a;->c:Ll/ozv;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/ozv$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/ozv$a;->b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Ll/ozv;->b(Ll/ozv;Ljava/lang/String;)Ljava/io/File;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    iget-object v1, p0, Ll/ozv$a;->c:Ll/ozv;

    .line 44
    .line 45
    iget-object v1, v1, Ll/ozv;->b:Ll/v31;

    .line 46
    .line 47
    filled-new-array {v0}, [Ljava/io/File;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Ll/ozv$a;->b:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 56
    .line 57
    invoke-virtual {v1, v0, p0}, Ll/v31;->n(Ljava/util/List;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    .line 60
    :catchall_0
    :cond_0
    return-void
.end method
