.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VFrame_Shadow$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i9()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/ViewGroup;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j2:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v2, v2, Ll/z5h0;->m:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->f1:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 50
    .line 51
    iget-object v4, v2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->f1:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j2:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 60
    .line 61
    if-eqz v2, :cond_0

    .line 62
    .line 63
    iget-object p0, v5, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j2:Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-static {v5}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_1

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 81
    .line 82
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-nez p0, :cond_1

    .line 91
    .line 92
    move v1, v3

    .line 93
    :cond_1
    :goto_0
    invoke-virtual {v4, v0, v3, v1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->r(ZZZ)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/ViewGroup;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->f1:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->f1:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->u()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 46
    .line 47
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j2:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    const-string v4, "p_suggest_user_profile_info_view"

    .line 52
    .line 53
    invoke-virtual {v2, v3, v0, v1, v4}, Ll/bpe0;->c(Ljava/lang/String;IZLjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->id()V

    .line 59
    .line 60
    .line 61
    return-void
.end method
