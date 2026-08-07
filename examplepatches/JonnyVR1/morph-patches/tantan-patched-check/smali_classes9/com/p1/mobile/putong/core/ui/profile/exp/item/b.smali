.class public Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# static fields
.field public static E:Ll/l4g0;


# instance fields
.field public A:Lv/VSwitchButton;

.field public B:Z

.field public C:Ll/t4m;

.field public D:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public u:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

.field public x:Landroid/view/View;

.field public y:Z

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_edit_profile_post_pic_popup"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E:Ll/l4g0;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 1
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/vxd0;

    .line 5
    .line 6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "show_pic_post_dialog_count_"

    .line 9
    .line 10
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->u:Ll/vxd0;

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->B:Z

    .line 35
    .line 36
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b$a;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C:Ll/t4m;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->p0(Z)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->q0(Z)V

    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->s0()V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->o0(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 6
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;ILjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->t0(ILjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w0()V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->r0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;I)V

    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->u0(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->n0(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    return-void
.end method

.method public static bridge synthetic d0(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->z0()V

    return-void
.end method

.method public static x0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static y0(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v2, "passive"

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "popup_times"

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v1, p0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, "p_edit_profile_post_pic_popup"

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E:Ll/l4g0;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E:Ll/l4g0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 49
    .line 50
    .line 51
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E:Ll/l4g0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public A0(ILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/xcf;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/xcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->r(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public B0(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->z:Z

    .line 5
    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A:Lv/VSwitchButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A:Lv/VSwitchButton;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public C0()I
    .locals 7

    .line 1
    invoke-static {}, Ll/xra;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "ProfileListFrag editingUser is null when edit pic"

    .line 6
    .line 7
    const-string v2, "normal"

    .line 8
    .line 9
    const-string v3, "The first pic cannot be empty\uff01"

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    if-eqz v0, :cond_7

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    if-eqz v5, :cond_10

    .line 21
    .line 22
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    check-cast v5, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 27
    .line 28
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-eqz v5, :cond_0

    .line 33
    .line 34
    new-instance v5, Ljava/lang/NullPointerException;

    .line 35
    .line 36
    invoke-direct {v5, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    move v5, v4

    .line 48
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-ge v4, v6, :cond_2

    .line 53
    .line 54
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 59
    .line 60
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    if-eqz v6, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 71
    .line 72
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 84
    .line 85
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 90
    .line 91
    invoke-static {v6, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v6

    .line 95
    if-nez v6, :cond_1

    .line 96
    .line 97
    add-int/lit8 v5, v5, 0x1

    .line 98
    .line 99
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    iget-object v2, v2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-nez v2, :cond_3

    .line 117
    .line 118
    new-instance v2, Ljava/lang/NullPointerException;

    .line 119
    .line 120
    invoke-direct {v2, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 133
    .line 134
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iput-object v2, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 143
    .line 144
    :cond_3
    if-lez v0, :cond_4

    .line 145
    .line 146
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 151
    .line 152
    iput-object v3, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_4
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 160
    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 162
    .line 163
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_5

    .line 168
    .line 169
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 184
    .line 185
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 186
    .line 187
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->D:Ll/y20;

    .line 188
    .line 189
    if-eqz p0, :cond_6

    .line 190
    .line 191
    invoke-interface {p0, v3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    :cond_6
    return v5

    .line 195
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 196
    .line 197
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    if-eqz v5, :cond_10

    .line 202
    .line 203
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    check-cast v5, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 208
    .line 209
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    if-eqz v5, :cond_8

    .line 214
    .line 215
    new-instance v5, Ljava/lang/NullPointerException;

    .line 216
    .line 217
    invoke-direct {v5, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-static {v5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 221
    .line 222
    .line 223
    :cond_8
    new-instance v3, Ljava/util/ArrayList;

    .line 224
    .line 225
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 226
    .line 227
    .line 228
    move v5, v4

    .line 229
    :goto_2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 230
    .line 231
    .line 232
    move-result v6

    .line 233
    if-ge v4, v6, :cond_a

    .line 234
    .line 235
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 236
    .line 237
    .line 238
    move-result-object v6

    .line 239
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 240
    .line 241
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 242
    .line 243
    .line 244
    move-result v6

    .line 245
    if-nez v6, :cond_a

    .line 246
    .line 247
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 248
    .line 249
    .line 250
    move-result-object v6

    .line 251
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 252
    .line 253
    iget-object v6, v6, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 254
    .line 255
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 263
    .line 264
    iget-object v6, v6, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 265
    .line 266
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 267
    .line 268
    invoke-static {v6, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 269
    .line 270
    .line 271
    move-result v6

    .line 272
    if-nez v6, :cond_9

    .line 273
    .line 274
    add-int/lit8 v5, v5, 0x1

    .line 275
    .line 276
    :cond_9
    add-int/lit8 v4, v4, 0x1

    .line 277
    .line 278
    goto :goto_2

    .line 279
    :cond_a
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 280
    .line 281
    .line 282
    move-result v2

    .line 283
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 284
    .line 285
    .line 286
    move-result-object v4

    .line 287
    iget-object v4, v4, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 288
    .line 289
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    if-nez v4, :cond_b

    .line 294
    .line 295
    new-instance v4, Ljava/lang/NullPointerException;

    .line 296
    .line 297
    invoke-direct {v4, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 301
    .line 302
    .line 303
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 308
    .line 309
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 310
    .line 311
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 312
    .line 313
    .line 314
    move-result-object v4

    .line 315
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    iput-object v4, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 320
    .line 321
    :cond_b
    if-lez v2, :cond_c

    .line 322
    .line 323
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    iget-object v1, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 328
    .line 329
    iput-object v3, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 330
    .line 331
    goto :goto_3

    .line 332
    :cond_c
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    iget-object v1, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 337
    .line 338
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 339
    .line 340
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    if-eqz v1, :cond_d

    .line 345
    .line 346
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    iget-object v1, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 351
    .line 352
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 353
    .line 354
    .line 355
    move-result-object v4

    .line 356
    invoke-interface {v4}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 361
    .line 362
    iput-object v4, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 363
    .line 364
    :cond_d
    :goto_3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    if-gt v2, v1, :cond_e

    .line 369
    .line 370
    const/4 v1, 0x0

    .line 371
    invoke-virtual {p0, v2, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->F0(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;)V

    .line 372
    .line 373
    .line 374
    :cond_e
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E()V

    .line 375
    .line 376
    .line 377
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->D:Ll/y20;

    .line 378
    .line 379
    if-eqz p0, :cond_f

    .line 380
    .line 381
    invoke-interface {p0, v3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 382
    .line 383
    .line 384
    :cond_f
    return v5

    .line 385
    :cond_10
    return v4
.end method

.method public D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MomentSwitch;->noSyncMoment:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->h0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const-string p0, "false"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p0, "true"

    .line 28
    .line 29
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MomentSwitch;->noSyncMoment:Ljava/util/List;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-interface {p1, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public E()V
    .locals 8

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->E()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    check-cast v4, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-lez v4, :cond_0

    .line 35
    .line 36
    add-int/lit8 v3, v3, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    move v4, v2

    .line 48
    move v5, v4

    .line 49
    :goto_1
    iget-object v6, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-ge v4, v6, :cond_2

    .line 64
    .line 65
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    check-cast v6, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    add-int/2addr v5, v6

    .line 76
    add-int/lit8 v4, v4, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    move v4, v2

    .line 80
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-ge v2, v6, :cond_3

    .line 85
    .line 86
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    check-cast v6, Ljava/lang/Integer;

    .line 91
    .line 92
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    add-int/2addr v4, v6

    .line 97
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_3
    const-string v0, ""

    .line 101
    .line 102
    if-eq v4, v5, :cond_4

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    sub-int/2addr v3, v1

    .line 111
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const-string v2, "\u6dfb\u52a0%s\u5f20\u7167\u7247"

    .line 120
    .line 121
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    goto :goto_3

    .line 126
    :cond_4
    move-object v1, v0

    .line 127
    :goto_3
    invoke-virtual {p0, v5, v4, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->P(IILjava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final E0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/xra;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const/high16 v2, 0x3f000000    # 0.5f

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setZ(F)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Landroid/graphics/PointF;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 19
    .line 20
    .line 21
    iput v2, v0, Landroid/graphics/PointF;->x:F

    .line 22
    .line 23
    iput v2, v0, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 26
    .line 27
    sget v2, Ll/adc0;->N5:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ll/wlj;

    .line 40
    .line 41
    sget-object v2, Ll/h1e0;->j:Ll/h1e0;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ll/wlj;->w(Ll/h1e0;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 47
    .line 48
    sget v2, Ll/adc0;->N5:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Ll/wlj;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ll/wlj;->v(Landroid/graphics/PointF;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C:Ll/t4m;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 74
    .line 75
    new-instance v1, Ll/fdf;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/fdf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setOnMediaChanged(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/view/View;->setZ(F)V

    .line 87
    .line 88
    .line 89
    new-instance v0, Landroid/graphics/PointF;

    .line 90
    .line 91
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 92
    .line 93
    .line 94
    iput v2, v0, Landroid/graphics/PointF;->x:F

    .line 95
    .line 96
    iput v2, v0, Landroid/graphics/PointF;->y:F

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 99
    .line 100
    sget v2, Ll/adc0;->N5:I

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 107
    .line 108
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Ll/wlj;

    .line 113
    .line 114
    sget-object v2, Ll/h1e0;->j:Ll/h1e0;

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Ll/wlj;->w(Ll/h1e0;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 120
    .line 121
    sget v2, Ll/adc0;->N5:I

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Ll/wlj;

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Ll/wlj;->v(Landroid/graphics/PointF;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C:Ll/t4m;

    .line 139
    .line 140
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_1

    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C:Ll/t4m;

    .line 149
    .line 150
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setReorderCardsCallback(Ll/t4m;)V

    .line 151
    .line 152
    .line 153
    :cond_1
    return-void
.end method

.method public final F0(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    add-int/lit8 p0, p0, -0x1

    .line 13
    .line 14
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->o1(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->o1(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/lit8 p0, p0, -0x1

    .line 38
    .line 39
    if-ge p1, p0, :cond_1

    .line 40
    .line 41
    add-int/lit8 p0, p1, 0x1

    .line 42
    .line 43
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->o1(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    if-lez p1, :cond_2

    .line 53
    .line 54
    add-int/lit8 p1, p1, -0x1

    .line 55
    .line 56
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->o1(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public e0(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->D:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public f0(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->l0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->k0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v2, Ll/kec0;->B8:I

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->g0()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->s(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->u:Ll/vxd0;

    .line 45
    .line 46
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->u:Ll/vxd0;

    .line 57
    .line 58
    const/4 v4, 0x1

    .line 59
    add-int/2addr v2, v4

    .line 60
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v3, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    new-instance v2, Ll/jl80$a;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-interface {v3}, Ll/nol;->act()Landroid/app/Activity;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-direct {v2, v3}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sget v2, Lcom/p1/mobile/putong/core/R$string;->h5:I

    .line 85
    .line 86
    new-array v3, v1, [Ljava/lang/Object;

    .line 87
    .line 88
    invoke-virtual {v0, v2, v3}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget v2, Lcom/p1/mobile/putong/core/R$string;->i5:I

    .line 93
    .line 94
    new-array v3, v1, [Ljava/lang/Object;

    .line 95
    .line 96
    invoke-virtual {v0, v2, v3}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    sget v2, Ll/qa00;->g:I

    .line 101
    .line 102
    sget v3, Ll/qa00;->q:I

    .line 103
    .line 104
    invoke-virtual {v0, v2, v3}, Ll/jl80$a;->u0(II)Ll/jl80$a;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    sget v1, Lcom/p1/mobile/putong/core/R$string;->f5:I

    .line 113
    .line 114
    new-instance v2, Ll/vcf;

    .line 115
    .line 116
    invoke-direct {v2, p0, p1}, Ll/vcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget v1, Lcom/p1/mobile/putong/core/R$string;->g5:I

    .line 124
    .line 125
    new-instance v2, Ll/wcf;

    .line 126
    .line 127
    invoke-direct {v2, p0, p1}, Ll/wcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->f0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    sget v0, Ll/dbc0;->Xj:I

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ll/jl80$a;->i0(I)Ll/jl80$a;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->u:Ll/vxd0;

    .line 144
    .line 145
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    check-cast p0, Ljava/lang/Integer;

    .line 150
    .line 151
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y0(I)V

    .line 156
    .line 157
    .line 158
    return v4

    .line 159
    :cond_0
    return v1
.end method

.method public final g0()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/xra;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v2, v1, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->m0()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-ge v2, v1, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->getAddPhotos()Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-lez v1, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->getAddPhotos()Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 96
    .line 97
    .line 98
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    return-object v0
.end method

.method public h0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public i0(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->k0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->h0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/aw90;->d:Lrx/subjects/b;

    .line 20
    .line 21
    sget p1, Ll/ml70;->c:I

    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-object p0, p0, Ll/aw90;->e:Lrx/subjects/a;

    .line 35
    .line 36
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    if-nez p2, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Ll/aw90;->d:Lrx/subjects/b;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_1

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 57
    .line 58
    const-string p2, "audit"

    .line 59
    .line 60
    invoke-static {p2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    sget p1, Ll/ml70;->d:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    sget p1, Ll/ml70;->e:I

    .line 74
    .line 75
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public j0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public final k0()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/xra;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    move v0, v1

    .line 18
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-ge v0, v3, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->m0()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    return v2

    .line 37
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    move v0, v1

    .line 49
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ge v0, v3, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->y0()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_2

    .line 66
    .line 67
    return v2

    .line 68
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    return v1
.end method

.method public l0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Bj()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u751f\u6d3b\u7167"

    .line 2
    .line 3
    return-object p0
.end method

.method public final m0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p3}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/gdf;

    .line 16
    .line 17
    invoke-direct {v2, p0, p2, p3, v0}, Ll/gdf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;I)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    invoke-static {p1, v1, p0, v2, p0}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->w2(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "pic"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->B0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    new-array p0, p0, [Ll/sfj0$a;

    .line 10
    .line 11
    const-string p1, "e_edit_profile_post_pic_popup_confirm"

    .line 12
    .line 13
    const-string v0, "p_edit_profile_post_pic_popup"

    .line 14
    .line 15
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->B0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic p0(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C0()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q(Landroid/view/View;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41200000    # 10.0f

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setElevation(F)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/xra;->a()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 20
    .line 21
    new-instance v0, Ll/ucf;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/ucf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCatchListener(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 31
    .line 32
    new-instance v0, Ll/ycf;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/ycf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCatchListener(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 41
    .line 42
    new-instance v0, Ll/zcf;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/zcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic q0(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C0()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x9

    .line 8
    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p3, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A0(ILcom/p1/mobile/putong/data/Media;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic s0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->Z2()I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic t0(ILjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A0(ILcom/p1/mobile/putong/data/Media;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->m0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic u0(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->z:Z

    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "on"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "off"

    .line 9
    .line 10
    :goto_0
    const-string p1, "post_pic_state"

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

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
    const-string p1, "e_edit_profile_post_pic"

    .line 21
    .line 22
    const-string v0, "p_edit_profile_view"

    .line 23
    .line 24
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic w0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C:Ll/t4m;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/kec0;->x2:I

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {}, Ll/xra;->a()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 37
    .line 38
    const-string v3, "p_edit_profile_view"

    .line 39
    .line 40
    const/4 v4, 0x1

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    sget v0, Ll/adc0;->W:I

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 52
    .line 53
    invoke-static {}, Ll/zk1;->b()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 61
    .line 62
    new-instance v1, Ll/adf;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/adf;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setConfig(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards$b;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 71
    .line 72
    new-instance v1, Ll/bdf;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/bdf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setOnMediaChanged(Ljava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 81
    .line 82
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 86
    .line 87
    sget v1, Ll/adc0;->vb:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_1
    sget v0, Ll/adc0;->vb:I

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 106
    .line 107
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 111
    .line 112
    sget v1, Ll/qa00;->h:I

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardPadding(I)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->E0()V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 121
    .line 122
    new-instance v1, Ll/cdf;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/cdf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;->setUploadDataCallback(Ll/okf;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 131
    .line 132
    const/16 v1, 0x9

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 138
    .line 139
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setSlideWithoutPress(Z)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 148
    .line 149
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    move v1, v2

    .line 154
    :goto_0
    if-ge v1, v0, :cond_4

    .line 155
    .line 156
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 157
    .line 158
    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    check-cast v5, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 163
    .line 164
    invoke-virtual {v5, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setEnableLowPhoto(Z)V

    .line 165
    .line 166
    .line 167
    if-lez v1, :cond_2

    .line 168
    .line 169
    move v6, v4

    .line 170
    goto :goto_1

    .line 171
    :cond_2
    move v6, v2

    .line 172
    :goto_1
    iput-boolean v6, v5, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 173
    .line 174
    if-nez v1, :cond_3

    .line 175
    .line 176
    move v6, v4

    .line 177
    goto :goto_2

    .line 178
    :cond_3
    move v6, v2

    .line 179
    :goto_2
    iput-boolean v6, v5, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 180
    .line 181
    add-int/lit8 v1, v1, 0x1

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 185
    .line 186
    sget v1, Ll/adc0;->W:I

    .line 187
    .line 188
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 196
    .line 197
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 201
    .line 202
    sget v1, Ll/adc0;->O7:I

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    check-cast v0, Landroid/widget/TextView;

    .line 209
    .line 210
    const-string v1, "\u5c0a\u656c\u7684\u7528\u6237\uff0c\u60a8\u53d1\u5e03\u7684\u5185\u5bb9\u987b\u9075\u5b88\u76f8\u5173\u6cd5\u5f8b\u6cd5\u89c4\u548c\u793e\u533a\u89c4\u5219\uff0c\u8bf7\u4e25\u683c\u9075\u5b88\u76f8\u5173\u89c4\u5b9a\uff0c\u4ee5\u514d\u8fdd\u89c4"

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    invoke-static {}, Ll/au40;->a()Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 223
    .line 224
    sget v1, Ll/adc0;->Y9:I

    .line 225
    .line 226
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    check-cast v0, Landroid/widget/TextView;

    .line 231
    .line 232
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 233
    .line 234
    sget v4, Ll/adc0;->X9:I

    .line 235
    .line 236
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    check-cast v1, Lv/VSwitchButton;

    .line 241
    .line 242
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A:Lv/VSwitchButton;

    .line 243
    .line 244
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    sget v4, Ll/c9c0;->A:I

    .line 249
    .line 250
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    invoke-virtual {v1, p1}, Lv/VSwitchButton;->setThumbActiveColor(I)V

    .line 255
    .line 256
    .line 257
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-eqz p1, :cond_5

    .line 266
    .line 267
    const-string p1, "\u4e0a\u4f20\u65b0\u7167\u7247\u5206\u4eab\u5230\u52a8\u6001\u53ca\u72b6\u6001"

    .line 268
    .line 269
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    .line 271
    .line 272
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->el()Lrx/c;

    .line 277
    .line 278
    .line 279
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 290
    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 292
    .line 293
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MomentSwitch;->noSyncMoment:Ljava/util/List;

    .line 294
    .line 295
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    if-eqz v0, :cond_6

    .line 300
    .line 301
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ha()Z

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 310
    .line 311
    goto :goto_4

    .line 312
    :cond_6
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 313
    .line 314
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 315
    .line 316
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 317
    .line 318
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MomentSwitch;->noSyncMoment:Ljava/util/List;

    .line 319
    .line 320
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    check-cast p1, Ljava/lang/String;

    .line 325
    .line 326
    const-string v0, "false"

    .line 327
    .line 328
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 333
    .line 334
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A:Lv/VSwitchButton;

    .line 335
    .line 336
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 337
    .line 338
    invoke-virtual {p1, v0}, Lv/VSwitchButton;->setChecked(Z)V

    .line 339
    .line 340
    .line 341
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->y:Z

    .line 342
    .line 343
    if-eqz p1, :cond_7

    .line 344
    .line 345
    const-string p1, "on"

    .line 346
    .line 347
    goto :goto_5

    .line 348
    :cond_7
    const-string p1, "off"

    .line 349
    .line 350
    :goto_5
    const-string v0, "post_pic_state"

    .line 351
    .line 352
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 357
    .line 358
    .line 359
    move-result-object p1

    .line 360
    const-string v0, "e_edit_profile_post_pic"

    .line 361
    .line 362
    invoke-static {v0, v3, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 363
    .line 364
    .line 365
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->x:Landroid/view/View;

    .line 366
    .line 367
    return-object p0
.end method

.method public z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A:Lv/VSwitchButton;

    .line 2
    .line 3
    new-instance v1, Ll/ddf;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ddf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->A:Lv/VSwitchButton;

    .line 12
    .line 13
    new-instance v1, Ll/edf;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/edf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/xra;->a()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->B:Z

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/xra;->k()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->B:Z

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 49
    .line 50
    const/4 v1, 0x2

    .line 51
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0()V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public final z0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x0(I)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method
