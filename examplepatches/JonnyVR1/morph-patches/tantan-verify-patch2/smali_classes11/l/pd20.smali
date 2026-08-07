.class public final Ll/pd20;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pd20$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Z

.field public final b:I

.field public final c:I

.field public final d:Z

.field public final e:I

.field public final f:Ll/kfl0;

.field public final g:Z


# direct methods
.method public synthetic constructor <init>(Ll/pd20$a;Ll/v4u0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/pd20$a;->n(Ll/pd20$a;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iput-boolean p2, p0, Ll/pd20;->a:Z

    .line 9
    .line 10
    invoke-static {p1}, Ll/pd20$a;->j(Ll/pd20$a;)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iput p2, p0, Ll/pd20;->b:I

    .line 15
    .line 16
    invoke-static {p1}, Ll/pd20$a;->k(Ll/pd20$a;)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iput p2, p0, Ll/pd20;->c:I

    .line 21
    .line 22
    invoke-static {p1}, Ll/pd20$a;->m(Ll/pd20$a;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput-boolean p2, p0, Ll/pd20;->d:Z

    .line 27
    .line 28
    invoke-static {p1}, Ll/pd20$a;->i(Ll/pd20$a;)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Ll/pd20;->e:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/pd20$a;->l(Ll/pd20$a;)Ll/kfl0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iput-object p2, p0, Ll/pd20;->f:Ll/kfl0;

    .line 39
    .line 40
    invoke-static {p1}, Ll/pd20$a;->o(Ll/pd20$a;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput-boolean p1, p0, Ll/pd20;->g:Z

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pd20;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget p0, p0, Ll/pd20;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pd20;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ll/kfl0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pd20;->f:Ll/kfl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd20;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd20;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd20;->g:Z

    .line 2
    .line 3
    return p0
.end method
