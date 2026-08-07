.class public Ll/ypu;
.super Ll/fk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ypu$a;
    }
.end annotation


# instance fields
.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Z

.field public final f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

.field public final g:I

.field public final h:[I

.field public final i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ll/x20;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Z

.field public n:I

.field public o:Z


# direct methods
.method public constructor <init>(Ll/ypu$a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/fk2;-><init>(Ll/gk2;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/ypu$a;->e(Ll/ypu$a;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/ypu;->c:I

    .line 9
    .line 10
    invoke-static {p1}, Ll/ypu$a;->m(Ll/ypu$a;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/ypu;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Ll/ypu$a;->j(Ll/ypu$a;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Ll/ypu;->e:Z

    .line 21
    .line 22
    invoke-static {p1}, Ll/ypu$a;->a(Ll/ypu$a;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/ypu;->f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 27
    .line 28
    invoke-static {p1}, Ll/ypu$a;->f(Ll/ypu$a;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/ypu;->g:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/ypu$a;->l(Ll/ypu$a;)[I

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/ypu;->h:[I

    .line 39
    .line 40
    invoke-static {p1}, Ll/ypu$a;->k(Ll/ypu$a;)Ll/y20;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/ypu;->i:Ll/y20;

    .line 45
    .line 46
    invoke-static {p1}, Ll/ypu$a;->d(Ll/ypu$a;)Ll/x20;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/ypu;->j:Ll/x20;

    .line 51
    .line 52
    invoke-static {p1}, Ll/ypu$a;->b(Ll/ypu$a;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/ypu;->k:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p1}, Ll/ypu$a;->g(Ll/ypu$a;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ll/ypu;->l:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p1}, Ll/ypu$a;->i(Ll/ypu$a;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput-boolean v0, p0, Ll/ypu;->m:Z

    .line 69
    .line 70
    invoke-static {p1}, Ll/ypu$a;->c(Ll/ypu$a;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Ll/ypu;->n:I

    .line 75
    .line 76
    invoke-static {p1}, Ll/ypu$a;->h(Ll/ypu$a;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iput-boolean p1, p0, Ll/ypu;->o:Z

    .line 81
    .line 82
    return-void
.end method

.method public static c(I)Ll/ypu$a;
    .locals 1

    .line 1
    new-instance v0, Ll/ypu$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ypu$a;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ypu;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu;->f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu;->j:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ypu;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ypu;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ypu;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ypu;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ypu;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu;->h:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
