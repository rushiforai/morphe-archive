.class public Ll/jze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hxj0$b;


# instance fields
.field public a:Z


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

.method public static bridge synthetic d(Ll/jze;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jze;->a:Z

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jze;->a:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    invoke-static {}, Ll/iye;->a()Ll/iye;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Ll/iye;->m(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public b(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jze;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/iye;->a()Ll/iye;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/iye;->f(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public c(Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    new-instance v0, Ll/t0j;

    .line 2
    .line 3
    const-string v1, "Noto Color Emoji Compat"

    .line 4
    .line 5
    sget v2, Ll/i8c0;->a:I

    .line 6
    .line 7
    const-string v3, "com.google.android.gms.fonts"

    .line 8
    .line 9
    const-string v4, "com.google.android.gms"

    .line 10
    .line 11
    invoke-direct {v0, v3, v4, v1, v2}, Ll/t0j;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/u0j;

    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 17
    .line 18
    invoke-direct {v1, v2, v0}, Ll/u0j;-><init>(Landroid/content/Context;Ll/t0j;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {v1, v0}, Ll/iye$c;->c(Z)Ll/iye$c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/high16 v1, -0x10000

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/iye$c;->b(I)Ll/iye$c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/jze$a;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/jze$a;-><init>(Ll/jze;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/iye$c;->a(Ll/iye$d;)Ll/iye$c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/iye;->g(Ll/iye$c;)Ll/iye;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final e()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/iye;->a()Ll/iye;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/iye;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
