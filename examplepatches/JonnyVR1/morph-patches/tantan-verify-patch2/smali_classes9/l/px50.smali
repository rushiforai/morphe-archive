.class public Ll/px50;
.super Ll/fk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/px50$a;
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

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>(Ll/px50$a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/fk2;-><init>(Ll/gk2;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/px50;->n:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/px50$a;->e(Ll/px50$a;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ll/px50;->c:I

    .line 12
    .line 13
    invoke-static {p1}, Ll/px50$a;->o(Ll/px50$a;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/px50;->d:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1}, Ll/px50$a;->k(Ll/px50$a;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-boolean v0, p0, Ll/px50;->e:Z

    .line 24
    .line 25
    invoke-static {p1}, Ll/px50$a;->a(Ll/px50$a;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/px50;->f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 30
    .line 31
    invoke-static {p1}, Ll/px50$a;->f(Ll/px50$a;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/px50;->g:I

    .line 36
    .line 37
    invoke-static {p1}, Ll/px50$a;->n(Ll/px50$a;)[I

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/px50;->h:[I

    .line 42
    .line 43
    invoke-static {p1}, Ll/px50$a;->m(Ll/px50$a;)Ll/y20;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Ll/px50;->i:Ll/y20;

    .line 48
    .line 49
    invoke-static {p1}, Ll/px50$a;->d(Ll/px50$a;)Ll/x20;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/px50;->j:Ll/x20;

    .line 54
    .line 55
    invoke-static {p1}, Ll/px50$a;->b(Ll/px50$a;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/px50;->k:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1}, Ll/px50$a;->g(Ll/px50$a;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Ll/px50;->l:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p1}, Ll/px50$a;->j(Ll/px50$a;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput-boolean v0, p0, Ll/px50;->m:Z

    .line 72
    .line 73
    invoke-static {p1}, Ll/px50$a;->c(Ll/px50$a;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, p0, Ll/px50;->n:I

    .line 78
    .line 79
    invoke-static {p1}, Ll/px50$a;->h(Ll/px50$a;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput-boolean v0, p0, Ll/px50;->o:Z

    .line 84
    .line 85
    invoke-static {p1}, Ll/px50$a;->i(Ll/px50$a;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput-boolean v0, p0, Ll/px50;->p:Z

    .line 90
    .line 91
    invoke-static {p1}, Ll/px50$a;->l(Ll/px50$a;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput-boolean p1, p0, Ll/px50;->q:Z

    .line 96
    .line 97
    return-void
.end method

.method public static c(I)Ll/px50$a;
    .locals 1

    .line 1
    new-instance v0, Ll/px50$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/px50$a;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/px50;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50;->f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50;->j:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/px50;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/px50;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50;->h:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
