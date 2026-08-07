.class public Ll/dr$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lpw;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/dr;


# direct methods
.method public constructor <init>(Ll/dr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dr$a;->a:Ll/dr;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/dr$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/dr$a$a;-><init>(Ll/dr$a;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dr$a;->a:Ll/dr;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dr;->d:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/dr$a;->a:Ll/dr;

    .line 12
    .line 13
    iget-object v0, v0, Ll/dr;->d:Landroid/app/Activity;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    new-instance v0, Ljava/io/File;

    .line 22
    .line 23
    iget-object v1, p0, Ll/dr$a;->a:Ll/dr;

    .line 24
    .line 25
    invoke-static {v1}, Ll/dr;->A(Ll/dr;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    cmp-long v0, v0, v2

    .line 45
    .line 46
    if-gtz v0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 52
    :goto_1
    iget-object v1, p0, Ll/dr$a;->a:Ll/dr;

    .line 53
    .line 54
    invoke-static {v1}, Ll/dr;->B(Ll/dr;)Ll/dp;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    iget-object v1, p0, Ll/dr$a;->a:Ll/dr;

    .line 65
    .line 66
    invoke-static {v1}, Ll/dr;->B(Ll/dr;)Ll/dp;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object p0, p0, Ll/dr$a;->a:Ll/dr;

    .line 71
    .line 72
    invoke-static {p0}, Ll/dr;->A(Ll/dr;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    xor-int/lit8 v2, v0, 0x1

    .line 77
    .line 78
    invoke-interface {v1, p0, v2}, Ll/gp$a;->c(Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    :cond_2
    if-eqz v0, :cond_3

    .line 82
    .line 83
    const-string p0, "\u89c6\u9891\u5f55\u5236\u9519\u8bef\uff0c\u8bf7\u91cd\u8bd5"

    .line 84
    .line 85
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method
