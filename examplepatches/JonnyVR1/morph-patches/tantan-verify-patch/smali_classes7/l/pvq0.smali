.class public Ll/pvq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pvq0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pvq0;->b:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pvq0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/content/Context;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object v1, p0, Ll/pvq0;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1}, Ll/qwq0;->a(Ljava/lang/String;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    sget-wide v3, Ll/ovq0;->b:J

    .line 22
    .line 23
    cmp-long v1, v1, v3

    .line 24
    .line 25
    if-lez v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Ll/pvq0;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Ll/svq0;->i(Ljava/lang/String;)Ll/svq0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v2, p0, Ll/pvq0;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v2}, Ll/rvq0;->l(Ljava/lang/String;)Ll/rvq0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ll/vvq0$a;->g(Ll/vvq0$a;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/pvq0;->a:Ljava/lang/String;

    .line 43
    .line 44
    const/16 v3, 0x3e8

    .line 45
    .line 46
    invoke-static {v0, p0, v3}, Ll/qvq0;->j(Landroid/content/Context;Ljava/lang/String;I)Ll/qvq0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v2, p0}, Ll/vvq0$a;->g(Ll/vvq0$a;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Ll/vvq0;->c(Landroid/content/Context;)Ll/vvq0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, v1}, Ll/vvq0;->e(Ll/vvq0$a;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    const-string p0, "=====> do not need clean db"

    .line 62
    .line 63
    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
