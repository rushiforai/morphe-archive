.class public Ll/zxv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/jl80;


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

.method public static synthetic a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 6
    .line 7
    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    .line 8
    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->l(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-interface {p2}, Ll/x20;->call()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Landroid/content/DialogInterface$OnCancelListener;Ljava/lang/Runnable;Ll/x20;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/zxv;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Ll/zxv;->a:Ll/jl80;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    return v2

    .line 21
    :cond_1
    new-instance v0, Ll/jl80$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    sget v3, Ll/gbc0;->q1:I

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v3, "\u5f00\u542f\u6743\u9650"

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v4, "\u5f00\u542f\u5b9a\u4f4d\u6743\u9650\u624d\u80fd\u627e\u5230\u9644\u8fd1\u7684\u4eba"

    .line 39
    .line 40
    invoke-virtual {v0, v4}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/yxv;

    .line 49
    .line 50
    invoke-direct {v1, p1, p0, p4}, Ll/yxv;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v3, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->a:I

    .line 58
    .line 59
    invoke-virtual {p0, p1, p3}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0, p2}, Ll/jl80$a;->l0(Landroid/content/DialogInterface$OnCancelListener;)Ll/jl80$a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sput-object p0, Ll/zxv;->a:Ll/jl80;

    .line 72
    .line 73
    return v2
.end method

.method public static c()Z
    .locals 2

    .line 1
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    .line 2
    .line 3
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method
