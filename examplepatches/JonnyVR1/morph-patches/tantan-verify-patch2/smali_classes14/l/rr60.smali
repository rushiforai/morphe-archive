.class public Ll/rr60;
.super Ll/lbl0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/rr60;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rr60;->m(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic l(Ll/rr60;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rr60;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "android.permission.CAMERA"

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->q(Ljava/util/List;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/pr60;

    .line 42
    .line 43
    invoke-direct {v1, p0, p1}, Ll/pr60;-><init>(Ll/rr60;Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/qr60;

    .line 47
    .line 48
    invoke-direct {v2, p0, p1}, Ll/qr60;-><init>(Ll/rr60;Lcom/p1/mobile/android/app/Act;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "phonePermission"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic m(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "cancel"

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/lbl0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
