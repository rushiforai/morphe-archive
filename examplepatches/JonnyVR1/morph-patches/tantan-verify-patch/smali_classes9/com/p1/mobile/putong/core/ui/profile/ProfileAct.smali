.class public Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;
.super Lcom/p1/mobile/putong/core/ui/profile/ProfileMediaAct;
.source "SourceFile"

# interfaces
.implements Ll/d0r;
.implements Ll/crl;
.implements Ll/hmq0;


# instance fields
.field public A:Lcom/p1/mobile/putong/core/data/CityCData;

.field public B:Z

.field public C:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ljava/lang/String;

.field public E:Ljava/lang/String;

.field public F:I

.field public G:Z

.field public H:Ll/f0r;

.field public I:I

.field public J:Z

.field public c:Lv/VLinear;

.field public d:Lv/VLinear;

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Lcom/p1/mobile/putong/data/RelationshipStatus;

.field public m:I

.field public n:Ll/b94;

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Ljava/util/HashMap;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public s:I

.field public t:Ljava/lang/String;

.field public u:Lcom/p1/mobile/putong/app/PutongFrag;

.field public v:Z

.field public w:Ljava/lang/String;

.field public x:I

.field public y:Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

.field public z:Lcom/p1/mobile/putong/core/ui/profile/frag/model/CoreMomentModel;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileMediaAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "unknown_"

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->l:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->v:Z

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->x:I

    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->B:Z

    .line 22
    .line 23
    new-instance v3, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v3, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->C:Ljava/util/Map;

    .line 29
    .line 30
    const-string v0, ""

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 33
    .line 34
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F:I

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->G:Z

    .line 37
    .line 38
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->J:Z

    .line 39
    .line 40
    return-void
.end method

