.class public Ll/odm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zdm0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/q5m0;

.field public b:Ll/pej0;

.field public c:Ll/zdm0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zdm0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/odm0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/odm0$a;-><init>(Ll/odm0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/odm0;->d:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/odm0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/odm0;->i(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/odm0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/odm0;->f(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/odm0;)Ll/zdm0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/odm0;->c:Ll/zdm0;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d(Ll/zdm0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zdm0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/odm0;->c:Ll/zdm0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/odm0;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/odm0;->b:Ll/pej0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic f(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/odm0;->b:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/odm0;->b:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zdm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/odm0;->d(Ll/zdm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isShowing()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/odm0;->a:Ll/q5m0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/odm0;->b:Ll/pej0;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public j(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/odm0;->a:Ll/q5m0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/odm0;->a:Ll/q5m0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/odm0;->c:Ll/zdm0;

    .line 12
    .line 13
    iget-object v2, v1, Ll/zdm0;->m:Ll/nsv;

    .line 14
    .line 15
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Ll/odm0;->d:Ll/y20;

    .line 22
    .line 23
    invoke-virtual {v0, p1, v1, v2, p0}, Ll/q5m0;->h(Ljava/util/List;Ll/zdm0;Ljava/lang/String;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/odm0;->b:Ll/pej0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/q5m0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/odm0;->c:Ll/zdm0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ll/q5m0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/odm0;->a:Ll/q5m0;

    .line 17
    .line 18
    new-instance v0, Ll/pej0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/odm0;->c:Ll/zdm0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Ll/jgc0;->d:I

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/odm0;->b:Ll/pej0;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/odm0;->b:Ll/pej0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/odm0;->a:Ll/q5m0;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/q5m0;->e()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/odm0;->b:Ll/pej0;

    .line 49
    .line 50
    new-instance v1, Ll/mdm0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/mdm0;-><init>(Ll/odm0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/odm0;->a:Ll/q5m0;

    .line 59
    .line 60
    new-instance v1, Ll/ndm0;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/ndm0;-><init>(Ll/odm0;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/q5m0;->i(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v0, p0, Ll/odm0;->a:Ll/q5m0;

    .line 69
    .line 70
    iget-object v1, p0, Ll/odm0;->c:Ll/zdm0;

    .line 71
    .line 72
    iget-object v2, v1, Ll/zdm0;->m:Ll/nsv;

    .line 73
    .line 74
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v3, p0, Ll/odm0;->d:Ll/y20;

    .line 81
    .line 82
    invoke-virtual {v0, p1, v1, v2, v3}, Ll/q5m0;->h(Ljava/util/List;Ll/zdm0;Ljava/lang/String;Ll/y20;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/odm0;->b:Ll/pej0;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 88
    .line 89
    .line 90
    return-void
.end method
