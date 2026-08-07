.class public Ll/fbt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kwl;


# instance fields
.field public a:Ll/ebt;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Z
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/wrv;->P(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vwt;->Q6()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    return v0
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fbt;->a:Ll/ebt;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ebt;->r()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(Ll/hti;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/fbt;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->v0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    return v1

    .line 31
    :cond_2
    new-instance v0, Ll/ebt;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/ebt;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/fbt;->a:Ll/ebt;

    .line 37
    .line 38
    new-instance v0, Ll/hbt;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/hbt;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/fbt;->a:Ll/ebt;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ll/ebt;->n(Ll/hbt;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/fbt;->a:Ll/ebt;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/hbt;->b(Ll/ebt;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/fbt;->a:Ll/ebt;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/ebt;->p(Ll/hti;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fbt;->a:Ll/ebt;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ebt;->q()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
