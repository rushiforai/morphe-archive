.class public Ll/lnf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/lnf;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/lnf;->b:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lnf;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/lnf;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput-boolean p1, p0, Ll/lnf;->a:Z

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "signature"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-boolean p1, p0, Ll/lnf;->a:Z

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Ll/lnf;->a:Z

    .line 15
    .line 16
    iget-object p1, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 17
    .line 18
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 25
    .line 26
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final d(Ljava/lang/String;)Z
    .locals 4

    .line 1
    const-string v0, "chat_complete_profile"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_CHAT_COMPLETE_PROFILE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    const-string v0, "mytab_complete_profile"

    .line 16
    .line 17
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MYTAB_COMPLETE_PROFILE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const-string v0, "left_swipe_complete_profile"

    .line 27
    .line 28
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_LEFT_SWIPE_COMPLETE_PROFILE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    const-string v0, "received_profile_like_not_null"

    .line 38
    .line 39
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_7

    .line 44
    .line 45
    const-string v0, "received_profile_like_is_null"

    .line 46
    .line 47
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    const-string v0, "from_ideal_type_mine_tab_guide"

    .line 55
    .line 56
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const-string v3, "from_ideal_guide_dialog"

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_IDEAL_PROFILE_GUIDE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 73
    .line 74
    invoke-static {p1, p0, v2, v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->U(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return v1

    .line 78
    :cond_4
    const-string v0, "from_ideal_type_other_profile"

    .line 79
    .line 80
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 93
    .line 94
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_IDEAL_OTHER_PROFILE_FEEDBACK:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 95
    .line 96
    invoke-static {p1, p0, v2, v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->U(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    return v1

    .line 100
    :cond_5
    const-string v0, "from_ideal_type_profile_item"

    .line 101
    .line 102
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_6

    .line 107
    .line 108
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 115
    .line 116
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_IDEAL_PROFILE_ITEM:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 117
    .line 118
    const-string v3, "from_ideal_guide_profile_item"

    .line 119
    .line 120
    invoke-static {p1, p0, v2, v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->U(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return v1

    .line 124
    :cond_6
    move-object v0, v2

    .line 125
    goto :goto_1

    .line 126
    :cond_7
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_LIKE_COMPLETE_PROFILE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 127
    .line 128
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-eqz v3, :cond_8

    .line 133
    .line 134
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    iget-object v3, v3, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 141
    .line 142
    invoke-static {v3, p0, v2, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->U(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return v1

    .line 146
    :cond_8
    const/4 p0, 0x0

    .line 147
    return p0
.end method

.method public e(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v0, "about_me"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x4

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v0, "company"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x3

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v0, "industry"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v1, 0x2

    .line 45
    goto :goto_0

    .line 46
    :sswitch_3
    const-string v0, "photo"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 v1, 0x1

    .line 56
    goto :goto_0

    .line 57
    :sswitch_4
    const-string v0, "school"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_4

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    const/4 v1, 0x0

    .line 67
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_0
    iget-object p1, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 72
    .line 73
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->ABOUT_ME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 80
    .line 81
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :pswitch_1
    iget-object p1, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 86
    .line 87
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->COMPANY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 94
    .line 95
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_2
    iget-object p1, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 100
    .line 101
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 106
    .line 107
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INDUSTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 108
    .line 109
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :pswitch_3
    iget-object p1, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 114
    .line 115
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 120
    .line 121
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PHOTO:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 122
    .line 123
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :pswitch_4
    iget-object p1, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 128
    .line 129
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object p0, p0, Ll/lnf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 134
    .line 135
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 136
    .line 137
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :sswitch_data_0
    .sparse-switch
        -0x361ea48c -> :sswitch_4
        0x65b3e32 -> :sswitch_3
        0x79441de -> :sswitch_2
        0x38a73c7d -> :sswitch_1
        0x6085878a -> :sswitch_0
    .end sparse-switch

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
