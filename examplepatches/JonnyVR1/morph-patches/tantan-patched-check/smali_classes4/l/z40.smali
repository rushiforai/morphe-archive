.class public Ll/z40;
.super Ll/y40;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/y40;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Landroid/os/IBinder;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ygl;->a()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    filled-new-array {p1, v0, v1, v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "finishActivity"

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Ll/puc0;->c(Ljava/lang/String;[Ljava/lang/Object;)Ll/puc0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public d(ILandroid/os/Message;)Landroid/os/IBinder;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/16 p0, 0x64

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-static {p0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "token"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/puc0;->e(Ljava/lang/String;)Ll/puc0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/os/IBinder;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object p0, p2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-static {p0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "arg1"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/puc0;->e(Ljava/lang/String;)Ll/puc0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Landroid/os/IBinder;

    .line 41
    .line 42
    return-object p0
.end method
