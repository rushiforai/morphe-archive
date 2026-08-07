.class public Ll/df80;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:Ll/df80;


# instance fields
.field public a:Ll/u310;

.field public b:Ll/u310;


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

.method public static a()Ll/df80;
    .locals 1

    .line 1
    sget-object v0, Ll/df80;->c:Ll/df80;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/df80;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/df80;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/df80;->c:Ll/df80;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/df80;->c:Ll/df80;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public b(Z)Ll/qwl;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Ll/df80;->a:Ll/u310;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Ll/u310;

    .line 9
    .line 10
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 11
    .line 12
    invoke-direct {p1, v1}, Ll/u310;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ll/u310;->j0()Ll/u310;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/df80;->a:Ll/u310;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Ll/df80;->a:Ll/u310;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/s310;->g(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/df80;->d()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/df80;->a:Ll/u310;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    iget-object p1, p0, Ll/df80;->b:Ll/u310;

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    new-instance p1, Ll/u310;

    .line 37
    .line 38
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 39
    .line 40
    invoke-direct {p1, v1}, Ll/u310;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ll/u310;->j0()Ll/u310;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Ll/df80;->b:Ll/u310;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Ll/df80;->a:Ll/u310;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ll/s310;->g(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/df80;->b:Ll/u310;

    .line 55
    .line 56
    return-object p0
.end method

.method public final c()V
    .locals 2

    .line 1
    new-instance v0, Ll/u310;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/u310;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/u310;->j0()Ll/u310;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/df80;->a:Ll/u310;

    .line 13
    .line 14
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    new-instance v0, Ll/u310;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/u310;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/u310;->j0()Ll/u310;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/df80;->b:Ll/u310;

    .line 13
    .line 14
    return-void
.end method

.method public e(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/df80;->a:Ll/u310;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/s310;->b(Z)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/df80;->a:Ll/u310;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/df80;->b:Ll/u310;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/s310;->b(Z)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/df80;->b:Ll/u310;

    .line 19
    .line 20
    :cond_1
    invoke-virtual {p0}, Ll/df80;->c()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
