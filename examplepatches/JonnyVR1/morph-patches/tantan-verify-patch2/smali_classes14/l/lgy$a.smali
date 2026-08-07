.class public Ll/lgy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lgy;->n(Landroid/content/Context;Ljava/lang/String;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "Landroid/util/Pair<",
        "Ll/md20;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/lgy;


# direct methods
.method public constructor <init>(Ll/lgy;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/lgy$a;->c:Ll/lgy;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lgy$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lgy$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ll/gcg0;Ll/md20;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {v0, p2, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public b(Ll/gcg0;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Landroid/util/Pair<",
            "Ll/md20;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/f70$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lgy$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Ll/lgy$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/f70$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/lgy$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v2, Ll/kgy;

    .line 13
    .line 14
    invoke-direct {v2, v1, p1}, Ll/kgy;-><init>(Ljava/lang/String;Ll/gcg0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ll/f70$a;->b(Ll/md20$c;)Ll/f70$a;

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/qd20$a;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/qd20$a;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v1, v2}, Ll/qd20$a;->c(I)Ll/qd20$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ll/qd20$a;->a()Ll/qd20;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/lgy$a$a;

    .line 35
    .line 36
    invoke-direct {v2, p0, p1}, Ll/lgy$a$a;-><init>(Ll/lgy$a;Ll/gcg0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ll/f70$a;->c(Ll/d70;)Ll/f70$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, v1}, Ll/f70$a;->d(Ll/qd20;)Ll/f70$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/f70$a;->a()Ll/f70;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p1, Ll/s70$a;

    .line 52
    .line 53
    invoke-direct {p1}, Ll/s70$a;-><init>()V

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    invoke-static {v0}, Ll/u2n;->g(Z)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p1, v0}, Ll/r6;->e(Ljava/util/List;)Ll/r6;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ll/s70$a;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/s70$a;->i()Ll/s70;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Ll/f70;->a(Ll/s70;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lgy$a;->b(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