.method public static A2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "canShowFollowButton"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method private B2(Landroid/view/MotionEvent;Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/app/PutongFrag;->D4(Landroid/view/MotionEvent;Z)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->T2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->N2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->V2()V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->L2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->U2()V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->M2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic e2(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->ACT_CREATE:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->Q2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->W2(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->X2(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->R2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->S2(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->K2()V

    return-void
.end method

.method public static o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static p2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/LikedUser;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const-string p1, "liked_user"

    .line 7
    .line 8
    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public static q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 12

    .line 1
    const-string v0, "unknown_"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v7

    .line 7
    const/4 v10, 0x1

    .line 8
    const/4 v11, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    const/16 v8, 0x111

    .line 11
    .line 12
    const/4 v9, 0x0

    .line 13
    move-object v1, p0

    .line 14
    move-object v2, p1

    .line 15
    move-object v3, p2

    .line 16
    move v4, p3

    .line 17
    move/from16 v5, p4

    .line 18
    .line 19
    invoke-static/range {v1 .. v11}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static r2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "pic_index"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static s2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZLjava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->beginTrance()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CARD_CLICK:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/content/Intent;

    .line 20
    .line 21
    if-eqz p4, :cond_0

    .line 22
    .line 23
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-eqz p3, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/gra;->L3()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct_CustomTransition;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 38
    .line 39
    :goto_0
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "userId"

    .line 43
    .line 44
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    const-string p0, "from"

    .line 48
    .line 49
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    const-string p0, "no_showbuttons_infofromlocal"

    .line 53
    .line 54
    invoke-virtual {v0, p0, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    const-string p0, "showButtons"

    .line 58
    .line 59
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    const-string p0, "edit"

    .line 63
    .line 64
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    const-string p0, "open_media_picker"

    .line 68
    .line 69
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    const-string p0, "relationship_status"

    .line 73
    .line 74
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    const-string p0, "button_flag"

    .line 82
    .line 83
    invoke-virtual {v0, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    const-string p0, "with_superlike"

    .line 87
    .line 88
    invoke-virtual {v0, p0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    const-string p0, "from_gp_live"

    .line 92
    .line 93
    invoke-virtual {v0, p0, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    const-string p0, "live_room_info"

    .line 97
    .line 98
    invoke-virtual {v0, p0, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 99
    .line 100
    .line 101
    return-object v0
.end method

.method public static u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->beginTrance()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CARD_CLICK:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/content/Intent;

    .line 20
    .line 21
    if-eqz p4, :cond_0

    .line 22
    .line 23
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-eqz p3, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/gra;->L3()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct_CustomTransition;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 38
    .line 39
    :goto_0
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "userId"

    .line 43
    .line 44
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    const-string p0, "from"

    .line 48
    .line 49
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    const-string p0, "no_showbuttons_infofromlocal"

    .line 53
    .line 54
    invoke-virtual {v0, p0, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    const-string p0, "showButtons"

    .line 58
    .line 59
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    const-string p0, "edit"

    .line 63
    .line 64
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    const-string p0, "open_media_picker"

    .line 68
    .line 69
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    const-string p0, "relationship_status"

    .line 73
    .line 74
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    const-string p0, "button_flag"

    .line 82
    .line 83
    invoke-virtual {v0, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    const-string p0, "with_superlike"

    .line 87
    .line 88
    invoke-virtual {v0, p0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    const-string p0, "from_gp_live"

    .line 92
    .line 93
    invoke-virtual {v0, p0, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    return-object v0
.end method

.method public static v2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZLjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p10}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "input_type"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static w2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p10}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "canShowFollowButton"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static y2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZILjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p10}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "canShowFollowButton"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    const-string p1, "pushReason"

    .line 11
    .line 12
    invoke-virtual {p0, p1, p12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string p1, "pushTag"

    .line 16
    .line 17
    invoke-virtual {p0, p1, p13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public static z2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZLjava/lang/String;)Landroid/content/Intent;
    .locals 12

    .line 1
    move-object v0, p0

    .line 2
    move-object v1, p1

    .line 3
    move-object v2, p2

    .line 4
    move v3, p3

    .line 5
    move/from16 v4, p4

    .line 6
    .line 7
    move/from16 v5, p5

    .line 8
    .line 9
    move-object/from16 v6, p6

    .line 10
    .line 11
    move/from16 v7, p7

    .line 12
    .line 13
    move/from16 v8, p8

    .line 14
    .line 15
    move/from16 v9, p9

    .line 16
    .line 17
    move/from16 v11, p10

    .line 18
    .line 19
    move-object/from16 v10, p12

    .line 20
    .line 21
    invoke-static/range {v0 .. v11}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->s2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZLjava/lang/String;Z)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "canShowFollowButton"

    .line 26
    .line 27
    move/from16 p2, p11

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    return-object p0
.end method


# virtual methods
.method public final C2(Ll/x20;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/facebook/AccessToken;->l()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/FacebookApi;->e:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p1}, Ll/x20;->call()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->n:Ll/b94;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/b94$b;->a()Ll/b94;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->n:Ll/b94;

    .line 36
    .line 37
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->n:Ll/b94;

    .line 42
    .line 43
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct$a;

    .line 44
    .line 45
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Ll/x20;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Ll/z0w;->y(Ll/b94;Ll/tvf;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget-object v0, Lcom/p1/mobile/putong/api/api/FacebookApi;->e:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {p1, p0, v0}, Ll/z0w;->t(Landroid/app/Activity;Ljava/util/Collection;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public D2()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E2()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 3

    .line 1
    new-instance v0, Ll/qu90;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qu90;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->e:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Ll/qu90;->a:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->i:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Ll/qu90;->b:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->f:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Ll/qu90;->c:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->g:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Ll/qu90;->d:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Ll/qu90;->e:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->k:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Ll/qu90;->f:Z

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->l:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 31
    .line 32
    iput-object v1, v0, Ll/qu90;->g:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->m:I

    .line 35
    .line 36
    iput v1, v0, Ll/qu90;->h:I

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Ll/qu90;->i:Z

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Ll/qu90;->j:Z

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->p:Z

    .line 47
    .line 48
    iput-boolean v1, v0, Ll/qu90;->k:Z

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->j:Z

    .line 51
    .line 52
    iput-boolean v1, v0, Ll/qu90;->l:Z

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->x:I

    .line 55
    .line 56
    iput v1, v0, Ll/qu90;->m:I

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->z:Lcom/p1/mobile/putong/core/ui/profile/frag/model/CoreMomentModel;

    .line 59
    .line 60
    iput-object v1, v0, Ll/qu90;->n:Lcom/p1/mobile/putong/core/ui/profile/frag/model/CoreMomentModel;

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->s:I

    .line 63
    .line 64
    iput v1, v0, Ll/qu90;->o:I

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->t:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Ll/qu90;->p:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->A:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 71
    .line 72
    iput-object v1, v0, Ll/qu90;->q:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->w:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Ll/qu90;->r:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const-string v2, "profile_like_id"

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Ll/qu90;->s:Ljava/lang/String;

    .line 89
    .line 90
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->f:Z

    .line 91
    .line 92
    if-nez p0, :cond_0

    .line 93
    .line 94
    invoke-static {}, Ll/gra;->M3()Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_0

    .line 99
    .line 100
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->P4(Ll/qu90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->E8(Ll/qu90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0
.end method

.method public final F2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->y:Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->y:Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;->showCountdownSendMsg:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/en90;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/en90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/fn90;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/fn90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final H2(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "conversation_view"

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    const-string v0, "from_conversation"

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    const-string v0, "messages_title"

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    const-string v0, "messages_thumbnail_left"

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    const-string v0, "profile_bubble"

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    const-string v0, "home_card"

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    :goto_0
    return-void

    .line 70
    :cond_2
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E1:Ll/cd9;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/cd9;->D3(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public I2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic K2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->H:Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic L2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance p1, Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p1, v0}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->H:Ll/f0r;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/xm90;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/xm90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic M2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->H:Ll/f0r;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->H:Ll/f0r;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->H:Ll/f0r;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 31
    .line 32
    if-ne p1, v0, :cond_2

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->H:Ll/f0r;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public final synthetic N2()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->se(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/gn90;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/gn90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic Q2(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/hbs;->a()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, "moment_visitor"

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p1, "photo_album_feed_from_activity"

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string p1, "photo_album_feed_viewers"

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    const-string p1, "liked_users_anchor"

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_4

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    const-string p1, "from_conversation_search_view"

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_5

    .line 69
    .line 70
    :goto_0
    return-void

    .line 71
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->finish()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic R2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->C:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/medialog/util/utilcode/util/NetworkUtils;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    new-instance v1, Ljava/io/File;

    .line 26
    .line 27
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/niw;->d(Ljava/io/File;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {v0, p1, p0}, Ll/dkb;->Ja(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic S2(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->i:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->y:Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->y:Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 14
    .line 15
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;->checkConv:Z

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    :cond_0
    const-string p1, "places"

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    const-string p1, "interest_card"

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    const-string p1, "live_user_card"

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Ll/tnt;->b(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_1

    .line 56
    .line 57
    const-string p1, "live_from_h5"

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    const-string p1, "from_live_group_rank"

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_1

    .line 76
    .line 77
    const-string p1, "live_from_voice_entrance"

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_1

    .line 86
    .line 87
    const-string p1, "from_live_square"

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-nez p1, :cond_1

    .line 96
    .line 97
    const-string p1, "anchor-search"

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_1

    .line 106
    .line 107
    const-string p1, "live_profile_voice_mask_mode"

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-nez p1, :cond_1

    .line 116
    .line 117
    const-string p1, "chat_group"

    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-nez p1, :cond_1

    .line 126
    .line 127
    const-string p1, "chat_group_anonymity"

    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-nez p1, :cond_1

    .line 136
    .line 137
    const-string p1, "from_theme_recommendation"

    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_1

    .line 146
    .line 147
    const-string p1, "group_notification"

    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-nez p1, :cond_1

    .line 156
    .line 157
    const-string p1, "group_notification_anonymity"

    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_1

    .line 166
    .line 167
    const-string p1, "moment_gift_detail"

    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-nez p1, :cond_1

    .line 176
    .line 177
    const-string p1, "moment_gift_rank"

    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-nez p1, :cond_1

    .line 186
    .line 187
    const-string p1, "from_giftwall"

    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-nez p1, :cond_1

    .line 196
    .line 197
    const-string p1, "team_account"

    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-nez p1, :cond_1

    .line 206
    .line 207
    const-string p1, "from_christmas"

    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-nez p1, :cond_1

    .line 216
    .line 217
    const-string p1, "from_portrait_like_list"

    .line 218
    .line 219
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-nez p1, :cond_1

    .line 226
    .line 227
    const-string p1, "from_activities_gift_profile"

    .line 228
    .line 229
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-nez p1, :cond_1

    .line 236
    .line 237
    const-string p1, "from_meet_feed"

    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-nez p1, :cond_1

    .line 246
    .line 247
    const-string p1, "from_meet_profile"

    .line 248
    .line 249
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 250
    .line 251
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-nez p1, :cond_1

    .line 256
    .line 257
    const-string p1, "form_kankan_video_list"

    .line 258
    .line 259
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-nez p1, :cond_1

    .line 266
    .line 267
    const-string p1, "form_my_pet"

    .line 268
    .line 269
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-nez p1, :cond_1

    .line 276
    .line 277
    const-string p1, "impress_signal"

    .line 278
    .line 279
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-nez p1, :cond_1

    .line 286
    .line 287
    const-string p1, "from_mew_tags"

    .line 288
    .line 289
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    if-nez p1, :cond_1

    .line 296
    .line 297
    const-string p1, "from_literature_third"

    .line 298
    .line 299
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result p1

    .line 305
    if-nez p1, :cond_1

    .line 306
    .line 307
    const-string p1, "push_like"

    .line 308
    .line 309
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    if-nez p1, :cond_1

    .line 316
    .line 317
    const-string p1, "from_find_partner"

    .line 318
    .line 319
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 320
    .line 321
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    if-nez p1, :cond_1

    .line 326
    .line 327
    const-string p1, "from_voice_buzz"

    .line 328
    .line 329
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 330
    .line 331
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    if-nez p1, :cond_1

    .line 336
    .line 337
    const-string p1, "from_pin_like"

    .line 338
    .line 339
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 340
    .line 341
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    if-nez p1, :cond_1

    .line 346
    .line 347
    const-string p1, "from_city_center_conv_banner"

    .line 348
    .line 349
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-nez p1, :cond_1

    .line 356
    .line 357
    const-string p1, "share_profile"

    .line 358
    .line 359
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 360
    .line 361
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result p1

    .line 365
    if-nez p1, :cond_1

    .line 366
    .line 367
    const-string p1, "p_picks_profile"

    .line 368
    .line 369
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result p1

    .line 375
    if-nez p1, :cond_1

    .line 376
    .line 377
    const-string p1, "p_mbti_detail"

    .line 378
    .line 379
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 380
    .line 381
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result p1

    .line 385
    if-nez p1, :cond_1

    .line 386
    .line 387
    const-string p1, "p_picks_profile_card"

    .line 388
    .line 389
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 390
    .line 391
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    move-result p1

    .line 395
    if-nez p1, :cond_1

    .line 396
    .line 397
    const-string p1, "from_friend_tacit"

    .line 398
    .line 399
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 400
    .line 401
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    if-nez p1, :cond_1

    .line 406
    .line 407
    const-string p1, "p_game_cp"

    .line 408
    .line 409
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 410
    .line 411
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result p1

    .line 415
    if-nez p1, :cond_1

    .line 416
    .line 417
    const-string p1, "p_received_profile_like"

    .line 418
    .line 419
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 420
    .line 421
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    move-result p1

    .line 425
    if-nez p1, :cond_1

    .line 426
    .line 427
    const-string p1, "p_lifestyle_tag"

    .line 428
    .line 429
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 430
    .line 431
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result p1

    .line 435
    if-nez p1, :cond_1

    .line 436
    .line 437
    const-string p1, "p_game_cp_msg"

    .line 438
    .line 439
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 440
    .line 441
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    move-result p0

    .line 445
    if-nez p0, :cond_1

    .line 446
    .line 447
    const/4 p0, 0x1

    .line 448
    goto :goto_0

    .line 449
    :cond_1
    const/4 p0, 0x0

    .line 450
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 451
    .line 452
    .line 453
    move-result-object p0

    .line 454
    return-object p0
.end method

.method public final synthetic T2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/R$string;->cl:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic U2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/R$string;->dl:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic V2()V
    .locals 8

    .line 1
    sget v6, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x1

    .line 8
    const-string v5, "profile"

    .line 9
    .line 10
    move-object v0, p0

    .line 11
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->g2(Landroid/content/Context;IZZZLjava/lang/String;IZ)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v1, 0x312

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic W2(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p2, Ll/ym90;

    .line 2
    .line 3
    invoke-direct {p2, p0}, Ll/ym90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->C2(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic X2(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p2, v0, p2, p2}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Z2(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->i0(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public a3()Ll/q3m;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->d5()Ll/t3m;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/q3m;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->W4()Ll/t3m;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/q3m;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    check-cast p0, Ll/q3m;

    .line 39
    .line 40
    return-object p0
.end method

.method public attachBaseContext(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->attachBaseContext(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b3()Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->v:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const-string v0, "from_recommend_like"

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const-string v0, "preview_card"

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    const-string v0, "form_my_pet"

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    const-string v0, "profile_bubble"

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    const-string v0, "from_greet_act"

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    const-string v0, "messages_title"

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    const-string v0, "messages_thumbnail_left"

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    const-string v0, "messages_thumbnail_right"

    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    const-string v0, "from_see_blind_box"

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    const/4 p0, 0x0

    .line 99
    return p0

    .line 100
    :cond_2
    :goto_0
    return v1
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/android/app/Frag;

    .line 13
    .line 14
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->M8()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->X6()Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->C4()Ljava/util/Collection;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/util/ArrayList;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    new-array p0, p0, [Ll/pf60;

    .line 51
    .line 52
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->B2(Landroid/view/MotionEvent;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return v0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public f2(ILjava/lang/String;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p2, p1}, Ll/cmc0;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->b3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sget v1, Ll/x7c0;->x:I

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public getDefaultThemeResId()I
    .locals 0

    .line 1
    sget p0, Ll/agc0;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public h(II)V
    .locals 1

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->I:I

    .line 2
    .line 3
    sub-int v0, p1, p2

    .line 4
    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sub-int p2, p1, p2

    .line 11
    .line 12
    if-gez p2, :cond_2

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->J:Z

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p2, 0x1

    .line 19
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->J:Z

    .line 20
    .line 21
    :cond_2
    :goto_1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->I:I

    .line 22
    .line 23
    return-void
.end method

.method public i0(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->n0(IZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const p2, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p1, :cond_5

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->E2()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "live_flag"

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->v:Z

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "gift_msg_id"

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->E:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "profile_create_data"

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->y:Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 65
    .line 66
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    invoke-static {}, Ll/gra;->V1()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v0, "from_group_id"

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_1

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 92
    .line 93
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1, v0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_1
    const-string p1, "from_meet_feed"

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    const-string v0, "liked_user"

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 121
    .line 122
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_2

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 129
    .line 130
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1, v0, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->r:Ljava/util/HashMap;

    .line 138
    .line 139
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_3

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 146
    .line 147
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_3

    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 158
    .line 159
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    const-string v0, "params_extra_map_data"

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->r:Ljava/util/HashMap;

    .line 166
    .line 167
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 168
    .line 169
    .line 170
    :cond_3
    invoke-static {}, Ll/gra;->r1()Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-eqz p1, :cond_4

    .line 175
    .line 176
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 177
    .line 178
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    const-string v0, "long_time_no_see"

    .line 183
    .line 184
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->B:Z

    .line 185
    .line 186
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 187
    .line 188
    .line 189
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 198
    .line 199
    invoke-virtual {p1, p2, v0}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 211
    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    check-cast p1, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 223
    .line 224
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 225
    .line 226
    :goto_0
    const/4 p0, 0x0

    .line 227
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "userId"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "profile_create_data"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->y:Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 29
    .line 30
    new-instance v0, Ljava/lang/Object;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->ACT_CREATE:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/dn90;

    .line 45
    .line 46
    invoke-direct {v1, v0}, Ll/dn90;-><init>(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F2()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vm90;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vm90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/zm90;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/zm90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gra;->O1()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    iget-object v0, v0, Ll/dkb;->H1:Lrx/subjects/b;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/an90;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/an90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public n0(IZZZ)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->G:Z

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F:I

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 28
    .line 29
    const-string p2, "facebook"

    .line 30
    .line 31
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->n2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->c:Lv/VLinear;

    .line 59
    .line 60
    new-instance p3, Ll/hn90;

    .line 61
    .line 62
    invoke-direct {p3, p0, p1}, Ll/hn90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Lcom/p1/mobile/android/app/Dialog;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2, p3}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->d:Lv/VLinear;

    .line 69
    .line 70
    new-instance p3, Ll/wm90;

    .line 71
    .line 72
    invoke-direct {p3, p0, p1}, Ll/wm90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Lcom/p1/mobile/android/app/Dialog;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2, p3}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    const/4 p1, 0x0

    .line 80
    const/4 p2, 0x1

    .line 81
    invoke-virtual {p0, p2, p1, p2, p2}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public n2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qn90;->b(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public needRefreshPrivilege()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->O1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x312

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-ne p1, v1, :cond_1

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    if-ne p2, v0, :cond_1

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    const-string p2, "selected_origin_images"

    .line 23
    .line 24
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    if-nez p3, :cond_0

    .line 35
    .line 36
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-nez p3, :cond_0

    .line 41
    .line 42
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->C:Ljava/util/Map;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    invoke-interface {p3, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->onPickImagesResult(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->n:Ll/b94;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->n:Ll/b94;

    .line 78
    .line 79
    invoke-interface {v0, p1, p2, p3}, Ll/b94;->a(IILandroid/content/Intent;)Z

    .line 80
    .line 81
    .line 82
    :cond_2
    if-ne p1, v1, :cond_4

    .line 83
    .line 84
    const/16 p1, 0x1001

    .line 85
    .line 86
    if-ne p2, p1, :cond_3

    .line 87
    .line 88
    new-instance p1, Ll/bn90;

    .line 89
    .line 90
    invoke-direct {p1, p0}, Ll/bn90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    const/16 p1, 0x1002

    .line 98
    .line 99
    if-ne p2, p1, :cond_4

    .line 100
    .line 101
    new-instance p1, Ll/cn90;

    .line 102
    .line 103
    invoke-direct {p1, p0}, Ll/cn90;-><init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/android/app/Frag;

    .line 13
    .line 14
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->ce()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->nd()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->k9()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->K8()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->f5()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->b5()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->Y4()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->U4()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G7()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->p7()V

    .line 76
    .line 77
    .line 78
    :cond_4
    return-void
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "preprocessed"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 13
    .line 14
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p1, Ll/sim;

    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {p1, v1}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    iget-object p1, p1, Ll/sim;->d:[I

    .line 34
    .line 35
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 36
    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 39
    .line 40
    const-string p1, "image/jpeg"

    .line 41
    .line 42
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    new-array p1, p1, [Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    aput-object v0, p1, v1

    .line 49
    .line 50
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->onPickImagesResult(Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/AutoReleaseVideoAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gp5;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F:I

    .line 34
    .line 35
    invoke-interface {v0, p0, p1}, Ll/t3m;->p3(ILcom/p1/mobile/putong/data/Media;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "imageId"

    .line 5
    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "showButtons"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->i:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "pic_index"

    .line 19
    .line 20
    const/4 v3, -0x1

    .line 21
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->x:I

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "canShowFollowButton"

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->j:Z

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "no_showbuttons_infofromlocal"

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q:Z

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "edit"

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->f:Z

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "input_type"

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->g:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "from"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v1, "button_flag"

    .line 93
    .line 94
    const/16 v3, 0x111

    .line 95
    .line 96
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->m:I

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "with_superlike"

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o:Z

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const-string v1, "pushReason"

    .line 119
    .line 120
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->s:I

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const-string v1, "pushTag"

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->t:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v1, "relationship_status"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->l:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    const-string v1, "from_gp_live"

    .line 159
    .line 160
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->p:Z

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ii(Landroid/content/Intent;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->v:Z

    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    const-string v1, "live_room_info"

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->w:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    const-string v1, "long_time_no_see"

    .line 197
    .line 198
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->B:Z

    .line 203
    .line 204
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    const-string v1, "params_extra_map_data"

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    instance-of v1, v0, Ljava/util/HashMap;

    .line 215
    .line 216
    if-eqz v1, :cond_0

    .line 217
    .line 218
    check-cast v0, Ljava/util/HashMap;

    .line 219
    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->r:Ljava/util/HashMap;

    .line 221
    .line 222
    const-string v1, "gift_msg_id"

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Ljava/lang/String;

    .line 229
    .line 230
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->E:Ljava/lang/String;

    .line 231
    .line 232
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const-string v1, "city_centre_data"

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-eqz v1, :cond_1

    .line 247
    .line 248
    check-cast v0, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 249
    .line 250
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->A:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 251
    .line 252
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->f:Z

    .line 253
    .line 254
    if-eqz v0, :cond_2

    .line 255
    .line 256
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 257
    .line 258
    .line 259
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_3

    .line 264
    .line 265
    const-string v0, "imageId"

    .line 266
    .line 267
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->F:I

    .line 272
    .line 273
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->i:Z

    .line 274
    .line 275
    if-eqz v0, :cond_4

    .line 276
    .line 277
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    sget v1, Ll/c9c0;->P1:I

    .line 282
    .line 283
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 288
    .line 289
    .line 290
    :cond_4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    const-string v1, "open_media_picker"

    .line 295
    .line 296
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->k:Z

    .line 301
    .line 302
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    const-string v1, "core_moment"

    .line 307
    .line 308
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/frag/model/CoreMomentModel;

    .line 313
    .line 314
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->z:Lcom/p1/mobile/putong/core/ui/profile/frag/model/CoreMomentModel;

    .line 315
    .line 316
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 317
    .line 318
    .line 319
    const-string p1, "home_card"

    .line 320
    .line 321
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result p1

    .line 327
    if-nez p1, :cond_c

    .line 328
    .line 329
    const-string p1, "home_moment_theme_card"

    .line 330
    .line 331
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 332
    .line 333
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    if-eqz p1, :cond_5

    .line 338
    .line 339
    goto/16 :goto_1

    .line 340
    .line 341
    :cond_5
    const-string p1, "conversation_view"

    .line 342
    .line 343
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    if-eqz p1, :cond_6

    .line 350
    .line 351
    const-string p1, "conversationlist"

    .line 352
    .line 353
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 354
    .line 355
    goto/16 :goto_2

    .line 356
    .line 357
    :cond_6
    const-string p1, "messages_thumbnail_right"

    .line 358
    .line 359
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 360
    .line 361
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result p1

    .line 365
    if-nez p1, :cond_b

    .line 366
    .line 367
    const-string p1, "messages_thumbnail_left"

    .line 368
    .line 369
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result p1

    .line 375
    if-nez p1, :cond_b

    .line 376
    .line 377
    const-string p1, "messages_title"

    .line 378
    .line 379
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 380
    .line 381
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result p1

    .line 385
    if-nez p1, :cond_b

    .line 386
    .line 387
    const-string p1, "message_ice_break_dialog"

    .line 388
    .line 389
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 390
    .line 391
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    move-result p1

    .line 395
    if-nez p1, :cond_b

    .line 396
    .line 397
    const-string p1, "messages_friend_comment_toast"

    .line 398
    .line 399
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 400
    .line 401
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    if-nez p1, :cond_b

    .line 406
    .line 407
    const-string p1, "profile_bubble"

    .line 408
    .line 409
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 410
    .line 411
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result p1

    .line 415
    if-eqz p1, :cond_7

    .line 416
    .line 417
    goto :goto_0

    .line 418
    :cond_7
    const-string p1, "moments_in_profile"

    .line 419
    .line 420
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 421
    .line 422
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    move-result p1

    .line 426
    if-eqz p1, :cond_8

    .line 427
    .line 428
    const-string p1, "personal_album"

    .line 429
    .line 430
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 431
    .line 432
    goto :goto_2

    .line 433
    :cond_8
    const-string p1, "likers"

    .line 434
    .line 435
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 436
    .line 437
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    move-result p1

    .line 441
    if-eqz p1, :cond_9

    .line 442
    .line 443
    const-string p1, "see"

    .line 444
    .line 445
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 446
    .line 447
    goto :goto_2

    .line 448
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 449
    .line 450
    const-string v0, "push_scheme"

    .line 451
    .line 452
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    move-result p1

    .line 456
    if-eqz p1, :cond_a

    .line 457
    .line 458
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 459
    .line 460
    goto :goto_2

    .line 461
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 462
    .line 463
    const-string v0, "places"

    .line 464
    .line 465
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result p1

    .line 469
    if-eqz p1, :cond_d

    .line 470
    .line 471
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 472
    .line 473
    goto :goto_2

    .line 474
    :cond_b
    :goto_0
    const-string p1, "conversation"

    .line 475
    .line 476
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 477
    .line 478
    goto :goto_2

    .line 479
    :cond_c
    :goto_1
    const-string p1, "swipe"

    .line 480
    .line 481
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D:Ljava/lang/String;

    .line 482
    .line 483
    :cond_d
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->e:Ljava/lang/String;

    .line 484
    .line 485
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->H2(Ljava/lang/String;)V

    .line 486
    .line 487
    .line 488
    return-void
.end method

.method public setTransparentStatusBar()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "my_tab_profile_like"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x400

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/high16 v1, -0x80000000

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/high16 v1, 0x4000000

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p0, v0}, Ll/c30;->A(F)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "my_tab_profile_like"

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
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
