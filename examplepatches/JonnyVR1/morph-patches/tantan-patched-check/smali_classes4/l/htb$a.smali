.class public Ll/htb$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/htb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/htb;


# direct methods
.method public constructor <init>(Ll/htb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/htb$a;->a:Ll/htb;

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
    .locals 4

    .line 1
    iget-object v0, p0, Ll/htb$a;->a:Ll/htb;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ioi0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/etb;->b()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/htb$a;->a:Ll/htb;

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/htb;->t(Ll/htb;F)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    new-instance v1, Ll/ftb;

    .line 23
    .line 24
    float-to-double v2, v0

    .line 25
    invoke-static {}, Ll/du2;->f()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {v1, v2, v3, v0}, Ll/ftb;-><init>(DLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/htb$a;->a:Ll/htb;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/htb;->j()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v1, v0}, Ll/eoi0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/htb$a;->a:Ll/htb;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/ioi0;->q(Ll/eoi0;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Ll/htb$a;->a:Ll/htb;

    .line 47
    .line 48
    invoke-static {v0}, Ll/htb;->u(Ll/htb;)Ll/ctb;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/ctb;->g()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    invoke-static {p0, v0, v1}, Ll/u21;->c(Ljava/lang/Runnable;J)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
