.class public Ll/n03;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n03$a;
    }
.end annotation


# instance fields
.field public final a:Ll/loi;

.field public final b:Landroid/hardware/biometrics/BiometricManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x1d

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/n03$a;->b(Landroid/content/Context;)Landroid/hardware/biometrics/BiometricManager;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/n03;->b:Landroid/hardware/biometrics/BiometricManager;

    .line 16
    .line 17
    iput-object v2, p0, Ll/n03;->a:Ll/loi;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iput-object v2, p0, Ll/n03;->b:Landroid/hardware/biometrics/BiometricManager;

    .line 21
    .line 22
    invoke-static {p1}, Ll/loi;->c(Landroid/content/Context;)Ll/loi;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/n03;->a:Ll/loi;

    .line 27
    .line 28
    return-void
.end method

.method public static b(Landroid/content/Context;)Ll/n03;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/n03;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/n03;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/n03;->b:Landroid/hardware/biometrics/BiometricManager;

    .line 8
    .line 9
    invoke-static {p0}, Ll/n03$a;->a(Landroid/hardware/biometrics/BiometricManager;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/n03;->a:Ll/loi;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/loi;->f()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    const/16 p0, 0xc

    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    iget-object p0, p0, Ll/n03;->a:Ll/loi;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/loi;->e()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_2

    .line 32
    .line 33
    const/16 p0, 0xb

    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    return p0
.end method
