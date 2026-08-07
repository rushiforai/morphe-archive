.class Ll/xpy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xpy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field a:Ll/xpy$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xpy$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic b:Ll/xpy;


# direct methods
.method public constructor <init>(Ll/xpy;Ll/xpy$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xpy$b<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/xpy$a;->a:Ll/xpy$b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xpy$a;->a:Ll/xpy$b;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 6
    .line 7
    invoke-static {v0}, Ll/xpy;->a(Ll/xpy;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 15
    .line 16
    iget-object v1, p0, Ll/xpy$a;->a:Ll/xpy$b;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/xpy$b;->a()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Ll/xpy$a;->a:Ll/xpy$b;

    .line 23
    .line 24
    invoke-interface {v2}, Ll/xpy$b;->b()Ll/xpy$c;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v1, v2}, Ll/xpy;->e(Ljava/util/Iterator;Ll/xpy$c;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 32
    .line 33
    invoke-static {v0}, Ll/xpy;->b(Ll/xpy;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iget-object v2, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 38
    .line 39
    invoke-static {v2}, Ll/xpy;->c(Ll/xpy;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 46
    .line 47
    invoke-static {v0}, Ll/xpy;->b(Ll/xpy;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    const/4 v2, 0x1

    .line 52
    shr-long/2addr v0, v2

    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "object: "

    .line 56
    .line 57
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 61
    .line 62
    invoke-static {v3}, Ll/xpy;->c(Ll/xpy;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v3, " may be leaked, MemoryLeakChecker will check after "

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v3, " ms."

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    const-string v3, "MemoryLeakChecker"

    .line 87
    .line 88
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    :cond_1
    iget-object v2, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 92
    .line 93
    invoke-static {v2, p0, v0, v1}, Ll/xpy;->d(Ll/xpy;Ljava/lang/Runnable;J)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/xpy$a;->a:Ll/xpy$b;

    .line 98
    .line 99
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/xpy$a;->b:Ll/xpy;

    .line 103
    .line 104
    invoke-static {p0}, Ll/xpy;->a(Ll/xpy;)Z

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CheckAction "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/xpy$a;->a:Ll/xpy$b;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
