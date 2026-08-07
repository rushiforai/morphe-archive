.class public Lcom/p1/mobile/putong/core/ui/profile/loop/a;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/profile/loop/b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public c:I

.field public d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/data/User;

.field public j:Lcom/p1/mobile/putong/data/User;

.field public k:I

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Landroidx/fragment/app/Fragment;

.field public p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;",
            ">;"
        }
    .end annotation
.end field

.field public q:Z

.field public r:Ll/bqa0;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "profile_guide"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c:I

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 20
    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->k:I

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->l:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->m:Z

    .line 27
    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->n:Z

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->p:Ljava/util/ArrayList;

    .line 36
    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->q:Z

    .line 38
    .line 39
    return-void
.end method

.method private synthetic C0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Ll/tr90;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/b;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->r()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->Y0(Landroid/os/Bundle;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/b;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->e(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private S0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->new_()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/d0;->t4(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v2, Ll/apa0;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/apa0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v2, Ll/bpa0;

    .line 68
    .line 69
    invoke-direct {v2, p0, v1}, Ll/bpa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Lcom/p1/mobile/putong/data/User;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/cpa0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/cpa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Ll/dpa0;

    .line 86
    .line 87
    invoke-direct {v2, p0}, Ll/dpa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->s0()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private Y0(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    const-string v0, "ProfileInfoLoopEditAct_white_screen_issue_tracking"

    .line 2
    .line 3
    const-string v1, " showFragment entryType:"

    .line 4
    .line 5
    const-string v2, "loop_edit_entry_type"

    .line 6
    .line 7
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 12
    .line 13
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 14
    .line 15
    const-string v2, "loop_eidt_first_type"

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    const-string v2, "loop_edit_from"

    .line 26
    .line 27
    const-string v3, ""

    .line 28
    .line 29
    invoke-virtual {p1, v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 34
    .line 35
    const-string v2, "ext_value"

    .line 36
    .line 37
    invoke-virtual {p1, v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->g:Ljava/lang/String;

    .line 42
    .line 43
    const-string v2, "loop_edit_patch_flag"

    .line 44
    .line 45
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->n:Z

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 52
    .line 53
    if-nez v2, :cond_0

    .line 54
    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 56
    .line 57
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 58
    .line 59
    :cond_0
    invoke-static {}, Ll/xra;->j()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    const-string v3, "edit_profile"

    .line 64
    .line 65
    const-string v4, "profile_guide"

    .line 66
    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/a$a;->a:[I

    .line 70
    .line 71
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 72
    .line 73
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    aget v2, v2, v5

    .line 78
    .line 79
    packed-switch v2, :pswitch_data_0

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :pswitch_0
    const-string v2, "invisible_photo_profile"

    .line 84
    .line 85
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :pswitch_1
    const-string v2, "invisible_photo_card"

    .line 89
    .line 90
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :pswitch_2
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :pswitch_3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 97
    .line 98
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :pswitch_4
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 105
    .line 106
    sget-object v5, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 107
    .line 108
    if-ne v2, v5, :cond_2

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    move-object v3, v4

    .line 112
    :goto_0
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 113
    .line 114
    :goto_1
    invoke-static {}, Ll/xra;->f()Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_5

    .line 119
    .line 120
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 121
    .line 122
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_IDEAL_PROFILE_GUIDE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 123
    .line 124
    if-ne v2, v3, :cond_3

    .line 125
    .line 126
    const-string v2, "mytab_ideal_exposure"

    .line 127
    .line 128
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_IDEAL_OTHER_PROFILE_FEEDBACK:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 132
    .line 133
    if-ne v2, v3, :cond_4

    .line 134
    .line 135
    const-string v2, "match_satisfied"

    .line 136
    .line 137
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_IDEAL_PROFILE_ITEM:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 141
    .line 142
    if-ne v2, v3, :cond_5

    .line 143
    .line 144
    const-string v2, "check_other_ideal_type"

    .line 145
    .line 146
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 147
    .line 148
    :cond_5
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 149
    .line 150
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 151
    .line 152
    if-ne v2, v3, :cond_6

    .line 153
    .line 154
    const-string v2, "loop_create_from_page"

    .line 155
    .line 156
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    if-nez v3, :cond_6

    .line 165
    .line 166
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 171
    .line 172
    :cond_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 189
    .line 190
    :try_start_0
    new-instance p1, Ljava/lang/StringBuffer;

    .line 191
    .line 192
    invoke-direct {p1, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    .line 197
    const-string v2, "null"

    .line 198
    .line 199
    if-nez v1, :cond_7

    .line 200
    .line 201
    move-object v1, v2

    .line 202
    goto :goto_3

    .line 203
    :cond_7
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    :goto_3
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 208
    .line 209
    .line 210
    const-string v1, " firstShow:"

    .line 211
    .line 212
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 213
    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 216
    .line 217
    if-nez v1, :cond_8

    .line 218
    .line 219
    move-object v1, v2

    .line 220
    goto :goto_4

    .line 221
    :cond_8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 222
    .line 223
    :goto_4
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 224
    .line 225
    .line 226
    const-string v1, " oldUser:"

    .line 227
    .line 228
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 229
    .line 230
    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 232
    .line 233
    if-nez v1, :cond_9

    .line 234
    .line 235
    move-object v1, v2

    .line 236
    goto :goto_5

    .line 237
    :cond_9
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 238
    .line 239
    :goto_5
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 240
    .line 241
    .line 242
    const-string v1, " from:"

    .line 243
    .line 244
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 245
    .line 246
    .line 247
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 248
    .line 249
    if-nez v1, :cond_a

    .line 250
    .line 251
    goto :goto_6

    .line 252
    :cond_a
    move-object v2, v1

    .line 253
    :goto_6
    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 261
    .line 262
    .line 263
    :catch_0
    :try_start_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 264
    .line 265
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 266
    .line 267
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 268
    .line 269
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 270
    .line 271
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_b

    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 278
    .line 279
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 280
    .line 281
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 282
    .line 283
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 284
    .line 285
    if-nez p1, :cond_b

    .line 286
    .line 287
    const/4 p1, 0x0

    .line 288
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->l:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 289
    .line 290
    goto :goto_7

    .line 291
    :catch_1
    move-exception p1

    .line 292
    new-instance v1, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    const-string v2, " showFragment args: entryType: a null object reference +"

    .line 295
    .line 296
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    new-instance v1, Ljava/lang/NullPointerException;

    .line 310
    .line 311
    new-instance v2, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    const-string v3, "edit white screen = "

    .line 314
    .line 315
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    invoke-direct {v1, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 329
    .line 330
    .line 331
    :cond_b
    :goto_7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 344
    .line 345
    if-eqz p1, :cond_c

    .line 346
    .line 347
    new-instance p1, Ljava/lang/StringBuilder;

    .line 348
    .line 349
    const-string v1, " showFragment args: editUser:"

    .line 350
    .line 351
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 355
    .line 356
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 357
    .line 358
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    goto :goto_8

    .line 369
    :cond_c
    const-string p1, " showFragment args: editUser:null"

    .line 370
    .line 371
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    :goto_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 375
    .line 376
    const-string v0, "from_card_guide_improve_profile"

    .line 377
    .line 378
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 379
    .line 380
    .line 381
    move-result p1

    .line 382
    if-eqz p1, :cond_d

    .line 383
    .line 384
    const/4 p1, 0x1

    .line 385
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->n:Z

    .line 386
    .line 387
    :cond_d
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a1()V

    .line 388
    .line 389
    .line 390
    return-void

    .line 391
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private a1()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->l:Z

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->m:Z

    .line 10
    .line 11
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->C(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v2, "showNext showProgressAnim\uff1ashowList\u662f\u5426\u4e3a\u7a7a:"

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, "  orderList\u662f\u5426\u4e3a\u7a7a:"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, "ProfileInfoLoopEditAct_white_screen_issue_tracking"

    .line 52
    .line 53
    invoke-static {v2, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    const-string v3, "showNext showProgressAnim\uff1ashowList.size():"

    .line 63
    .line 64
    if-eqz v1, :cond_0

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    goto/16 :goto_2

    .line 72
    .line 73
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 74
    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v5, " showIndex:"

    .line 98
    .line 99
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-static {v2, v4}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    if-ltz v1, :cond_1

    .line 113
    .line 114
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    add-int/lit8 v4, v4, -0x1

    .line 121
    .line 122
    :goto_0
    if-le v4, v1, :cond_1

    .line 123
    .line 124
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    add-int/lit8 v4, v4, -0x1

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    new-instance v4, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v5, "showNext showProgressAnim\uff1aorderList.size():"

    .line 141
    .line 142
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v5, " orderIndex:"

    .line 153
    .line 154
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-static {v2, v4}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    if-ltz v1, :cond_3

    .line 168
    .line 169
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    if-ge v1, v4, :cond_3

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 180
    .line 181
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 182
    .line 183
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    if-gez v4, :cond_2

    .line 188
    .line 189
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    check-cast v5, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 196
    .line 197
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_3
    :goto_2
    const/4 v0, 0x0

    .line 204
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 205
    .line 206
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-ge v0, v1, :cond_5

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 219
    .line 220
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->p:Ljava/util/ArrayList;

    .line 221
    .line 222
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    if-gez v4, :cond_4

    .line 227
    .line 228
    goto :goto_4

    .line 229
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_5
    const/4 v1, 0x0

    .line 233
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    const-string v4, "showNext showProgressAnim\uff1ahasShowList.size():"

    .line 236
    .line 237
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->p:Ljava/util/ArrayList;

    .line 241
    .line 242
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 243
    .line 244
    .line 245
    move-result v4

    .line 246
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    const-string v4, " readyShow :"

    .line 250
    .line 251
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    if-nez v1, :cond_6

    .line 255
    .line 256
    const-string v4, "null"

    .line 257
    .line 258
    goto :goto_5

    .line 259
    :cond_6
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 260
    .line 261
    :goto_5
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c1()V

    .line 272
    .line 273
    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    .line 275
    .line 276
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 280
    .line 281
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    if-nez v1, :cond_9

    .line 296
    .line 297
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 298
    .line 299
    const-string v1, "serious_purpose_dialog"

    .line 300
    .line 301
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-nez v0, :cond_8

    .line 306
    .line 307
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 308
    .line 309
    const-string v1, "from_home_card_fake_build"

    .line 310
    .line 311
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-nez v0, :cond_8

    .line 316
    .line 317
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 318
    .line 319
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_INTL_FILL_INFO_KIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 320
    .line 321
    if-ne v0, v1, :cond_7

    .line 322
    .line 323
    goto :goto_6

    .line 324
    :cond_7
    const-string v0, "showNext saveAndFinish"

    .line 325
    .line 326
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->U0()V

    .line 330
    .line 331
    .line 332
    return-void

    .line 333
    :cond_8
    :goto_6
    const-string v0, "showNext onFakeComplete"

    .line 334
    .line 335
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->O0()V

    .line 339
    .line 340
    .line 341
    return-void

    .line 342
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 343
    .line 344
    const-string v3, "showNext showNextFragment: readyShow.title:"

    .line 345
    .line 346
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    iget-object v3, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b1(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 362
    .line 363
    .line 364
    return-void
.end method

.method private c1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c:I

    .line 12
    .line 13
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->k(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private d1()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->f0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->g0:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->g0:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->e0:I

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    new-instance v4, Ll/th0$a;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-direct {v4, v5}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v4, 0x0

    .line 55
    invoke-virtual {v1, v4}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/uoa0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/uoa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, v3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    new-instance v0, Ll/woa0;

    .line 81
    .line 82
    invoke-direct {v0}, Ll/woa0;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->L0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->E0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->I0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->D0()V

    return-void
.end method

.method private h1()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "specific_edit_page_name"

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v1, "e_edit_specific_profile_exit"

    .line 21
    .line 22
    invoke-static {v1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->H0(Ll/uxj0;)V

    return-void
.end method

.method private i1()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "specific_edit_page_name"

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v1, "e_edit_specific_profile_exit"

    .line 21
    .line 22
    invoke-static {v1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->J0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->G0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->F0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->C0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic n0(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-gt v0, v1, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr p0, v1

    .line 20
    if-ne v0, p0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->q0(Lcom/p1/mobile/putong/core/ui/profile/loop/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic D0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->Q0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic F0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->N0(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->isHit:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p2, p0}, Ll/bzw;->i(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;-><init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final synthetic H0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->V0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic I0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;->getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p1, v0}, Ll/wx6;->d(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->s:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->Y0:I

    .line 39
    .line 40
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string p1, "\u4e0a\u4f20\u5931\u8d25"

    .line 45
    .line 46
    invoke-static {p1}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->V0(Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic J0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->U0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final N0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->c3:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->i:I

    .line 30
    .line 31
    new-instance v1, Ll/epa0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/epa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public O0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->g1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P0(Z)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c:I

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->k:I

    .line 10
    .line 11
    add-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->k:I

    .line 14
    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a1()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final Q0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final R0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/yoa0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/yoa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/zoa0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/zoa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->Q0()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public U0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->S0()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 14
    .line 15
    .line 16
    new-instance v0, Landroid/content/Intent;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "loop_edit_user"

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    const-string v2, "saveAndFinish"

    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/a3b0;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/4 v2, -0x1

    .line 40
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public V0(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "loop_edit_user"

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    const-string v2, "saveAndFinish"

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/a3b0;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    const/4 p1, -0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    :goto_0
    invoke-virtual {v1, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public W0(Ll/bqa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->r:Ll/bqa0;

    .line 2
    .line 3
    return-void
.end method

.method public X0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->j(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xoa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/xoa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b1(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 14

    .line 1
    const-string v1, "ProfileInfoLoopEditAct_white_screen_issue_tracking"

    .line 2
    .line 3
    const-string v0, "null currentType.pageName:"

    .line 4
    .line 5
    const-string v2, "showNextFragment fragmentTransaction.commitAllowingStateLoss():hasShowList.size() :"

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->p:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->r0()Landroidx/fragment/app/e;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-object v5, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->fragmentClass:Ljava/lang/Class;

    .line 31
    .line 32
    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v6, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->fragmentClass:Ljava/lang/Class;

    .line 37
    .line 38
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    invoke-virtual {v3, v5, v6}, Landroidx/fragment/app/e;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->o:Landroidx/fragment/app/Fragment;

    .line 47
    .line 48
    instance-of v5, v3, Lcom/p1/mobile/android/app/Frag;

    .line 49
    .line 50
    if-eqz v5, :cond_0

    .line 51
    .line 52
    check-cast v3, Lcom/p1/mobile/android/app/Frag;

    .line 53
    .line 54
    new-instance v5, Ll/voa0;

    .line 55
    .line 56
    invoke-direct {v5, p0}, Ll/voa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, v5}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->o:Landroidx/fragment/app/Fragment;

    .line 63
    .line 64
    instance-of v3, v3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 65
    .line 66
    if-nez v3, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->o:Landroidx/fragment/app/Fragment;

    .line 76
    .line 77
    instance-of v5, v3, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;

    .line 78
    .line 79
    if-eqz v5, :cond_3

    .line 80
    .line 81
    move-object v6, v3

    .line 82
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;

    .line 83
    .line 84
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c:I

    .line 85
    .line 86
    iget v9, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->k:I

    .line 87
    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h:Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    const/4 v5, 0x1

    .line 95
    sub-int/2addr v3, v5

    .line 96
    if-ne v8, v3, :cond_2

    .line 97
    .line 98
    :goto_0
    move v10, v5

    .line 99
    goto :goto_1

    .line 100
    :cond_2
    const/4 v5, 0x0

    .line 101
    goto :goto_0

    .line 102
    :goto_1
    iget-object v11, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->a:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v12, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v13, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->g:Ljava/lang/String;

    .line 107
    .line 108
    move-object v7, p1

    .line 109
    invoke-virtual/range {v6 .. v13}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->a5(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;IIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->c:I

    .line 113
    .line 114
    const-string v3, "input_text"

    .line 115
    .line 116
    if-lez p1, :cond_4

    .line 117
    .line 118
    sget p1, Ll/z7c0;->e:I

    .line 119
    .line 120
    sget v5, Ll/z7c0;->f:I

    .line 121
    .line 122
    invoke-virtual {v4, p1, v5}, Landroidx/fragment/app/k;->u(II)Landroidx/fragment/app/k;

    .line 123
    .line 124
    .line 125
    sget p1, Ll/gdc0;->x:I

    .line 126
    .line 127
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->o:Landroidx/fragment/app/Fragment;

    .line 128
    .line 129
    invoke-virtual {v4, p1, v5, v3}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_4
    sget p1, Ll/gdc0;->x:I

    .line 134
    .line 135
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->o:Landroidx/fragment/app/Fragment;

    .line 136
    .line 137
    invoke-virtual {v4, p1, v5, v3}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 138
    .line 139
    .line 140
    :goto_2
    :try_start_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->p:Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v2, " currentType:"

    .line 155
    .line 156
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 160
    .line 161
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-eqz v2, :cond_5

    .line 166
    .line 167
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 168
    .line 169
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_5
    const-string v2, " null"

    .line 173
    .line 174
    :goto_3
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v2, " currentType.pageId:"

    .line 178
    .line 179
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 183
    .line 184
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    if-eqz v2, :cond_6

    .line 189
    .line 190
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 191
    .line 192
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 193
    .line 194
    goto :goto_5

    .line 195
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 201
    .line 202
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_7

    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageName:Ljava/lang/String;

    .line 211
    .line 212
    goto :goto_4

    .line 213
    :cond_7
    const-string p0, "null"

    .line 214
    .line 215
    :goto_4
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    :goto_5
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-static {v1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    .line 231
    .line 232
    :catch_0
    :try_start_1
    invoke-virtual {v4}, Landroidx/fragment/app/k;->j()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 233
    .line 234
    .line 235
    goto :goto_6

    .line 236
    :catch_1
    move-exception v0

    .line 237
    move-object p0, v0

    .line 238
    new-instance p1, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    const-string v0, "showNextFragment commitAllowingStateLoss \u5f02\u5e38"

    .line 241
    .line 242
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-static {v1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    :goto_6
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->l()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final f1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "from_explore_card"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "e_tantanx_pet_upload_normalguide_close"

    .line 12
    .line 13
    const-string v0, "p_tantanx_pet_photo_normalguide"

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public g1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "serious_purpose_dialog"

    .line 13
    .line 14
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "from_home_card_fake_build"

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_INTL_FILL_INFO_KIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 34
    .line 35
    if-ne v0, v1, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->R0(Lcom/p1/mobile/putong/data/User;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->Q0()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->R0(Lcom/p1/mobile/putong/data/User;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->R0(Lcom/p1/mobile/putong/data/User;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p0()Z
    .locals 9

    .line 1
    const-string v0, " backPress childCount:"

    .line 2
    .line 3
    const-string v1, " backPress user:"

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "input_text"

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->isVisible()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    :cond_0
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/b;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->i:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->g:Lcom/p1/mobile/putong/data/User;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    const-string v4, "ProfileInfoLoopEditAct_white_screen_issue_tracking"

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->g:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->toJson()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v4, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v4, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ljava/lang/RuntimeException;

    .line 80
    .line 81
    const-string v1, "ProfileInfoLoopEditAct_WhiteScreenIssue"

    .line 82
    .line 83
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 87
    .line 88
    .line 89
    :catch_0
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->h1()V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 93
    .line 94
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->l:Z

    .line 97
    .line 98
    iget-boolean v6, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->m:Z

    .line 99
    .line 100
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->j:Lcom/p1/mobile/putong/data/User;

    .line 103
    .line 104
    const/4 v3, 0x0

    .line 105
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->C(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_5

    .line 114
    .line 115
    invoke-static {}, Ll/xra;->j()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 122
    .line 123
    const-string v1, "from_card_upload_photo"

    .line 124
    .line 125
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_5

    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 132
    .line 133
    const-string v1, "from_explore_card"

    .line 134
    .line 135
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-nez v0, :cond_5

    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f:Ljava/lang/String;

    .line 142
    .line 143
    const-string v1, "from_profile_upload_photo"

    .line 144
    .line 145
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 153
    .line 154
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_INTL_FILL_INFO_KIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 155
    .line 156
    if-ne v0, v1, :cond_4

    .line 157
    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->O0()V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d1()V

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->s0()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->f1()V

    .line 170
    .line 171
    .line 172
    :goto_1
    const/4 p0, 0x1

    .line 173
    return p0
.end method

.method public q0(Lcom/p1/mobile/putong/core/ui/profile/loop/b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->r:Ll/bqa0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->r:Ll/bqa0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bqa0;->h1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public s0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t0()Landroidx/fragment/app/Fragment;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->o:Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    return-object p0
.end method

.method public u0()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public x0()Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    return-object p0
.end method

.method public y0()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->i:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public z0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_LIKE_COMPLETE_PROFILE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
