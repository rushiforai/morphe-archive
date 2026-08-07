.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public I:Ll/mna0;

.field public J:Ll/rna0;

.field public K:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->I:Ll/mna0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mna0;->i0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "type"

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->K:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public P4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rna0;->l(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T4(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->I:Ll/mna0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mna0;->j0(Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public X()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rna0;->k()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rna0;->B()V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public Y4(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/rna0;->x(Ljava/util/List;I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/mna0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/mna0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->I:Ll/mna0;

    .line 10
    .line 11
    new-instance v0, Ll/rna0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p0}, Ll/rna0;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->I:Ll/mna0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->I:Ll/mna0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/mna0;->Z()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public e5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rna0;->F()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->I:Ll/mna0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/mna0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public i5(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rna0;->G(Lcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->J:Ll/rna0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rna0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->h5()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->C:I

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "continuous_edit_complete_count"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->D:Z

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "continuous_edit_last_step"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->B:I

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "continuous_edit_step_num"

    .line 42
    .line 43
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v0, "edit_specific_profile_show_from"

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->E:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    const-string v0, "tantanx_scene_name"

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;->K:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-static {}, Ll/xra;->w()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_0

    .line 68
    .line 69
    const-string p0, "is_test_field_y"

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const-string p0, "is_test_field_n"

    .line 73
    .line 74
    :goto_0
    const-string v0, "is_test_field"

    .line 75
    .line 76
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p1, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
