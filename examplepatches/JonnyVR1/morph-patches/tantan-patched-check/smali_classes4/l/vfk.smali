.class public Ll/vfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vfk$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rfk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VLinear;

.field public c:Lv/VLinear;

.field public d:Lv/VImage;

.field public final e:Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;

.field public f:Ll/rfk;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vfk;->e:Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/vfk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vfk;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/vfk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vfk;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/vfk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vfk;->m(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/vfk;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vfk;->d:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic e(Ll/vfk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vfk;->c:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic f(Ll/vfk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vfk;->b:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic i(Ll/vfk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vfk;->a:Lv/VText;

    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfk;->e:Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfk;->f:Ll/rfk;

    .line 2
    .line 3
    const-string p1, "realname"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rfk;->g0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfk;->f:Ll/rfk;

    .line 2
    .line 3
    const-string p1, "anonymous"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rfk;->g0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vfk;->e:Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rfk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vfk;->k(Ll/rfk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vfk;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vfk$a;->a(Ll/vfk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/rfk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vfk;->f:Ll/rfk;

    .line 2
    .line 3
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vfk;->e:Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/vfk;->e:Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/vfk;->d:Lv/VImage;

    .line 23
    .line 24
    new-instance v1, Ll/sfk;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/sfk;-><init>(Ll/vfk;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/vfk;->b:Lv/VLinear;

    .line 33
    .line 34
    new-instance v1, Ll/tfk;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/tfk;-><init>(Ll/vfk;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/vfk;->c:Lv/VLinear;

    .line 43
    .line 44
    new-instance v1, Ll/ufk;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ufk;-><init>(Ll/vfk;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
