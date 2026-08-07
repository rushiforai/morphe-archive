.class public Ll/y60$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y60;->t(Ljava/lang/String;)Lrx/c;
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
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/y60;


# direct methods
.method public constructor <init>(Ll/y60;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y60$a;->b:Ll/y60;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y60$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ll/gcg0;Ll/md20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/y60;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/Pair;

    .line 5
    .line 6
    invoke-direct {v0, p2, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
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
    iget-object v1, p0, Ll/y60$a;->b:Ll/y60;

    .line 4
    .line 5
    iget-object v1, v1, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v2, p0, Ll/y60$a;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ll/f70$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/y60$a;->a:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v2, Ll/x60;

    .line 15
    .line 16
    invoke-direct {v2, v1, p1}, Ll/x60;-><init>(Ljava/lang/String;Ll/gcg0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ll/f70$a;->b(Ll/md20$c;)Ll/f70$a;

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/kfl0$a;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/kfl0$a;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-virtual {v1, v2}, Ll/kfl0$a;->b(Z)Ll/kfl0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ll/kfl0$a;->a()Ll/kfl0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/qd20$a;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/qd20$a;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ll/qd20$a;->h(Ll/kfl0;)Ll/qd20$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ll/qd20$a;->a()Ll/qd20;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ll/f70$a;->d(Ll/qd20;)Ll/f70$a;

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/y60$a$a;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Ll/y60$a$a;-><init>(Ll/y60$a;Ll/gcg0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/f70$a;->c(Ll/d70;)Ll/f70$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/f70$a;->a()Ll/f70;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Ll/s70$a;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/s70$a;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ll/s70$a;->i()Ll/s70;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Ll/f70;->a(Ll/s70;)V

    .line 75
    .line 76
    .line 77
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
    invoke-virtual {p0, p1}, Ll/y60$a;->b(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
