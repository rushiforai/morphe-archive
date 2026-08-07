.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/g6a0;",
        "Ll/p6a0;",
        ">;"
    }
.end annotation


# instance fields
.field public B:Ll/g6a0;

.field public C:Ll/p6a0;

.field public D:Ll/zq90;

.field public E:Ll/t3m;

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Ll/qmj0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->F:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->G:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->H:Z

    .line 10
    .line 11
    return-void
.end method

.method public static O4(Ljava/lang/String;ZZLjava/lang/String;ZZ)Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;
    .locals 1

    .line 1
    new-instance v0, Ll/qu90;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qu90;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Ll/qu90;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-boolean p2, v0, Ll/qu90;->c:Z

    .line 9
    .line 10
    iput-object p3, v0, Ll/qu90;->e:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p1, v0, Ll/qu90;->b:Z

    .line 13
    .line 14
    iput-boolean p4, v0, Ll/qu90;->f:Z

    .line 15
    .line 16
    const-string p0, "unknown_"

    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iput-object p0, v0, Ll/qu90;->g:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    iput-boolean p0, v0, Ll/qu90;->k:Z

    .line 26
    .line 27
    iput-boolean p5, v0, Ll/qu90;->l:Z

    .line 28
    .line 29
    const/4 p0, -0x1

    .line 30
    iput p0, v0, Ll/qu90;->m:I

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->P4(Ll/qu90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static P4(Ll/qu90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "user_id"

    .line 12
    .line 13
    iget-object v3, p0, Ll/qu90;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v2, "is_edit"

    .line 19
    .line 20
    iget-boolean v3, p0, Ll/qu90;->c:Z

    .line 21
    .line 22
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    const-string v2, "input_type"

    .line 26
    .line 27
    iget-object v3, p0, Ll/qu90;->d:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v2, "show_buttons"

    .line 33
    .line 34
    iget-boolean v3, p0, Ll/qu90;->b:Z

    .line 35
    .line 36
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    const-string v2, "canShowFollowButton"

    .line 40
    .line 41
    iget-boolean v3, p0, Ll/qu90;->l:Z

    .line 42
    .line 43
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    const-string v2, "no_showbuttons_infofromlocal"

    .line 47
    .line 48
    iget-boolean v3, p0, Ll/qu90;->j:Z

    .line 49
    .line 50
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    const-string v2, "from"

    .line 54
    .line 55
    iget-object v3, p0, Ll/qu90;->e:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const-string v2, "open_media_picker"

    .line 61
    .line 62
    iget-boolean v3, p0, Ll/qu90;->f:Z

    .line 63
    .line 64
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Ll/qu90;->g:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 68
    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const-string v3, "relationship_status"

    .line 74
    .line 75
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    const-string v2, "button_flag"

    .line 79
    .line 80
    iget v3, p0, Ll/qu90;->h:I

    .line 81
    .line 82
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    const-string v2, "with_superlike"

    .line 86
    .line 87
    iget-boolean v3, p0, Ll/qu90;->i:Z

    .line 88
    .line 89
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    .line 91
    .line 92
    const-string v2, "from_gp_live"

    .line 93
    .line 94
    iget-boolean v3, p0, Ll/qu90;->k:Z

    .line 95
    .line 96
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 97
    .line 98
    .line 99
    const-string v2, "pic_index"

    .line 100
    .line 101
    iget v3, p0, Ll/qu90;->m:I

    .line 102
    .line 103
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 104
    .line 105
    .line 106
    const-string v2, "pushReason"

    .line 107
    .line 108
    iget v3, p0, Ll/qu90;->o:I

    .line 109
    .line 110
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    const-string v2, "pushTag"

    .line 114
    .line 115
    iget-object v3, p0, Ll/qu90;->p:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const-string v2, "city_centre_data"

    .line 121
    .line 122
    iget-object v3, p0, Ll/qu90;->q:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 123
    .line 124
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 125
    .line 126
    .line 127
    const-string v2, "live_room_info"

    .line 128
    .line 129
    iget-object p0, p0, Ll/qu90;->r:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 135
    .line 136
    .line 137
    return-object v0
.end method


# virtual methods
.method public D4(Landroid/view/MotionEvent;Z)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->I:Ll/qmj0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/qmj0;->h(Landroid/view/MotionEvent;Z)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/app/PutongFrag;->D4(Landroid/view/MotionEvent;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->S4()Ll/g6a0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->T4()Ll/p6a0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final Q4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_3

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideInfo()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideDistance()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 47
    .line 48
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 49
    .line 50
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_3
    :goto_0
    return-object v0
.end method

.method public final R4(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/ve60;->d()Ll/ue60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ue60;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    const-string v0, "share_profile"

    .line 15
    .line 16
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const-string p0, "journey_new_share"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string v0, "from_find_partner"

    .line 26
    .line 27
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    const-string p0, "p_find_partner_mainpage"

    .line 34
    .line 35
    :cond_2
    return-object p0
.end method

.method public S4()Ll/g6a0;
    .locals 2

    .line 1
    new-instance v0, Ll/g6a0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/g6a0;-><init>(Ll/ner;Ll/zq90;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->B:Ll/g6a0;

    .line 9
    .line 10
    return-object v0
.end method

.method public T4()Ll/p6a0;
    .locals 4

    .line 1
    new-instance v0, Ll/p6a0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 4
    .line 5
    new-instance v2, Ll/lza0;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->E:Ll/t3m;

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ll/lza0;-><init>(Ll/t3m;)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->I:Ll/qmj0;

    .line 13
    .line 14
    invoke-direct {v0, p0, v1, v2, v3}, Ll/p6a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;Ll/zq90;Ll/lza0;Ll/qmj0;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->C:Ll/p6a0;

    .line 18
    .line 19
    return-object v0
.end method

.method public U4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->B:Ll/g6a0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g6a0;->m1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V4()Ll/g6a0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->B:Ll/g6a0;

    .line 2
    .line 3
    return-object p0
.end method

.method public W4()Ll/t3m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->E:Ll/t3m;

    .line 2
    .line 3
    return-object p0
.end method

.method public X4()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 15
    .line 16
    iget-object v1, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/report/f;->f(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 22
    .line 23
    iget-object v1, v0, Ll/zq90;->d:Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "home_card"

    .line 26
    .line 27
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const-string v2, "from_city_center_conv_banner"

    .line 34
    .line 35
    const-string v3, ""

    .line 36
    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 40
    .line 41
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 51
    .line 52
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 53
    .line 54
    const-string v4, "home_menu"

    .line 55
    .line 56
    invoke-static {v4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    const-string v0, "other"

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    move-object v0, v3

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    :goto_0
    const-string v0, "home"

    .line 68
    .line 69
    :goto_1
    new-instance v4, Lorg/json/JSONObject;

    .line 70
    .line 71
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 72
    .line 73
    .line 74
    :try_start_0
    const-string v5, "moments_user_id"

    .line 75
    .line 76
    invoke-virtual {v4, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    const-string v1, "source"

    .line 80
    .line 81
    invoke-virtual {v4, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    .line 83
    .line 84
    const-string v0, "is_myself"

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 87
    .line 88
    invoke-virtual {v1}, Ll/zq90;->K()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_3

    .line 93
    .line 94
    const-string v1, "true"

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_3
    const-string v1, "false"

    .line 98
    .line 99
    :goto_2
    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 107
    .line 108
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 109
    .line 110
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    const/4 v5, 0x0

    .line 119
    const/4 v6, 0x1

    .line 120
    if-eqz v1, :cond_8

    .line 121
    .line 122
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Location;->isHideUpdateTime()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-nez v1, :cond_6

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_4

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Ll/ina;->x3(Lcom/p1/mobile/putong/data/User;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_5

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_5
    invoke-static {}, Ll/pzi0;->o()J

    .line 149
    .line 150
    .line 151
    move-result-wide v7

    .line 152
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 153
    .line 154
    .line 155
    move-result-wide v9

    .line 156
    sub-long/2addr v7, v9

    .line 157
    const-wide/16 v9, 0x3e8

    .line 158
    .line 159
    div-long/2addr v7, v9

    .line 160
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    :cond_6
    :goto_3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    .line 166
    const-string v7, "is_match"

    .line 167
    .line 168
    if-eqz v1, :cond_7

    .line 169
    .line 170
    :try_start_1
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 171
    .line 172
    const-string v8, "matched"

    .line 173
    .line 174
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_7

    .line 179
    .line 180
    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 181
    .line 182
    .line 183
    goto :goto_4

    .line 184
    :cond_7
    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 185
    .line 186
    .line 187
    :goto_4
    const-string v1, "distance"

    .line 188
    .line 189
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->Q4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v4, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 194
    .line 195
    .line 196
    const-string v0, "lastactivity_time"

    .line 197
    .line 198
    invoke-virtual {v4, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    .line 200
    .line 201
    :cond_8
    const-string v0, "refer_source"

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 204
    .line 205
    iget-object v1, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->R4(Ljava/lang/String;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    .line 213
    .line 214
    const-string v0, "city_cover"

    .line 215
    .line 216
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 217
    .line 218
    iget-object v1, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 219
    .line 220
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_9

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 227
    .line 228
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 229
    .line 230
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-eqz v1, :cond_a

    .line 235
    .line 236
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 237
    .line 238
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 239
    .line 240
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isOnCityTop()Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    if-eqz v1, :cond_a

    .line 245
    .line 246
    :cond_9
    move v5, v6

    .line 247
    :cond_a
    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 248
    .line 249
    .line 250
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 251
    .line 252
    invoke-virtual {p0, v4}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 253
    .line 254
    .line 255
    return-void

    .line 256
    :catch_0
    move-exception p0

    .line 257
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 258
    .line 259
    .line 260
    return-void
.end method

.method public Y4()V
    .locals 0

    .line 1
    const-string p0, "android_back"

    .line 2
    .line 3
    invoke-static {p0}, Ll/pza0;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z4()Ll/p6a0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->C:Ll/p6a0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d4()V
    .locals 3

    .line 1
    new-instance v0, Ll/zq90;

    .line 2
    .line 3
    new-instance v1, Ll/ip90;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ip90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Ll/zq90;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ll/hp90;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/zq90;->d(Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/jpf0;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->D:Ll/zq90;

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ll/jpf0;-><init>(Ll/zq90;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->E:Ll/t3m;

    .line 28
    .line 29
    new-instance v0, Ll/qmj0;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-direct {v0, v1, v2}, Ll/qmj0;-><init>(Landroid/app/Activity;Z)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->I:Ll/qmj0;

    .line 40
    .line 41
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->d4()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->X4()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->C:Ll/p6a0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/p6a0;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->C:Ll/p6a0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/p6a0;->G(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->B:Ll/g6a0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->B:Ll/g6a0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g6a0;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
