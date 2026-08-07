.class public Ll/cva0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bva0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cva0;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cva0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;

    .line 7
    .line 8
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cva0;->c:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->m()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cva0;->c:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 7
    .line 8
    iget-object v1, p0, Ll/cva0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/cva0;->c:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->k()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/cva0;->c:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 21
    .line 22
    const-string v1, "\u7acb\u5373\u8ba4\u8bc1\uff0c\u83b7\u5f97\u7279\u6743"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/cva0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/cva0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ll/cva0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/cva0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const/4 v0, 0x1

    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->X0(Z)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cva0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dva0;->b(Ll/cva0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/bva0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Z
    .locals 4

    .line 1
    const-string v0, "e_go_verify"

    .line 2
    .line 3
    const-string v1, "p_avatar_verify"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string v3, "verified"

    .line 28
    .line 29
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const-string p0, "\u5df2\u8ba4\u8bc1"

    .line 36
    .line 37
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return v2

    .line 41
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 50
    .line 51
    const-string v1, "pending"

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    const-string p0, "\u6b63\u5728\u5ba1\u6838\u4e2d"

    .line 60
    .line 61
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return v2

    .line 65
    :cond_1
    iget-object p0, p0, Ll/cva0;->d:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    const-string v0, "tantan://verification/avatar"

    .line 68
    .line 69
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bva0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cva0;->b(Ll/bva0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cva0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/cva0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
