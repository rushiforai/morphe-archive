.class Ll/nvq0$b;
.super Ll/tsq0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nvq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic c:Ll/nvq0;


# direct methods
.method public constructor <init>(Ll/nvq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nvq0$b;->c:Ll/nvq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "10054"

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 4

    .line 1
    const-string v0, "exec== DbSizeControlJob"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/pvq0;

    .line 7
    .line 8
    iget-object v1, p0, Ll/nvq0$b;->c:Ll/nvq0;

    .line 9
    .line 10
    invoke-static {v1}, Ll/nvq0;->c(Ll/nvq0;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    iget-object v3, p0, Ll/nvq0$b;->c:Ll/nvq0;

    .line 17
    .line 18
    invoke-static {v3}, Ll/nvq0;->a(Ll/nvq0;)Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Ll/pvq0;-><init>(Ljava/lang/String;Ljava/lang/ref/WeakReference;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/nvq0$b;->c:Ll/nvq0;

    .line 29
    .line 30
    invoke-static {v1}, Ll/nvq0;->a(Ll/nvq0;)Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Ll/vvq0;->c(Landroid/content/Context;)Ll/vvq0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Ll/vvq0;->d(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/nvq0$b;->c:Ll/nvq0;

    .line 42
    .line 43
    const-string v0, "check_time"

    .line 44
    .line 45
    invoke-static {p0, v0}, Ll/nvq0;->i(Ll/nvq0;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
