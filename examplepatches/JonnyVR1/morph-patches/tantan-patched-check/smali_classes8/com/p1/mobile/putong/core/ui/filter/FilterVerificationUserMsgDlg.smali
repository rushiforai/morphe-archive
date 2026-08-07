.class public Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;
.super Ll/pej0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lv/VSwitchButton;

.field public h:Lv/VFrame;

.field public i:Lv/VText;

.field public j:Landroid/widget/FrameLayout;

.field public k:Ll/l4g0;

.field public l:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/cgc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->CONV_LIST:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->f:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->l:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->q4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->O(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "p_settings_chat_to_verified"

    .line 31
    .line 32
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->k:Ll/l4g0;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    const-string p1, "default"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string p1, "pending_result"

    .line 44
    .line 45
    :goto_0
    const-string v2, "setting_chat_to_verified_page_status"

    .line 46
    .line 47
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-ne p2, v0, :cond_1

    .line 52
    .line 53
    const-string p2, "message_tab"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const-string p2, "chat_details"

    .line 57
    .line 58
    :goto_1
    const-string v0, "verify_to_chat_origin"

    .line 59
    .line 60
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v1, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->k:Ll/l4g0;

    .line 72
    .line 73
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 74
    .line 75
    .line 76
    sget p1, Ll/qec0;->w1:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 79
    .line 80
    .line 81
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->N()V

    .line 82
    .line 83
    .line 84
    new-instance p1, Ll/hni;

    .line 85
    .line 86
    invoke-direct {p1, p0}, Ll/hni;-><init>(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->S(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D([Ll/jl80;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 1

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v0, "verified"

    .line 20
    .line 21
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    aget-object v0, p0, p1

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    aget-object v0, p0, p1

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    aget-object p0, p0, p1

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public static synthetic E([Ll/kcg0;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    aget-object p0, p0, p3

    .line 3
    .line 4
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->MSG_PAGE:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 8
    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    invoke-static {p2}, Ll/w1e;->e(Ll/l4g0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->R(Ll/pf60;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p2, "messages_thumbnail_left"

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/clz;->v6(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string p0, "to_userid"

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    filled-new-array {p0}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "e_disable_chat_popup_photo"

    .line 29
    .line 30
    const-string p2, "p_disable_chat_lead_to_verify"

    .line 31
    .line 32
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic H([Ll/jl80;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-object p0, p0, p2

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static J(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p0}, Ll/r97;->J0(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;)Ll/jl80;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0, v0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;Ll/x20;)Ll/jl80;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;)Ll/jl80;
    .locals 1
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;Ll/x20;)Ll/jl80;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;Ll/x20;)Ll/jl80;
    .locals 19
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    new-instance v3, Ll/jl80$a;

    .line 8
    .line 9
    invoke-direct {v3, v0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    sget v5, Ll/qec0;->T3:I

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    const/4 v5, 0x1

    .line 24
    new-array v7, v5, [Ll/jl80;

    .line 25
    .line 26
    new-array v8, v5, [Ll/kcg0;

    .line 27
    .line 28
    sget v9, Ll/edc0;->S4:I

    .line 29
    .line 30
    invoke-virtual {v4, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v9

    .line 34
    check-cast v9, Lv/VText;

    .line 35
    .line 36
    sget v10, Ll/edc0;->Q0:I

    .line 37
    .line 38
    invoke-virtual {v4, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v10

    .line 42
    check-cast v10, Lv/VImage;

    .line 43
    .line 44
    sget v11, Ll/edc0;->b0:I

    .line 45
    .line 46
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v11

    .line 50
    check-cast v11, Lv/VText;

    .line 51
    .line 52
    sget v12, Ll/edc0;->I:I

    .line 53
    .line 54
    invoke-virtual {v4, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v12

    .line 58
    check-cast v12, Lv/VCheckBox;

    .line 59
    .line 60
    filled-new-array {v12}, [Lv/VCheckBox;

    .line 61
    .line 62
    .line 63
    move-result-object v12

    .line 64
    sget v13, Ll/edc0;->R3:I

    .line 65
    .line 66
    invoke-virtual {v4, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v13

    .line 70
    check-cast v13, Lv/VText;

    .line 71
    .line 72
    sget v14, Ll/edc0;->m4:I

    .line 73
    .line 74
    invoke-virtual {v4, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v14

    .line 78
    check-cast v14, Lv/VButton;

    .line 79
    .line 80
    sget v15, Ll/edc0;->f1:I

    .line 81
    .line 82
    invoke-virtual {v4, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v15

    .line 86
    check-cast v15, Lv/VDraweeView;

    .line 87
    .line 88
    sget-object v5, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->MSG_PAGE:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 89
    .line 90
    if-ne v1, v5, :cond_0

    .line 91
    .line 92
    const-string v16, "p_disable_chat_lead_to_verify"

    .line 93
    .line 94
    :goto_0
    move-object/from16 v6, v16

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_0
    const-string v16, "p_popup_verify_to_set"

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :goto_1
    const-class v16, Lcom/p1/mobile/android/app/Dialog;

    .line 101
    .line 102
    move-object/from16 v18, v8

    .line 103
    .line 104
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-static {v6, v8}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    move-object/from16 v16, v3

    .line 113
    .line 114
    const/4 v3, 0x1

    .line 115
    const/4 v8, 0x0

    .line 116
    invoke-virtual {v9, v8, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 117
    .line 118
    .line 119
    const/4 v3, 0x3

    .line 120
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    move/from16 v17, v3

    .line 125
    .line 126
    const/4 v3, 0x0

    .line 127
    invoke-virtual {v13, v8, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 128
    .line 129
    .line 130
    invoke-static/range {v17 .. v17}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    invoke-virtual {v14, v8, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 135
    .line 136
    .line 137
    if-ne v1, v5, :cond_2

    .line 138
    .line 139
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v8

    .line 143
    if-eqz v8, :cond_2

    .line 144
    .line 145
    const-string v8, "to_userid"

    .line 146
    .line 147
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v8, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    filled-new-array {v3}, [Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-virtual {v6, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 158
    .line 159
    .line 160
    const-string v3, "\u5bf9\u65b9\u5e0c\u671b\u4f60\u5b8c\u6210\u8ba4\u8bc1"

    .line 161
    .line 162
    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    new-instance v3, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    const-string v8, "\u5bf9\u65b9\u8bbe\u7f6e\u4e86\u53ea\u63a5\u6536\u8ba4\u8bc1\u7528\u6237\u7684\u6d88\u606f\uff0c\u4ec5\u9700\u51e0\u6b65\u5b8c\u6210\u9a8c\u8bc1\uff0c\u5373\u523b\u4e0e"

    .line 168
    .line 169
    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    if-eqz v8, :cond_1

    .line 177
    .line 178
    const-string v8, "\u5979"

    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_1
    const-string v8, "\u4ed6"

    .line 182
    .line 183
    :goto_2
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v8, "\u5f00\u59cb\u4e92\u52a8"

    .line 187
    .line 188
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-virtual {v11, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 203
    .line 204
    const/high16 v8, 0x42c80000    # 100.0f

    .line 205
    .line 206
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 207
    .line 208
    .line 209
    move-result v8

    .line 210
    iput v8, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 211
    .line 212
    iput v8, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 213
    .line 214
    const/high16 v8, 0x42100000    # 36.0f

    .line 215
    .line 216
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 217
    .line 218
    .line 219
    move-result v8

    .line 220
    iput v8, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 221
    .line 222
    const/high16 v8, 0x41d00000    # 26.0f

    .line 223
    .line 224
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 225
    .line 226
    .line 227
    move-result v8

    .line 228
    iput v8, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 229
    .line 230
    invoke-virtual {v15, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    .line 232
    .line 233
    new-instance v3, Lcom/facebook/drawee/generic/RoundingParams;

    .line 234
    .line 235
    invoke-direct {v3}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 236
    .line 237
    .line 238
    const/4 v8, 0x1

    .line 239
    invoke-virtual {v3, v8}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v15}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 243
    .line 244
    .line 245
    move-result-object v8

    .line 246
    check-cast v8, Ll/wlj;

    .line 247
    .line 248
    invoke-virtual {v8, v3}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 249
    .line 250
    .line 251
    new-instance v3, Ll/bni;

    .line 252
    .line 253
    invoke-direct {v3, v0, v2}, Ll/bni;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 254
    .line 255
    .line 256
    invoke-static {v15, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 257
    .line 258
    .line 259
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 260
    .line 261
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    invoke-virtual {v3, v15, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    goto :goto_3

    .line 277
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->CONV_LIST:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 278
    .line 279
    if-eq v1, v2, :cond_3

    .line 280
    .line 281
    sget-object v2, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->MSG_DEEPLINK:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 282
    .line 283
    if-eq v1, v2, :cond_3

    .line 284
    .line 285
    sget-object v2, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->SETTING_PAGE:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 286
    .line 287
    if-ne v1, v2, :cond_4

    .line 288
    .line 289
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    invoke-interface {v2}, Ll/r97;->R5()I

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    invoke-virtual {v15, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 302
    .line 303
    .line 304
    const-string v2, "\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1"

    .line 305
    .line 306
    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 307
    .line 308
    .line 309
    const-string v2, "\u5b8c\u6210\u8ba4\u8bc1\u540e\uff0c\u53ef\u8bbe\u7f6e\u53ea\u548c\u5b8c\u6210\u8ba4\u8bc1\u7684\u7528\u6237\u804a\u5929"

    .line 310
    .line 311
    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    .line 313
    .line 314
    :cond_4
    :goto_3
    invoke-static {v6}, Ll/w1e;->f(Ll/l4g0;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->B6:I

    .line 322
    .line 323
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    new-instance v3, Ljava/lang/StringBuilder;

    .line 328
    .line 329
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 333
    .line 334
    .line 335
    move-result-object v8

    .line 336
    sget v9, Lcom/p1/mobile/putong/core/message/R$string;->t5:I

    .line 337
    .line 338
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v8

    .line 342
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    invoke-virtual {v13, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    .line 354
    .line 355
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 356
    .line 357
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 358
    .line 359
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/d0;->q4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->O(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Z

    .line 364
    .line 365
    .line 366
    move-result v3

    .line 367
    new-instance v8, Ll/bm5;

    .line 368
    .line 369
    const/4 v9, 0x1

    .line 370
    invoke-direct {v8, v0, v9}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 371
    .line 372
    .line 373
    new-instance v9, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;

    .line 374
    .line 375
    invoke-direct {v9, v8, v3, v1, v12}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;-><init>(Ll/bm5;ZLcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;[Lv/VCheckBox;)V

    .line 376
    .line 377
    .line 378
    invoke-virtual {v8, v9}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 379
    .line 380
    .line 381
    const-string v9, "#FE7E1D"

    .line 382
    .line 383
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 384
    .line 385
    .line 386
    move-result v9

    .line 387
    new-instance v11, Ll/cni;

    .line 388
    .line 389
    invoke-direct {v11, v8}, Ll/cni;-><init>(Ll/bm5;)V

    .line 390
    .line 391
    .line 392
    invoke-static {v13, v2, v9, v11}, Ll/fsj0;->a(Landroid/widget/TextView;Ljava/lang/String;ILl/x20;)V

    .line 393
    .line 394
    .line 395
    new-instance v2, Ll/dni;

    .line 396
    .line 397
    move-object/from16 v8, p3

    .line 398
    .line 399
    invoke-direct {v2, v7, v8}, Ll/dni;-><init>([Ll/jl80;Ll/x20;)V

    .line 400
    .line 401
    .line 402
    invoke-static {v10, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 403
    .line 404
    .line 405
    new-instance v2, Ll/eni;

    .line 406
    .line 407
    invoke-direct {v2, v12, v1, v7, v0}, Ll/eni;-><init>([Lv/VCheckBox;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;[Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 408
    .line 409
    .line 410
    invoke-static {v14, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 411
    .line 412
    .line 413
    if-ne v1, v5, :cond_5

    .line 414
    .line 415
    if-eqz v3, :cond_5

    .line 416
    .line 417
    const/4 v2, 0x0

    .line 418
    invoke-virtual {v14, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 419
    .line 420
    .line 421
    const-string v3, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d"

    .line 422
    .line 423
    invoke-virtual {v14, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 424
    .line 425
    .line 426
    aget-object v3, v12, v2

    .line 427
    .line 428
    invoke-virtual {v3, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 429
    .line 430
    .line 431
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    sget v5, Ll/g9c0;->t:I

    .line 436
    .line 437
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 438
    .line 439
    .line 440
    move-result v3

    .line 441
    invoke-virtual {v14, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 442
    .line 443
    .line 444
    sget v3, Ll/ibc0;->p5:I

    .line 445
    .line 446
    invoke-virtual {v14, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 447
    .line 448
    .line 449
    :goto_4
    move-object/from16 v3, v16

    .line 450
    .line 451
    goto :goto_5

    .line 452
    :cond_5
    const/4 v2, 0x0

    .line 453
    goto :goto_4

    .line 454
    :goto_5
    invoke-virtual {v3, v4}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 455
    .line 456
    .line 457
    move-result-object v3

    .line 458
    invoke-virtual {v3, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 459
    .line 460
    .line 461
    move-result-object v3

    .line 462
    new-instance v4, Ll/fni;

    .line 463
    .line 464
    move-object/from16 v5, v18

    .line 465
    .line 466
    invoke-direct {v4, v5, v1, v6}, Ll/fni;-><init>([Ll/kcg0;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Ll/l4g0;)V

    .line 467
    .line 468
    .line 469
    invoke-virtual {v3, v4}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 470
    .line 471
    .line 472
    move-result-object v1

    .line 473
    invoke-virtual {v1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 474
    .line 475
    .line 476
    move-result-object v1

    .line 477
    aput-object v1, v7, v2

    .line 478
    .line 479
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 480
    .line 481
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 482
    .line 483
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    new-instance v1, Ll/gni;

    .line 492
    .line 493
    invoke-direct {v1, v7}, Ll/gni;-><init>([Ll/jl80;)V

    .line 494
    .line 495
    .line 496
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    aput-object v0, v5, v2

    .line 505
    .line 506
    aget-object v0, v7, v2

    .line 507
    .line 508
    return-object v0
.end method

.method private N()V
    .locals 4

    .line 1
    sget v0, Ll/edc0;->Q0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VImage;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ll/r97;->m5()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    sget v1, Ll/edc0;->S2:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lv/VSwitchButton;

    .line 31
    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->g:Lv/VSwitchButton;

    .line 33
    .line 34
    sget v1, Ll/edc0;->h3:I

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lv/VText;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->i:Lv/VText;

    .line 43
    .line 44
    sget v1, Ll/edc0;->Q2:I

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/widget/FrameLayout;

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->j:Landroid/widget/FrameLayout;

    .line 53
    .line 54
    sget v1, Ll/edc0;->R2:I

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lv/VFrame;

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->h:Lv/VFrame;

    .line 63
    .line 64
    sget v1, Ll/edc0;->R0:I

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lv/VText;

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/ini;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/ini;-><init>(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->h:Lv/VFrame;

    .line 86
    .line 87
    new-instance v1, Ll/jni;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/jni;-><init>(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    new-instance v2, Ll/ro6;

    .line 112
    .line 113
    invoke-direct {v2}, Ll/ro6;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p0, v0}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/kni;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/kni;-><init>(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    sget v0, Lcom/google/android/material/R$id;->design_bottom_sheet:I

    .line 137
    .line 138
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const/4 v1, 0x3

    .line 147
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    const/16 v0, 0x10

    .line 155
    .line 156
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public static O(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v1, "pending"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 30
    .line 31
    const-string v0, "prePending"

    .line 32
    .line 33
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    :cond_0
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x([Lv/VCheckBox;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;[Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p4, 0x0

    .line 2
    aget-object p0, p0, p4

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const-string p0, "\u8bf7\u5148\u52fe\u9009\u5e76\u540c\u610f\u300a\u8ba4\u8bc1\u534f\u8bae\u300b\u540e\u518d\u8fdb\u884c\u8ba4\u8bc1\u54e6~"

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->q4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->O(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const-string p0, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->MSG_PAGE:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 37
    .line 38
    const-string v0, "e_start_verification"

    .line 39
    .line 40
    if-ne p1, p0, :cond_2

    .line 41
    .line 42
    const-string v1, "p_disable_chat_lead_to_verify"

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const-string v1, "p_popup_verify_to_set"

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    if-eq p1, p0, :cond_3

    .line 54
    .line 55
    aget-object p0, p2, p4

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 58
    .line 59
    .line 60
    :cond_3
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->J(Lcom/p1/mobile/android/app/Act;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/bm5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bm5;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final I()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->O(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 27
    .line 28
    const-string v2, "verified"

    .line 29
    .line 30
    invoke-static {v2}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isOpenFilterVeriMsg()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    xor-int/lit8 v0, v0, 0x1

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->T(Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->f:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->l:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 64
    .line 65
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;)Ll/jl80;

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->f:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->l:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 75
    .line 76
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;)Ll/jl80;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic R(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->O(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->i:Lv/VText;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->j:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->j:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->g:Lv/VSwitchButton;

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/dkb;->g8()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic S(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->k:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final T(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "on"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "off"

    .line 7
    .line 8
    :goto_0
    const-string v0, "after_status"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_chat_to_verified_switch"

    .line 19
    .line 20
    const-string v1, "p_settings_chat_to_verified"

    .line 21
    .line 22
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/dkb;->B9(Z)Lrx/c;

    .line 30
    .line 31
    .line 32
    return-void
.end method
