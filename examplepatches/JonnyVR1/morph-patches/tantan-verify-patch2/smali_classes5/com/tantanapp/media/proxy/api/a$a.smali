.class public Lcom/tantanapp/media/proxy/api/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/media/proxy/api/a;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/proxy/api/a;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/proxy/api/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/proxy/api/a$a;->a:Lcom/tantanapp/media/proxy/api/a;

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
    .locals 5

    .line 1
    const-string v0, "ijk begin clean cache :"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/media/proxy/api/a$a;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tantanapp/media/proxy/api/a;->a(Lcom/tantanapp/media/proxy/api/a;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->b()J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v1, v0}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$a;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/media/proxy/api/a;->c(Lcom/tantanapp/media/proxy/api/a;)Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyClearCache()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a$a;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/tantanapp/media/proxy/api/a;->a(Lcom/tantanapp/media/proxy/api/a;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "ijk end clean cache"

    .line 44
    .line 45
    invoke-static {p0, v0}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
