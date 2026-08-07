.class Ll/frq0$b;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/frq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/frq0;


# direct methods
.method public constructor <init>(Ll/frq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/frq0$b;->a:Ll/frq0;

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
    const-string v0, "Recheck uncaught exception handler."

    .line 2
    .line 3
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/frq0$b;->a:Ll/frq0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/frq0;->b(Ll/frq0;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x3

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/frq0$b;->a:Ll/frq0;

    .line 16
    .line 17
    invoke-static {v0}, Ll/frq0;->k(Ll/frq0;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/frq0$b;->a:Ll/frq0;

    .line 21
    .line 22
    invoke-static {v0}, Ll/frq0;->s(Ll/frq0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/frq0$b;->a:Ll/frq0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/frq0;->u(Ll/frq0;)Ljava/lang/Runnable;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-wide/16 v1, 0x7530

    .line 36
    .line 37
    invoke-virtual {v0, p0, v1, v2}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
