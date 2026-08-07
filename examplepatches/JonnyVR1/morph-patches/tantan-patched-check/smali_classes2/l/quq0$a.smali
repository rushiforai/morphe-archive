.class Ll/quq0$a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/quq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/quq0;


# direct methods
.method public constructor <init>(Ll/quq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/quq0$a;->a:Ll/quq0;

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
    iget-object v0, p0, Ll/quq0$a;->a:Ll/quq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/quq0;->c(Ll/quq0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/quq0$a;->a:Ll/quq0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/quq0;->e(Ll/quq0;)Ll/grq0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/grq0;->s()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-static {v0, v1}, Ll/quq0;->a(J)J

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Ll/quq0$a;->a:Ll/quq0;

    .line 31
    .line 32
    invoke-static {p0}, Ll/quq0;->f(Ll/quq0;)Ljava/lang/Runnable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-wide/16 v1, 0x1f4

    .line 37
    .line 38
    invoke-virtual {v0, p0, v1, v2}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/quq0;->d()J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    invoke-static {v0, v1}, Ll/kuq0;->c(J)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
