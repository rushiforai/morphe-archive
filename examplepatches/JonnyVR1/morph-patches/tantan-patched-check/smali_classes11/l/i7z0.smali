.class public final Ll/i7z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Ll/gku0;

.field public c:Ll/upt0;

.field public d:Ll/nbr0;

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i7z0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/i7z0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i7z0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/i7z0;)Ll/upt0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i7z0;->c:Ll/upt0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/i7z0;)Ll/nbr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i7z0;->d:Ll/nbr0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final c(Ll/nbr0;)Ll/i7z0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i7z0;->d:Ll/nbr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/cbr0;
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/i7z0;->e:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/i7z0;->c:Ll/upt0;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/i7z0;->b:Ll/gku0;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/n7z0;

    .line 18
    .line 19
    invoke-direct {v0, v2}, Ll/n7z0;-><init>(Ll/m7z0;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/i7z0;->b:Ll/gku0;

    .line 23
    .line 24
    :cond_0
    new-instance v0, Ll/o7z0;

    .line 25
    .line 26
    iget-object v3, p0, Ll/i7z0;->b:Ll/gku0;

    .line 27
    .line 28
    invoke-direct {v0, v3}, Ll/o7z0;-><init>(Ll/gku0;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/i7z0;->c:Ll/upt0;

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Ll/i7z0;->d:Ll/nbr0;

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Ll/i7z0;->a:Landroid/content/Context;

    .line 38
    .line 39
    new-instance v3, Ll/nbr0;

    .line 40
    .line 41
    new-instance v4, Ll/k7z0;

    .line 42
    .line 43
    invoke-direct {v4, v2}, Ll/k7z0;-><init>(Ll/j7z0;)V

    .line 44
    .line 45
    .line 46
    const-wide/16 v5, 0x0

    .line 47
    .line 48
    invoke-direct {v3, v0, v4, v5, v6}, Ll/nbr0;-><init>(Landroid/content/Context;Ll/mbr0;J)V

    .line 49
    .line 50
    .line 51
    iput-object v3, p0, Ll/i7z0;->d:Ll/nbr0;

    .line 52
    .line 53
    :cond_2
    new-instance v0, Ll/cbr0;

    .line 54
    .line 55
    invoke-direct {v0, p0, v2}, Ll/cbr0;-><init>(Ll/i7z0;Ll/bbr0;)V

    .line 56
    .line 57
    .line 58
    iput-boolean v1, p0, Ll/i7z0;->e:Z

    .line 59
    .line 60
    return-object v0
.end method
