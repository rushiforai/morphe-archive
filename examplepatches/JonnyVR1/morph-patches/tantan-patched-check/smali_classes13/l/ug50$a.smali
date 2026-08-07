.class public Ll/ug50$a;
.super Ll/er2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ug50;->i(Ll/ug50$c;Ll/vj20$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ry3;

.field public final synthetic b:Ll/ug50;


# direct methods
.method public constructor <init>(Ll/ug50;Ll/ry3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ug50$a;->b:Ll/ug50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ug50$a;->a:Ll/ry3;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/er2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ug50$a;->a:Ll/ry3;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/ry3;->isCanceled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "onCancellationRequested url = "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/ug50$a;->a:Ll/ry3;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/ry3;->request()Ll/x1d0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/x1d0;->k()Ll/rnl;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "[common][image_net]"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eq v0, v1, :cond_0

    .line 47
    .line 48
    iget-object p0, p0, Ll/ug50$a;->a:Ll/ry3;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/ry3;->cancel()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Ll/ug50$a;->b:Ll/ug50;

    .line 55
    .line 56
    invoke-static {v0}, Ll/ug50;->g(Ll/ug50;)Ljava/util/concurrent/Executor;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/ug50$a$a;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/ug50$a$a;-><init>(Ll/ug50$a;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method
