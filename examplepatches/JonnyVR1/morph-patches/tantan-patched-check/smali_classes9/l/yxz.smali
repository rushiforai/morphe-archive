.class public Ll/yxz;
.super Ll/qzz;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qzz<",
        "Ll/tvz;",
        ">;",
        "Lcom/p1/mobile/putong/core/api/c0$c;"
    }
.end annotation


# instance fields
.field public M1:Z

.field public N1:Z

.field public O1:Z

.field public P1:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

.field public Q1:Ll/q800;

.field public R1:Ll/oxy;

.field public final S1:Ljava/lang/String;

.field public T1:Z

.field public U1:Z

.field public V1:Ll/kcg0;

.field public W1:Ll/kcg0;

.field public X1:Lcom/tantan/library/svga/SVGAnimationView;

.field public Y1:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public Z1:Z

.field public a2:Z

.field public b2:[I

.field public c2:Landroid/graphics/RectF;

.field public d2:Landroid/graphics/RectF;

.field public e2:Landroid/graphics/RectF;

.field public f2:Ljava/lang/Runnable;

.field public g2:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/x20;",
            ">;"
        }
    .end annotation
.end field

.field public final h2:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public i2:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/qzz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/yxz;->M1:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/yxz;->N1:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/yxz;->O1:Z

    .line 10
    .line 11
    const-string v0, "giftTipKey"

    .line 12
    .line 13
    iput-object v0, p0, Ll/yxz;->S1:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean p1, p0, Ll/yxz;->T1:Z

    .line 16
    .line 17
    iput-boolean p1, p0, Ll/yxz;->U1:Z

    .line 18
    .line 19
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/yxz;->Y1:Lrx/subjects/b;

    .line 24
    .line 25
    iput-boolean p1, p0, Ll/yxz;->Z1:Z

    .line 26
    .line 27
    iput-boolean p1, p0, Ll/yxz;->a2:Z

    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    new-array v0, v0, [I

    .line 31
    .line 32
    iput-object v0, p0, Ll/yxz;->b2:[I

    .line 33
    .line 34
    new-instance v0, Landroid/graphics/RectF;

    .line 35
    .line 36
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/yxz;->c2:Landroid/graphics/RectF;

    .line 40
    .line 41
    new-instance v0, Landroid/graphics/RectF;

    .line 42
    .line 43
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/yxz;->d2:Landroid/graphics/RectF;

    .line 47
    .line 48
    new-instance v0, Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/yxz;->e2:Landroid/graphics/RectF;

    .line 54
    .line 55
    new-instance v0, Ll/yxz$g;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/yxz$g;-><init>(Ll/yxz;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/yxz;->f2:Ljava/lang/Runnable;

    .line 61
    .line 62
    new-instance v0, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/yxz;->g2:Ljava/util/List;

    .line 68
    .line 69
    new-instance v0, Ll/yxz$a;

    .line 70
    .line 71
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 72
    .line 73
    const-string v2, "backgroundColor"

    .line 74
    .line 75
    invoke-direct {v0, p0, v1, v2}, Ll/yxz$a;-><init>(Ll/yxz;Ljava/lang/Class;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Ll/yxz;->h2:Landroid/util/Property;

    .line 79
    .line 80
    iput-boolean p1, p0, Ll/yxz;->i2:Z

    .line 81
    .line 82
    return-void
.end method

.method public static synthetic A2(Ll/yxz;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->y4(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->R4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static bridge synthetic B3(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->x5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic C2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->V4()V

    return-void
.end method

.method public static synthetic C3(Ll/yxz;)Ll/clz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic D3(Ll/yxz;)Ll/clz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E2(Ll/yxz;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->w4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic E3(Ll/yxz;)Ll/clz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->S4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic F3(Ll/yxz;)Ll/clz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->r4()V

    return-void
.end method

.method public static synthetic G3(Ll/yxz;)Ll/clz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H2(Ll/yxz;Lcom/p1/mobile/putong/core/data/EmojiAnimData;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->K4(Lcom/p1/mobile/putong/core/data/EmojiAnimData;Ll/pf60;)V

    return-void
.end method

.method public static synthetic H3(Ll/yxz;)Ll/clz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic I2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yxz;->U4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic K2(Ll/yxz;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->q4(Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L2(Ll/yxz;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->E4(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic M2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->T4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static M3(Landroid/content/Context;Ljava/lang/String;)Ll/oze$a;
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    sget-object v0, Ll/oze;->d:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ll/oze$a;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget v4, v2, Ll/oze$a;->b:I

    .line 38
    .line 39
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    return-object v2

    .line 50
    :cond_2
    :goto_0
    return-object v1
.end method

.method public static synthetic N2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->N4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic O2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P2(Ll/yxz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->g4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q2(Ll/yxz;Ll/sv4;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->o4(Ll/sv4;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic R2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->s4()V

    return-void
.end method

.method public static synthetic S2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->z4()V

    return-void
.end method

.method public static synthetic T2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->t4()V

    return-void
.end method

.method public static synthetic U2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->O4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic V2(Ll/yxz;Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->f4(Lcom/p1/mobile/putong/core/api/c0$b;)V

    return-void
.end method

.method public static synthetic W2(Ll/yxz;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->C4(Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X2(Ll/yxz;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->F4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->G4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z2(Ll/yxz;DLl/uxj0;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yxz;->J4(DLl/uxj0;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b3(Ll/yxz;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->l4(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    return-void
.end method

.method public static synthetic c3(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->A4()V

    return-void
.end method

.method public static synthetic d3(Ll/yxz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->e4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic e3(Ll/y20;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f3(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->u4()V

    return-void
.end method

.method public static synthetic g3(Ll/yxz;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->p4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic h3()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic k3(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->Q4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic l2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->L4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic m2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->v4()V

    return-void
.end method

.method public static synthetic m3(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->I4()V

    return-void
.end method

.method public static synthetic n2(Ll/yxz;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->m4(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n3(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yxz;->P4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic o2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->B4()V

    return-void
.end method

.method public static synthetic o3(Ll/yxz;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->h4(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic p2(Ll/yxz;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;ZLcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/yxz;->n4(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;ZLcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic p3(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->M4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic q2(Ll/yxz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->j4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q3(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->k4()V

    return-void
.end method

.method public static synthetic r2(Ll/yxz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->i4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r3(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->x4()V

    return-void
.end method

.method public static synthetic s2(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->H4()V

    return-void
.end method

.method public static bridge synthetic s3(Ll/yxz;)Lrx/subjects/b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yxz;->Y1:Lrx/subjects/b;

    return-object p0
.end method

.method public static bridge synthetic t3(Ll/yxz;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method

.method public static synthetic u2(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic u3(Ll/yxz;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/yxz;->a2:Z

    return-void
.end method

.method public static synthetic v2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic v3(Ll/yxz;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/yxz;->Z1:Z

    return-void
.end method

.method public static synthetic w2(Ll/yxz;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->D4(Ll/jl80;)V

    return-void
.end method

.method public static bridge synthetic w3(Ll/yxz;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/yxz;->U1:Z

    return-void
.end method

.method public static bridge synthetic x3(Ll/yxz;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static synthetic y2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic y3(Ll/yxz;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->Y3(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic z2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic z3(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->v5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method


# virtual methods
.method public final synthetic A4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    new-instance v1, Ll/axz;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/axz;-><init>(Ll/yxz;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public A5(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->k0:Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->setVisible(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B4()V
    .locals 2

    .line 1
    new-instance v0, Ll/wwz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wwz;-><init>(Ll/yxz;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p0, v1, v0}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public B5()V
    .locals 2

    .line 1
    const-string v0, "\u52a8\u753b\u7ed3\u675f"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 7
    .line 8
    check-cast v0, Ll/tvz;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, v0, Ll/tvz;->P0:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/yxz;->V1:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/yxz;->W1:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 24
    .line 25
    check-cast v0, Ll/tvz;

    .line 26
    .line 27
    iget-object v0, v0, Ll/tvz;->R0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 36
    .line 37
    new-instance v1, Ll/fxz;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/fxz;-><init>(Ll/yxz;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final synthetic C4(Ljava/util/List;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/hxy;->B(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 9
    .line 10
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v2, Ll/qec0;->X4:I

    .line 15
    .line 16
    iget-object v3, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

    .line 24
    .line 25
    iget-object v2, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    invoke-virtual {v0, v2, p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->d0(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;Ll/yxz;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/owz;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/owz;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1, v2}, Ll/qzz;->f2(ILjava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    sget v1, Ll/qa00;->m:I

    .line 44
    .line 45
    iget-object v2, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    sub-int/2addr v1, v2

    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "opening_guidance_showtime"

    .line 62
    .line 63
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/Prologue;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Prologue;->value:Ljava/lang/String;

    .line 74
    .line 75
    const-string v0, "opening_content"

    .line 76
    .line 77
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-string p2, "e_send_opening_guidance"

    .line 86
    .line 87
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public D0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qzz;->D0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic D4(Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E1(Landroid/view/Menu;)Z
    .locals 12

    .line 1
    invoke-super/range {p0 .. p1}, Ll/qzz;->E1(Landroid/view/Menu;)Z

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-interface {v2}, Ll/r97;->G1()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    sget v2, Ll/edc0;->k2:I

    .line 19
    .line 20
    const-string v3, ""

    .line 21
    .line 22
    const/4 v4, 0x4

    .line 23
    const/4 v5, 0x2

    .line 24
    invoke-interface {p1, v4, v2, v5, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 29
    .line 30
    .line 31
    sget v2, Ll/qec0;->c1:I

    .line 32
    .line 33
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    .line 34
    .line 35
    .line 36
    invoke-interface {v1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Ll/edc0;->k2:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/uvz;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/uvz;-><init>(Ll/yxz;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_0
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 57
    .line 58
    check-cast v2, Ll/tvz;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/clz;->d4()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 75
    .line 76
    check-cast v3, Ll/tvz;

    .line 77
    .line 78
    invoke-virtual {v3}, Ll/tvz;->r3()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    new-instance v5, Ll/fwz;

    .line 87
    .line 88
    invoke-direct {v5, p0}, Ll/fwz;-><init>(Ll/yxz;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v2, p1, v3, v4, v5}, Ll/r97;->m4(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 96
    .line 97
    move-object v3, v2

    .line 98
    check-cast v3, Ll/tvz;

    .line 99
    .line 100
    check-cast v2, Ll/tvz;

    .line 101
    .line 102
    invoke-virtual {v2}, Ll/tvz;->r3()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v3, v2}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_2

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 121
    .line 122
    check-cast v3, Ll/tvz;

    .line 123
    .line 124
    invoke-virtual {v3}, Ll/tvz;->r3()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    move-object v0, v2

    .line 129
    move-object v2, v3

    .line 130
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    const/4 v8, 0x0

    .line 135
    const/4 v9, 0x0

    .line 136
    const/4 v4, 0x0

    .line 137
    const/4 v5, 0x0

    .line 138
    const/4 v6, 0x0

    .line 139
    const/4 v7, 0x0

    .line 140
    move-object v1, p1

    .line 141
    invoke-interface/range {v0 .. v9}, Ll/r97;->r1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 154
    .line 155
    check-cast v1, Ll/tvz;

    .line 156
    .line 157
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-interface {v1}, Ll/r97;->D()Z

    .line 174
    .line 175
    .line 176
    move-result v10

    .line 177
    const-string v11, "chat_page"

    .line 178
    .line 179
    const/4 v4, 0x1

    .line 180
    const/4 v5, 0x1

    .line 181
    const/4 v6, 0x0

    .line 182
    const/4 v7, 0x0

    .line 183
    const/4 v8, 0x0

    .line 184
    const/4 v9, 0x1

    .line 185
    move-object v1, p1

    .line 186
    invoke-interface/range {v0 .. v11}, Ll/r97;->L2(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;ZZLjava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :goto_0
    const/4 v0, 0x1

    .line 190
    return v0
.end method

.method public final synthetic E4(ILandroid/view/View;)V
    .locals 2

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/g;->u1:Ll/vxd0;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p2, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->t1:Ll/byd0;

    .line 19
    .line 20
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 32
    .line 33
    check-cast p0, Ll/tvz;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "e_switchphoto_pop"

    .line 40
    .line 41
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic F4(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/yxz;->N1:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->message:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/qzz;->p1:Ll/clz;

    .line 6
    .line 7
    check-cast p2, Ll/tvz;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->content:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ll/clz;->S6(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->photo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    if-ne p1, p2, :cond_1

    .line 37
    .line 38
    iget-object p2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/4 v3, 0x6

    .line 49
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->canClickSubmitInPreviewWhenNoSelectedMedia()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const/4 v2, 0x1

    .line 74
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 91
    .line 92
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->h:I

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSubmitButtonTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const/4 v1, 0x4

    .line 103
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/16 v1, 0x312

    .line 116
    .line 117
    invoke-virtual {p2, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 121
    .line 122
    sget v0, Ll/y7c0;->e:I

    .line 123
    .line 124
    sget v1, Ll/y7c0;->a:I

    .line 125
    .line 126
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->chuEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 131
    .line 132
    if-eq p1, p2, :cond_2

    .line 133
    .line 134
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->friendEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 135
    .line 136
    if-ne p1, p2, :cond_3

    .line 137
    .line 138
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 139
    .line 140
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 141
    .line 142
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/core/api/z;->r3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_3

    .line 153
    .line 154
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_3

    .line 161
    .line 162
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 163
    .line 164
    check-cast v1, Ll/tvz;

    .line 165
    .line 166
    invoke-virtual {v1, p2, v0}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 167
    .line 168
    .line 169
    :cond_3
    :goto_0
    iget-object p2, p0, Ll/qzz;->p1:Ll/clz;

    .line 170
    .line 171
    check-cast p2, Ll/tvz;

    .line 172
    .line 173
    invoke-virtual {p2}, Ll/clz;->pageId()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    const-string v0, "heat_reduce_function_name"

    .line 178
    .line 179
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->key:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    const-string v0, "e_heat_reduce_remind"

    .line 190
    .line 191
    invoke-static {v0, p2, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0}, Ll/qzz;->X1()V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public H1(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "text"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "fake_private_question_id_"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "fake_id_"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-boolean v0, p0, Ll/yxz;->a2:Z

    .line 32
    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/tye;->b()Lcom/p1/mobile/putong/core/data/EmojiAnimData;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->emojiAnimCreatedTime:Ljava/util/Map;

    .line 45
    .line 46
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 47
    .line 48
    check-cast v2, Ll/tvz;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/clz;->i3()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->emojiAnimCreatedTime:Ljava/util/Map;

    .line 63
    .line 64
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 65
    .line 66
    check-cast v3, Ll/tvz;

    .line 67
    .line 68
    invoke-virtual {v3}, Ll/clz;->i3()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ljava/lang/Double;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 79
    .line 80
    .line 81
    move-result-wide v3

    .line 82
    cmpg-double v0, v1, v3

    .line 83
    .line 84
    if-gtz v0, :cond_1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0}, Ll/tye;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_2

    .line 98
    .line 99
    sget-object v1, Ll/oze;->h:Ljava/util/Map;

    .line 100
    .line 101
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_2

    .line 106
    .line 107
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Ljava/lang/Integer;

    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-virtual {p0, v0, p1}, Ll/yxz;->Y4(ILcom/p1/mobile/putong/core/data/Message;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic H4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "https://auto.tancdn.com/v1/raw/3590924d-0e8a-4b36-9c6f-25e1d8559e5810.svga"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/qzz;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final I3()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/qec0;->v4:I

    .line 8
    .line 9
    iget-object v2, p0, Ll/qzz;->o:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/qzz;->i0(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/qzz;->o:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    :goto_0
    iget-object v2, p0, Ll/qzz;->o:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-ge v3, v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Ll/qzz;->o:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v4, p0, Ll/qzz;->p1:Ll/clz;

    .line 40
    .line 41
    check-cast v4, Ll/tvz;

    .line 42
    .line 43
    invoke-virtual {v4}, Ll/j3z;->e0()Ll/mzl;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-interface {v4}, Ll/mzl;->B0()Ll/u1z;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Ll/j3z;->g0()Ll/iam;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    check-cast v4, Ll/d3z;

    .line 56
    .line 57
    invoke-virtual {v4}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    if-ne v2, v4, :cond_0

    .line 62
    .line 63
    move v1, v3

    .line 64
    goto :goto_1

    .line 65
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    :goto_1
    iget-object v2, p0, Ll/qzz;->o:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    const/16 v0, 0x8

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic I4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    const-string v2, "alpha"

    .line 12
    .line 13
    invoke-static {v0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-wide/16 v1, 0x12c

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/yxz$l;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/yxz$l;-><init>(Ll/yxz;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void

    .line 35
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final J3(Landroid/view/View;Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yxz;->b2:[I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/yxz;->b2:[I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget v0, p0, v0

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    iput v0, p2, Landroid/graphics/RectF;->left:F

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    aget p0, p0, v1

    .line 16
    .line 17
    int-to-float p0, p0

    .line 18
    iput p0, p2, Landroid/graphics/RectF;->top:F

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    int-to-float p0, p0

    .line 25
    add-float/2addr v0, p0

    .line 26
    iput v0, p2, Landroid/graphics/RectF;->right:F

    .line 27
    .line 28
    iget p0, p2, Landroid/graphics/RectF;->top:F

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    int-to-float p1, p1

    .line 35
    add-float/2addr p0, p1

    .line 36
    iput p0, p2, Landroid/graphics/RectF;->bottom:F

    .line 37
    .line 38
    return-void
.end method

.method public final synthetic J4(DLl/uxj0;)Ll/pf60;
    .locals 2

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p3, p3, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 6
    .line 7
    check-cast p0, Ll/tvz;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p3, p0, p1, p2}, Ll/t600;->F(Ljava/lang/String;D)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const-string p2, ""

    .line 22
    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    if-eqz p3, :cond_1

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    check-cast p3, Lcom/p1/mobile/putong/core/data/Message;

    .line 40
    .line 41
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 42
    .line 43
    const-string v1, "text"

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Ll/tye;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_0

    .line 62
    .line 63
    sget-object v1, Ll/oze;->h:Ljava/util/Map;

    .line 64
    .line 65
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    invoke-static {v0, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_1
    const/4 p1, 0x0

    .line 77
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 82
    .line 83
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :cond_2
    const/4 p0, 0x0

    .line 89
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method

.method public K3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yxz;->g2:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/x20;

    .line 18
    .line 19
    invoke-interface {v1}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Ll/yxz;->g2:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic K4(Lcom/p1/mobile/putong/core/data/EmojiAnimData;Ll/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->emojiAnimCreatedTime:Ljava/util/Map;

    .line 20
    .line 21
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 22
    .line 23
    check-cast v1, Ll/tvz;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/clz;->i3()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 32
    .line 33
    iget-wide v2, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 34
    .line 35
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2, p1}, Ll/tye;->j(Lcom/p1/mobile/putong/core/data/EmojiAnimData;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Ll/yxz;->a2:Z

    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    sget-object p1, Ll/oze;->h:Ljava/util/Map;

    .line 54
    .line 55
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 56
    .line 57
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 70
    .line 71
    invoke-virtual {p0, p1, p2}, Ll/yxz;->Y4(ILcom/p1/mobile/putong/core/data/Message;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public L3(Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast v0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/yxz;->g2:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic L4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->w(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Ll/yxz$j;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1}, Ll/yxz$j;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Ll/qzz;->m1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic M4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->q5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yxz;->Y1:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic N4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->q5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O0(IZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/qzz;->O0(IZ)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 5
    .line 6
    check-cast p0, Ll/tvz;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/tvz;->Rg(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public O3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yxz;->g2:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public final synthetic O4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x2af8

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yxz;->B5()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    long-to-int p2, v0

    .line 20
    const/16 v0, 0x8b9

    .line 21
    .line 22
    if-ne p2, v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 25
    .line 26
    new-instance v1, Ll/sxz;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/sxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 35
    .line 36
    check-cast v0, Ll/tvz;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ll/d3z;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 63
    .line 64
    check-cast p0, Ll/tvz;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/clz;->k3()D

    .line 67
    .line 68
    .line 69
    move-result-wide v1

    .line 70
    invoke-virtual {v0, p2, p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->k(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void
.end method

.method public final P3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast v0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/yvz;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/yvz;-><init>(Ll/yxz;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic P4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 6

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/text/TextPaint;-><init>()V

    .line 9
    .line 10
    .line 11
    sget v2, Ll/qa00;->m:I

    .line 12
    .line 13
    int-to-float v2, v2

    .line 14
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    invoke-virtual {v3}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget v4, Ll/g9c0;->a0:I

    .line 28
    .line 29
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 37
    .line 38
    .line 39
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object v4, p0, Ll/qzz;->p1:Ll/clz;

    .line 50
    .line 51
    check-cast v4, Ll/tvz;

    .line 52
    .line 53
    invoke-virtual {v4}, Ll/clz;->m3()D

    .line 54
    .line 55
    .line 56
    move-result-wide v4

    .line 57
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->b(D)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v4, "\u00b0C"

    .line 65
    .line 66
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const-string v4, "wendushu"

    .line 74
    .line 75
    invoke-virtual {v0, v3, v1, v4}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 79
    .line 80
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->y(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ll/yxz$i;

    .line 101
    .line 102
    invoke-direct {v1, p0, p2, p1}, Ll/yxz$i;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object p0, p0, Ll/qzz;->m1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public Q1(ZLjava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

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
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-lez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, p1, v1}, Ll/hxy;->y(ZLjava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/qzz;->R1(ZLjava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public final synthetic Q4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->A(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Ll/qzz;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public R3()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/qzz;->x1:Ll/kcg0;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 22
    .line 23
    check-cast v0, Ll/tvz;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    :goto_0
    return-void

    .line 36
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 57
    .line 58
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->expire:J

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    const-wide/16 v0, 0x0

    .line 62
    .line 63
    :goto_1
    iget-object v2, p0, Ll/qzz;->d1:Lv/VImage;

    .line 64
    .line 65
    sget v3, Ll/ibc0;->h1:I

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Ll/qzz;->c1:Lv/VLinear;

    .line 71
    .line 72
    sget v3, Ll/ibc0;->i1:I

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Ll/qzz;->e1:Lv/VText;

    .line 78
    .line 79
    new-instance v3, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v4}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-interface {v4, v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Uq(J)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v4, "  "

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Ll/qzz;->c1:Lv/VLinear;

    .line 112
    .line 113
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-nez v2, :cond_4

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/qzz;->I0()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ll/qzz;->C0()Landroid/content/Context;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->u3:I

    .line 131
    .line 132
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {p0, v2}, Ll/qzz;->c2(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-interface {v2, v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->la(J)Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-nez v2, :cond_5

    .line 152
    .line 153
    invoke-virtual {p0}, Ll/qzz;->z0()V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_5
    new-instance v2, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 158
    .line 159
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 160
    .line 161
    .line 162
    const-string v3, "countdown_item_love_buzz_key"

    .line 163
    .line 164
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-virtual {v4, v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-wide/16 v4, 0x3c

    .line 173
    .line 174
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    const/4 v1, 0x1

    .line 179
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 184
    .line 185
    .line 186
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 187
    .line 188
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 189
    .line 190
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 198
    .line 199
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 200
    .line 201
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/api/c0;->n(Ljava/lang/String;)Lrx/c;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    new-instance v1, Ll/zvz;

    .line 210
    .line 211
    invoke-direct {v1, p0}, Ll/zvz;-><init>(Ll/yxz;)V

    .line 212
    .line 213
    .line 214
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iput-object v0, p0, Ll/qzz;->x1:Ll/kcg0;

    .line 223
    .line 224
    return-void
.end method

.method public final synthetic R4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->z(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Ll/qzz;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public S3(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->first:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 4
    .line 5
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/qzz;->G:Landroid/view/View;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->m(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0, p1}, Ll/yxz;->z5(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/qzz;->j0()Ll/g900;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/l900;->y()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic S4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast v0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/clz;->Z6(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/qzz;->j0()Ll/g900;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/l900;->y()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->A(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ll/qzz;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public T3()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast v0, Ll/tvz;

    .line 4
    .line 5
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 20
    .line 21
    check-cast v1, Ll/tvz;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/qzz;->I:Lv/VText;

    .line 32
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "\u65e0\u6cd5\u6536\u5230"

    .line 36
    .line 37
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    const-string v4, "\u4ed6"

    .line 45
    .line 46
    const-string v5, "\u5979"

    .line 47
    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    move-object v3, v5

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move-object v3, v4

    .line 53
    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v3, "\u7684\u6d88\u606f\u901a\u77e5 "

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/qzz;->J:Lv/VText_AutoFit;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    move-object v4, v5

    .line 77
    :cond_2
    const-string v0, "\u4ec5\u6253\u5f00\u597d\u53cb\u6d88\u606f\u901a\u77e5\uff0c\u53ca\u65f6\u56de\u590d"

    .line 78
    .line 79
    invoke-virtual {v0, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-interface {v0}, Ll/r97;->E3()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/qzz;->r0()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 113
    .line 114
    check-cast v1, Ll/tvz;

    .line 115
    .line 116
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 117
    .line 118
    invoke-interface {v0, v1}, Ll/r97;->R2(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_5

    .line 123
    .line 124
    iget-object v0, p0, Ll/qzz;->H:Landroid/widget/LinearLayout;

    .line 125
    .line 126
    const/4 v1, 0x1

    .line 127
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    const-string v0, "e_open_button_click"

    .line 131
    .line 132
    const-string v1, "p_chat_view"

    .line 133
    .line 134
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 140
    .line 141
    iget-object v0, v0, Ll/dkb;->q0:Ll/xyd0;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ljava/util/HashSet;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    const/4 v2, 0x2

    .line 154
    if-ge v1, v2, :cond_4

    .line 155
    .line 156
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 157
    .line 158
    check-cast v1, Ll/tvz;

    .line 159
    .line 160
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 168
    .line 169
    iget-object v1, v1, Ll/dkb;->q0:Ll/xyd0;

    .line 170
    .line 171
    invoke-virtual {v1, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    :cond_4
    iget-object v0, p0, Ll/qzz;->L:Lv/VImage;

    .line 175
    .line 176
    new-instance v1, Ll/vvz;

    .line 177
    .line 178
    invoke-direct {v1, p0}, Ll/vvz;-><init>(Ll/yxz;)V

    .line 179
    .line 180
    .line 181
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Ll/qzz;->K:Lv/VButton;

    .line 185
    .line 186
    new-instance v1, Ll/wvz;

    .line 187
    .line 188
    invoke-direct {v1, p0}, Ll/wvz;-><init>(Ll/yxz;)V

    .line 189
    .line 190
    .line 191
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 192
    .line 193
    .line 194
    :cond_5
    :goto_1
    return-void
.end method

.method public final synthetic T4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Ll/qzz;->k:Landroid/view/View;

    .line 12
    .line 13
    iget-object v3, p0, Ll/yxz;->h2:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->m(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->m(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    filled-new-array {v4, p2}, [I

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {v2, v3, p2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v2, Landroid/animation/ArgbEvaluator;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v2}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->first:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 43
    .line 44
    if-ne p1, p2, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Ll/qzz;->G:Landroid/view/View;

    .line 47
    .line 48
    const/4 p1, 0x2

    .line 49
    new-array p1, p1, [F

    .line 50
    .line 51
    fill-array-data p1, :array_0

    .line 52
    .line 53
    .line 54
    const-string p2, "alpha"

    .line 55
    .line 56
    invoke-static {p0, p2, p1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 64
    .line 65
    .line 66
    const-wide/16 p0, 0x384

    .line 67
    .line 68
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final U3()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/qzz;->s0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/qzz;->G:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/qzz;->P:Lv/VFrame;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 21
    .line 22
    new-instance v2, Ll/yxz$d;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/yxz$d;-><init>(Ll/yxz;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v2}, Ll/iwl;->n(Ll/pn50;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/qzz;->S:Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;

    .line 31
    .line 32
    new-instance v2, Ll/yxz$e;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/yxz$e;-><init>(Ll/yxz;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;->setOnDispatchTouchEventListener(Ll/bm50;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/c300;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, Ll/bwz;

    .line 47
    .line 48
    invoke-direct {v3, p0}, Ll/bwz;-><init>(Ll/yxz;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {v0, v2, v3}, Ll/c300;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 52
    .line 53
    .line 54
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 59
    .line 60
    check-cast v3, Ll/tvz;

    .line 61
    .line 62
    iget-object v3, v3, Ll/clz;->b:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 69
    .line 70
    new-instance v3, Ll/cwz;

    .line 71
    .line 72
    invoke-direct {v3}, Ll/cwz;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-virtual {v2, v1, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Ll/c300;->O(Ljava/util/List;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Ll/qzz;->Q:Landroidx/recyclerview/widget/RecyclerView;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic U4(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/Long;)V
    .locals 8

    .line 1
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x2af8

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yxz;->B5()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    long-to-int v3, v0

    .line 20
    sget-object p3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 21
    .line 22
    if-ne p1, p3, :cond_1

    .line 23
    .line 24
    const/16 p3, 0x96

    .line 25
    .line 26
    if-ne v3, p3, :cond_4

    .line 27
    .line 28
    iget-object p3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 29
    .line 30
    new-instance v0, Ll/lxz;

    .line 31
    .line 32
    invoke-direct {v0, p0, p2}, Ll/lxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p3, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/16 p3, 0x5aa

    .line 40
    .line 41
    if-ne v3, p3, :cond_2

    .line 42
    .line 43
    iget-object p3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    new-instance v0, Ll/nxz;

    .line 46
    .line 47
    invoke-direct {v0, p0, p2}, Ll/nxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p3, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const/16 p3, 0x866

    .line 55
    .line 56
    if-ne v3, p3, :cond_3

    .line 57
    .line 58
    iget-object p3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 59
    .line 60
    new-instance v0, Ll/oxz;

    .line 61
    .line 62
    invoke-direct {v0, p0, p2}, Ll/oxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p3, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    const/16 p3, 0xb46

    .line 70
    .line 71
    if-ne v3, p3, :cond_4

    .line 72
    .line 73
    iget-object p3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 74
    .line 75
    new-instance v0, Ll/pxz;

    .line 76
    .line 77
    invoke-direct {v0, p0, p1, p2}, Ll/pxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p3, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    :cond_4
    :goto_0
    iget-object p3, p0, Ll/qzz;->p1:Ll/clz;

    .line 84
    .line 85
    check-cast p3, Ll/tvz;

    .line 86
    .line 87
    invoke-virtual {p3}, Ll/j3z;->e0()Ll/mzl;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-interface {p3}, Ll/mzl;->B0()Ll/u1z;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    invoke-virtual {p3}, Ll/j3z;->g0()Ll/iam;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    check-cast p3, Ll/d3z;

    .line 100
    .line 101
    invoke-virtual {p3}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-eqz p3, :cond_5

    .line 110
    .line 111
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 112
    .line 113
    check-cast p0, Ll/tvz;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/clz;->m3()D

    .line 116
    .line 117
    .line 118
    move-result-wide v6

    .line 119
    move-object v4, p1

    .line 120
    move-object v5, p2

    .line 121
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->l(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V

    .line 122
    .line 123
    .line 124
    :cond_5
    return-void
.end method

.method public V3(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast p0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/mzl;->F()Ll/ruy;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ll/ruy;->x0(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic V4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/tvz;

    .line 5
    .line 6
    iget-object v1, v1, Ll/tvz;->R0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    check-cast v0, Ll/tvz;

    .line 12
    .line 13
    iget-object v0, v0, Ll/tvz;->R0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 20
    .line 21
    check-cast v1, Ll/tvz;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput-object v2, v1, Ll/tvz;->R0:Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 25
    .line 26
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 27
    .line 28
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 33
    .line 34
    check-cast v2, Ll/tvz;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v4, "\u5347\u6e29\u6267\u884ccache currentLevel = "

    .line 43
    .line 44
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v4, " chatHeat="

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->toJson()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 76
    .line 77
    iget v2, v2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 78
    .line 79
    if-le v1, v2, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 82
    .line 83
    check-cast p0, Ll/tvz;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ll/tvz;->Mg(Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    :goto_0
    return-void
.end method

.method public W3(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/yxz;->O1:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 4
    .line 5
    check-cast p0, Ll/tvz;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/n2;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/n2;->l()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public W4(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/yxz;->i2:Z

    .line 2
    .line 3
    iget-object p1, p0, Ll/qzz;->r1:Ll/hxy;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/qzz;->r1:Ll/hxy;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/hxy;->m()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-lez p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/qzz;->r1:Ll/hxy;

    .line 30
    .line 31
    iget-object p1, p1, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Ll/qzz;->r1:Ll/hxy;

    .line 40
    .line 41
    iget-object p1, p1, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    iget-object p0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/hxy;->G()V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public final X3(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast v0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/mzl;->F()Ll/ruy;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/ruy;->n0()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/yxz;->c2:Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/yxz;->J3(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/yxz;->d2:Landroid/graphics/RectF;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Ll/yxz;->J3(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/qzz;->p1:Ll/clz;

    .line 28
    .line 29
    check-cast p1, Ll/tvz;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1}, Ll/mzl;->B0()Ll/u1z;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/d3z;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object v0, p0, Ll/yxz;->e2:Landroid/graphics/RectF;

    .line 50
    .line 51
    invoke-virtual {p0, p1, v0}, Ll/yxz;->J3(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/yxz;->d2:Landroid/graphics/RectF;

    .line 55
    .line 56
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 57
    .line 58
    iget-object v1, p0, Ll/yxz;->c2:Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 61
    .line 62
    cmpl-float v0, v0, v1

    .line 63
    .line 64
    if-ltz v0, :cond_0

    .line 65
    .line 66
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 67
    .line 68
    iget-object p0, p0, Ll/yxz;->e2:Landroid/graphics/RectF;

    .line 69
    .line 70
    iget p0, p0, Landroid/graphics/RectF;->top:F

    .line 71
    .line 72
    cmpg-float p0, p1, p0

    .line 73
    .line 74
    if-gtz p0, :cond_0

    .line 75
    .line 76
    const/4 p0, 0x1

    .line 77
    return p0

    .line 78
    :cond_0
    const/4 p0, 0x0

    .line 79
    return p0
.end method

.method public X4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yxz;->K3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Y3(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/yxz;->X3(Landroid/view/View;)Z

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
    iget-object v0, p0, Ll/yxz;->d2:Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Ll/yxz;->J3(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->w0()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    int-to-float p1, p1

    .line 18
    iget-object p0, p0, Ll/yxz;->d2:Landroid/graphics/RectF;

    .line 19
    .line 20
    iget p0, p0, Landroid/graphics/RectF;->top:F

    .line 21
    .line 22
    sub-float/2addr p1, p0

    .line 23
    const/high16 p0, 0x42c80000    # 100.0f

    .line 24
    .line 25
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    int-to-float p0, p0

    .line 30
    cmpl-float p0, p1, p0

    .line 31
    .line 32
    if-ltz p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    return v1
.end method

.method public Y4(ILcom/p1/mobile/putong/core/data/Message;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tye;->b()Lcom/p1/mobile/putong/core/data/EmojiAnimData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->emojiAnimCreatedTime:Ljava/util/Map;

    .line 10
    .line 11
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 12
    .line 13
    check-cast v2, Ll/tvz;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/clz;->i3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-wide v3, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 20
    .line 21
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, v0}, Ll/tye;->j(Lcom/p1/mobile/putong/core/data/EmojiAnimData;)V

    .line 33
    .line 34
    .line 35
    iget-boolean p2, p0, Ll/yxz;->Z1:Z

    .line 36
    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const/4 p2, 0x1

    .line 41
    iput-boolean p2, p0, Ll/yxz;->Z1:Z

    .line 42
    .line 43
    new-instance v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string v1, "emoji"

    .line 59
    .line 60
    invoke-virtual {v0, p1, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 64
    .line 65
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Cj()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    new-instance v0, Ll/yxz$f;

    .line 94
    .line 95
    invoke-direct {v0, p0}, Ll/yxz$f;-><init>(Ll/yxz;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p0, p0, Ll/qzz;->S0:Lcom/tantan/library/svga/SVGAnimationView;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public Z3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Z4(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    new-instance v1, Ll/nwz;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, Ll/nwz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public a4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yxz;->U1:Z

    .line 2
    .line 3
    return p0
.end method

.method public a5(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;Z)V
    .locals 9

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    new-instance v1, Ll/xwz;

    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move-object v8, p1

    .line 11
    move-object v3, p2

    .line 12
    move-object v4, p3

    .line 13
    move v5, p4

    .line 14
    move-object v6, p5

    .line 15
    move v7, p6

    .line 16
    invoke-direct/range {v1 .. v8}, Ll/xwz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;ZLcom/p1/mobile/putong/core/data/Message;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public b4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yxz;->i2:Z

    .line 2
    .line 3
    return p0
.end method

.method public b5(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/yxz;->U1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/yxz;->U1:Z

    .line 9
    .line 10
    iget-object v1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/view/ViewGroup;

    .line 21
    .line 22
    iget-object v2, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    new-instance v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    iget-object v3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 29
    .line 30
    invoke-direct {v2, v3}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    instance-of v3, v1, Landroid/widget/FrameLayout;

    .line 36
    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    move-object v3, v1

    .line 40
    check-cast v3, Landroid/widget/FrameLayout;

    .line 41
    .line 42
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    const/4 v5, -0x1

    .line 45
    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-static {p3}, Ll/sv4;->a(Lcom/p1/mobile/putong/core/data/Sticker;)Ll/sv4;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const/4 v4, 0x0

    .line 60
    if-eqz v3, :cond_4

    .line 61
    .line 62
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 63
    .line 64
    const-string v3, "\u665a\u5b89"

    .line 65
    .line 66
    invoke-static {p3, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    if-eqz p3, :cond_2

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    iget-object p1, p0, Ll/qzz;->p1:Ll/clz;

    .line 79
    .line 80
    check-cast p1, Ll/tvz;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-interface {p1}, Ll/mzl;->d0()Ll/vez;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Ll/n2;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/n2;->d()Z

    .line 97
    .line 98
    .line 99
    :cond_2
    iget-object p1, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 100
    .line 101
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 105
    .line 106
    iget-object p3, p0, Ll/qzz;->p1:Ll/clz;

    .line 107
    .line 108
    check-cast p3, Ll/tvz;

    .line 109
    .line 110
    invoke-virtual {p3}, Ll/j3z;->e0()Ll/mzl;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    invoke-interface {p3}, Ll/mzl;->d0()Ll/vez;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    invoke-virtual {p3}, Ll/vez;->x0()Lrx/subjects/a;

    .line 119
    .line 120
    .line 121
    move-result-object p3

    .line 122
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    check-cast p3, Ljava/lang/Integer;

    .line 127
    .line 128
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 133
    .line 134
    check-cast v3, Ll/tvz;

    .line 135
    .line 136
    invoke-virtual {v3}, Ll/j3z;->e0()Ll/mzl;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-interface {v3}, Ll/mzl;->l()Ll/clz;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3}, Ll/clz;->t7()Ll/qzz;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    iget-object v3, v3, Ll/qzz;->i:Landroid/widget/FrameLayout;

    .line 149
    .line 150
    invoke-virtual {v2, p1, p3, v3, v1}, Ll/sv4;->e(Lcom/tantan/library/svga/SVGAnimationView;ILandroid/view/View;Landroid/view/View;)V

    .line 151
    .line 152
    .line 153
    new-array p1, v0, [Ll/kcg0;

    .line 154
    .line 155
    iget-object p3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 156
    .line 157
    invoke-static {p3}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    invoke-virtual {p3, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    new-instance p3, Ll/yxz$c;

    .line 174
    .line 175
    invoke-direct {p3, p0}, Ll/yxz$c;-><init>(Ll/yxz;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p2, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    new-instance p3, Ll/yxz$b;

    .line 183
    .line 184
    invoke-direct {p3, p0, v2, v1, p1}, Ll/yxz$b;-><init>(Ll/yxz;Ll/sv4;Landroid/view/ViewGroup;[Ll/kcg0;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    iget-object p3, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 192
    .line 193
    invoke-virtual {p2, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 194
    .line 195
    .line 196
    iget-boolean p2, v2, Ll/sv4;->l:Z

    .line 197
    .line 198
    if-eqz p2, :cond_3

    .line 199
    .line 200
    iget-object p2, p0, Ll/qzz;->p1:Ll/clz;

    .line 201
    .line 202
    check-cast p2, Ll/tvz;

    .line 203
    .line 204
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-interface {p2}, Ll/mzl;->d0()Ll/vez;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-virtual {p2}, Ll/vez;->x0()Lrx/subjects/a;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    new-instance p3, Ll/mwz;

    .line 217
    .line 218
    invoke-direct {p3, p0, v2}, Ll/mwz;-><init>(Ll/yxz;Ll/sv4;)V

    .line 219
    .line 220
    .line 221
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    aput-object p0, p1, v4

    .line 230
    .line 231
    :cond_3
    :goto_0
    return-void

    .line 232
    :cond_4
    iput-boolean v4, p0, Ll/yxz;->U1:Z

    .line 233
    .line 234
    iget-object p0, p0, Ll/yxz;->Y1:Lrx/subjects/b;

    .line 235
    .line 236
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 237
    .line 238
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method public c4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yxz;->O1:Z

    .line 2
    .line 3
    return p0
.end method

.method public c5(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast p1, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/mzl;->B0()Ll/u1z;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/d3z;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/qzz;->m:Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    const-string v0, "0"

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->h(ZLjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public d4(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qzz;->m1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x42c80000    # 100.0f

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qzz;->m1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    add-int/2addr v2, v3

    .line 28
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 29
    .line 30
    iget-object v2, p0, Ll/qzz;->m1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ll/qzz;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/qzz;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 50
    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    add-int/2addr v1, v2

    .line 60
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 61
    .line 62
    iget-object v1, p0, Ll/qzz;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    iget-object v0, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 82
    .line 83
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 88
    .line 89
    iget-object p0, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    return-void
.end method

.method public d5(Z)V
    .locals 6

    .line 1
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/k05;->j()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean p1, p0, Ll/qzz;->H1:Z

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/qzz;->p0:Lv/VLinear;

    .line 23
    .line 24
    const/high16 v1, 0x42c00000    # 96.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {p1, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/k05;->k()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object v2, p0, Ll/qzz;->F0:Lv/VText;

    .line 49
    .line 50
    const-string v3, "\u518d\u6765\u4e00\u6279"

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const-string v3, "e_newmatch_next_batch"

    .line 64
    .line 65
    invoke-static {v3, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 78
    .line 79
    check-cast v2, Ll/tvz;

    .line 80
    .line 81
    invoke-virtual {v2}, Ll/tvz;->r3()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const-string v3, "other_uid"

    .line 86
    .line 87
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 92
    .line 93
    check-cast v3, Ll/tvz;

    .line 94
    .line 95
    invoke-virtual {v3}, Ll/clz;->y3()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    const-string v4, "newmatch_next_from"

    .line 100
    .line 101
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    const-string v5, "newmatch_next_number"

    .line 114
    .line 115
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    filled-new-array {v2, v3, v4}, [Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    const-string v3, "e_newmatch_next"

    .line 124
    .line 125
    invoke-static {v3, p1, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 126
    .line 127
    .line 128
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Ljava/lang/String;

    .line 133
    .line 134
    iget-object v2, p0, Ll/qzz;->F0:Lv/VText;

    .line 135
    .line 136
    new-instance v3, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Ll/h39;->V()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string v4, " ("

    .line 149
    .line 150
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v4, ")"

    .line 161
    .line 162
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    iget-object v3, p0, Ll/qzz;->E0:Lv/VDraweeView;

    .line 177
    .line 178
    if-nez v2, :cond_3

    .line 179
    .line 180
    const/4 v1, 0x1

    .line 181
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 189
    .line 190
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 191
    .line 192
    invoke-virtual {v2, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-virtual {p1}, Lrx/c;->first()Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    new-instance v1, Ll/uxz;

    .line 205
    .line 206
    invoke-direct {v1, p0}, Ll/uxz;-><init>(Ll/yxz;)V

    .line 207
    .line 208
    .line 209
    new-instance v2, Ll/vxz;

    .line 210
    .line 211
    invoke-direct {v2}, Ll/vxz;-><init>()V

    .line 212
    .line 213
    .line 214
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 219
    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_3
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 223
    .line 224
    .line 225
    :goto_1
    iget-object p1, p0, Ll/qzz;->p0:Lv/VLinear;

    .line 226
    .line 227
    new-instance v1, Ll/wxz;

    .line 228
    .line 229
    invoke-direct {v1, p0, v0}, Ll/wxz;-><init>(Ll/yxz;Ljava/util/List;)V

    .line 230
    .line 231
    .line 232
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    new-instance v0, Ll/xxz;

    .line 240
    .line 241
    invoke-direct {v0, p0}, Ll/xxz;-><init>(Ll/yxz;)V

    .line 242
    .line 243
    .line 244
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 245
    .line 246
    .line 247
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/qzz;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 21
    .line 22
    const-string v1, "countdown_item_love_buzz_key"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ll/yxz;->V1:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/yxz;->W1:Ll/kcg0;

    .line 33
    .line 34
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic e4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yxz;->s5()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/yxz;->a2:Z

    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public e5(II)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/yxz;->P1:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    if-ne p2, v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 12
    .line 13
    check-cast v0, Ll/tvz;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/n2;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    const/4 v2, -0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/n2;->k(II)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Ll/yxz;->P1:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Ll/qzz;->Y0:Landroid/view/ViewStub;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 45
    .line 46
    iput-object v0, p0, Ll/yxz;->P1:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 47
    .line 48
    new-instance v1, Ll/yxz$h;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/yxz$h;-><init>(Ll/yxz;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->setVoiceCallAnimListener(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object p0, p0, Ll/yxz;->P1:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 57
    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->y(II)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public f0()Ll/rdz;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast v0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/tvz;->Gd()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/oxy;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/oxy;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/yxz;->R1:Ll/oxy;

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    new-instance v0, Ll/q800;

    .line 20
    .line 21
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 22
    .line 23
    check-cast v1, Ll/tvz;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ll/q800;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/yxz;->Q1:Ll/q800;

    .line 33
    .line 34
    return-object v0
.end method

.method public final synthetic f4(Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 5

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
    iget-object v0, p0, Ll/qzz;->e1:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/api/c0$b;->d:J

    .line 23
    .line 24
    invoke-interface {v2, v3, v4}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Uq(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, "  "

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/api/c0$b;->a:Z

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/qzz;->z0()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 51
    .line 52
    check-cast p0, Ll/tvz;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/u1z;->o2()V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 68
    .line 69
    const-string p1, "countdown_item_love_buzz_key"

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public f5(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/qzz;->j:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Ll/qzz;->j:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/qzz;->o:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    const-string v0, "#00000000"

    .line 25
    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 31
    .line 32
    .line 33
    iput-boolean v2, p0, Ll/yxz;->M1:Z

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/qzz;->j:Lv/VDraweeView;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/qzz;->j:Lv/VDraweeView;

    .line 46
    .line 47
    const-string v1, "#ffffff"

    .line 48
    .line 49
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 54
    .line 55
    .line 56
    iput-boolean v0, p0, Ll/yxz;->M1:Z

    .line 57
    .line 58
    :goto_0
    invoke-virtual {p0}, Ll/qzz;->j0()Ll/g900;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/l900;->y()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic g4(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_chat_open_push_close"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object p1, p1, Ll/dkb;->s0:Ll/xyd0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/util/HashSet;

    .line 19
    .line 20
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 21
    .line 22
    check-cast v0, Ll/tvz;

    .line 23
    .line 24
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    iget-object v0, v0, Ll/dkb;->s0:Ll/xyd0;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/qzz;->H:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public g5(IZ)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qzz;->l0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1, p1, p2}, Ll/hxy;->D(Ljava/lang/String;IZ)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/h39;->a()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p2, p0, Ll/qzz;->r1:Ll/hxy;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/hxy;->q()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    iget-object p2, p0, Ll/qzz;->r1:Ll/hxy;

    .line 28
    .line 29
    new-instance v0, Ll/awz;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/awz;-><init>(Ll/yxz;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, v0}, Ll/hxy;->A(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return p1
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    const-string p1, "\u5df2\u5f00\u542f\u6d88\u606f\u901a\u77e5"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qzz;->H:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public h5(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/bxz;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/bxz;-><init>(Ll/yxz;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return v1
.end method

.method public final synthetic i4(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "e_open_button_click"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    const-string v2, "openWithFriend"

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1, v3, v3}, Ll/dkb;->K9(Ljava/lang/String;ZII)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Ll/uwz;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/uwz;-><init>(Ll/yxz;)V

    .line 53
    .line 54
    .line 55
    new-instance p0, Ll/vwz;

    .line 56
    .line 57
    invoke-direct {p0}, Ll/vwz;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0}, Ll/r97;->T()V

    .line 77
    .line 78
    .line 79
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 82
    .line 83
    invoke-virtual {p0, v2, v1, v3, v3}, Ll/dkb;->K9(Ljava/lang/String;ZII)Lrx/c;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public i5()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/qwz;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/qwz;-><init>(Ll/yxz;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v2, v0}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return v1
.end method

.method public final synthetic j4(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 10
    .line 11
    move-object v2, v1

    .line 12
    check-cast v2, Ll/tvz;

    .line 13
    .line 14
    check-cast v1, Ll/tvz;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v2, v1}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 25
    .line 26
    check-cast p0, Ll/tvz;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->Z1(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public j5(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->p:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/qzz;->u:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/qzz;->y:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/qzz;->C:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/qzz;->H:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/qzz;->M:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/qzz;->N:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Ll/qzz;->M:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    new-instance v0, Ll/xvz;

    .line 41
    .line 42
    invoke-direct {v0, p0, p1}, Ll/xvz;-><init>(Ll/yxz;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    const-string p2, "user_risk_type"

    .line 49
    .line 50
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 55
    .line 56
    check-cast p0, Ll/tvz;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p2, "risk_userid"

    .line 63
    .line 64
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "e_chat_safety_notice"

    .line 73
    .line 74
    const-string p2, "p_chat_view"

    .line 75
    .line 76
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public k0()Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/yxz;->Q1:Ll/q800;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q800;->u()Lv/VDraweeView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/yxz;->Q1:Ll/q800;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/q800;->u()Lv/VDraweeView;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 40
    return-object p0
.end method

.method public final synthetic k4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k5(Lcom/p1/mobile/putong/data/Media;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/h39;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 10
    .line 11
    check-cast v0, Ll/tvz;

    .line 12
    .line 13
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->ShowPicLikeGuideTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->getLong(Ljava/lang/String;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    invoke-static {v2, v3, v4, v5}, Ll/pzi0;->C(JJ)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    if-eqz v2, :cond_5

    .line 42
    .line 43
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 44
    .line 45
    const-string v4, "default"

    .line 46
    .line 47
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_5

    .line 52
    .line 53
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_5

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 62
    .line 63
    const-string v3, "invalid"

    .line 64
    .line 65
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    invoke-static {}, Ll/h39;->d()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    const/4 v3, 0x0

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    iget-object p0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 80
    .line 81
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-eqz v4, :cond_3

    .line 90
    .line 91
    const-string p1, ""

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Ljava/lang/String;

    .line 101
    .line 102
    :goto_0
    invoke-static {p0, v0, v2, p1}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->y2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    invoke-virtual {p0}, Ll/qzz;->V1()V

    .line 107
    .line 108
    .line 109
    iget-object v2, p0, Ll/qzz;->r1:Ll/hxy;

    .line 110
    .line 111
    const/16 v4, 0xd

    .line 112
    .line 113
    invoke-virtual {v2, v4}, Ll/hxy;->B(I)V

    .line 114
    .line 115
    .line 116
    iget-object v2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 117
    .line 118
    invoke-static {v2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    sget v5, Ll/qec0;->w5:I

    .line 123
    .line 124
    iget-object v6, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 125
    .line 126
    invoke-virtual {v2, v5, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;

    .line 131
    .line 132
    iget-object v3, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 133
    .line 134
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iget-object v3, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 138
    .line 139
    new-instance v5, Ll/kwz;

    .line 140
    .line 141
    invoke-direct {v5, p0}, Ll/kwz;-><init>(Ll/yxz;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2, v3, p1, v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->a0(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V

    .line 145
    .line 146
    .line 147
    new-instance p1, Ll/lwz;

    .line 148
    .line 149
    invoke-direct {p1}, Ll/lwz;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v4, p1}, Ll/qzz;->f2(ILjava/lang/Runnable;)V

    .line 153
    .line 154
    .line 155
    sget p1, Ll/qa00;->m:I

    .line 156
    .line 157
    iget-object p0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    sub-int/2addr p1, p0

    .line 164
    invoke-static {v2, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 165
    .line 166
    .line 167
    :goto_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 168
    .line 169
    .line 170
    move-result-wide p0

    .line 171
    invoke-virtual {v1, v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->setLong(Ljava/lang/String;J)V

    .line 172
    .line 173
    .line 174
    :cond_5
    :goto_2
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l5(Ljava/util/List;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Prologue;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/mxz;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2}, Ll/mxz;-><init>(Ll/yxz;Ljava/util/List;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v1, v0}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return v2
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "e_chat_gift_view_thanks"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/yxz;->t5()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 18
    .line 19
    check-cast p0, Ll/tvz;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/clz;->U6(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public m5(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/jl80;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/ibc0;->C0:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "\u529f\u80fd\u5168\u65b0\u5347\u7ea7"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "\u672c\u6b21\u804a\u5929\u9700\u8981\u6d88\u8017\u4e00\u6b21\u6d88\u8017\u6b21\u6570"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, v1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "\u540c\u610f\u5e76\u804a\u5929"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "\u4e0d\u540c\u610f"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/dwz;

    .line 51
    .line 52
    invoke-direct {v1, p0, v0}, Ll/dwz;-><init>(Ll/yxz;Ll/jl80;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ll/ewz;

    .line 59
    .line 60
    invoke-direct {p0, p1, v0}, Ll/ewz;-><init>(Ll/y20;Ll/jl80;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ll/jl80;->show()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;ZLcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 7
    .line 8
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->C(Z)V

    .line 9
    .line 10
    .line 11
    if-eqz p3, :cond_1

    .line 12
    .line 13
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object p2, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->G(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n()V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object p1, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 29
    .line 30
    xor-int/lit8 p2, p5, 0x1

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->D(Z)V

    .line 33
    .line 34
    .line 35
    if-nez p5, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, "e_chat_gift_view_thanks"

    .line 46
    .line 47
    invoke-static {p2, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 51
    .line 52
    new-instance p2, Ll/zwz;

    .line 53
    .line 54
    invoke-direct {p2, p0, p6}, Ll/zwz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->setThxTipClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public n5()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hxy;->m()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 20
    .line 21
    iget-object v0, v0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 30
    .line 31
    iget-object v0, v0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/hxy;->G()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-lez v0, :cond_2

    .line 56
    .line 57
    :cond_1
    return-void

    .line 58
    :cond_2
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p0, v1, v0}, Ll/yxz;->g5(IZ)Z

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic o4(Ll/sv4;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

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
    iget-object p0, p0, Ll/yxz;->X1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    int-to-float p2, p2

    .line 16
    iget p1, p1, Ll/sv4;->m:F

    .line 17
    .line 18
    mul-float/2addr p2, p1

    .line 19
    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public o5()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast v0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_8

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 12
    .line 13
    const-string v2, "dismissed"

    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_8

    .line 20
    .line 21
    iget-object v1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->D2()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_0
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 32
    .line 33
    check-cast v1, Ll/tvz;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Ll/mzl;->B0()Ll/u1z;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ll/j3z;->g0()Ll/iam;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ll/d3z;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->MORE:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_8

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-static {v0, v3}, Ll/uxy;->f(Ljava/lang/String;Z)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    goto/16 :goto_1

    .line 75
    .line 76
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->A1:Ll/jxd0;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    goto/16 :goto_1

    .line 95
    .line 96
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->u1:Ll/vxd0;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const/4 v4, 0x3

    .line 113
    if-lt v0, v4, :cond_4

    .line 114
    .line 115
    goto/16 :goto_1

    .line 116
    .line 117
    :cond_4
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 120
    .line 121
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/g;->t1:Ll/byd0;

    .line 122
    .line 123
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    check-cast v4, Ljava/lang/Long;

    .line 128
    .line 129
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 130
    .line 131
    .line 132
    move-result-wide v4

    .line 133
    invoke-static {}, Ll/pzi0;->o()J

    .line 134
    .line 135
    .line 136
    move-result-wide v6

    .line 137
    sub-long/2addr v6, v4

    .line 138
    const-wide/32 v4, 0x5265c00

    .line 139
    .line 140
    .line 141
    cmp-long v4, v6, v4

    .line 142
    .line 143
    if-gez v4, :cond_5

    .line 144
    .line 145
    goto/16 :goto_1

    .line 146
    .line 147
    :cond_5
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    const-string v5, "switchPicBubbleKey"

    .line 152
    .line 153
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-nez v4, :cond_8

    .line 158
    .line 159
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v4}, Ll/cl80;->k()Z

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-eqz v4, :cond_6

    .line 168
    .line 169
    goto/16 :goto_1

    .line 170
    .line 171
    :cond_6
    const/4 v4, 0x1

    .line 172
    add-int/2addr v0, v4

    .line 173
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->b(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 178
    .line 179
    iget-object v6, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 180
    .line 181
    invoke-direct {v2, v6}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 182
    .line 183
    .line 184
    const-string v6, "\u7167\u7247\u65b0\u73a9\u6cd5\u9650\u65f6\u5f00\u542f\uff01"

    .line 185
    .line 186
    invoke-virtual {v2, v6}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    iget-object v6, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 191
    .line 192
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 193
    .line 194
    .line 195
    move-result-object v7

    .line 196
    invoke-virtual {v7}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 201
    .line 202
    .line 203
    move-result v7

    .line 204
    if-eqz v7, :cond_7

    .line 205
    .line 206
    sget v7, Ll/g9c0;->j:I

    .line 207
    .line 208
    goto :goto_0

    .line 209
    :cond_7
    sget v7, Ll/g9c0;->x:I

    .line 210
    .line 211
    :goto_0
    invoke-static {v6, v7}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 212
    .line 213
    .line 214
    move-result v6

    .line 215
    filled-new-array {v6}, [I

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    invoke-virtual {v2, v6}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    sget v6, Ll/g9c0;->q:I

    .line 224
    .line 225
    invoke-virtual {v2, v6}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    const/high16 v4, 0x41500000    # 13.0f

    .line 234
    .line 235
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    sget v4, Ll/qa00;->h:I

    .line 240
    .line 241
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    new-instance v4, Ll/iwz;

    .line 250
    .line 251
    invoke-direct {v4, p0, v0}, Ll/iwz;-><init>(Ll/yxz;I)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    new-instance v0, Ll/jwz;

    .line 259
    .line 260
    invoke-direct {v0}, Ll/jwz;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->d(Lcom/p1/mobile/android/ui/bubble/a$b;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    sget v0, Ll/qa00;->g:I

    .line 272
    .line 273
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    sget v0, Ll/qa00;->k:I

    .line 278
    .line 279
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    const-wide/16 v2, 0x1f40

    .line 284
    .line 285
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    sget v0, Ll/zvk;->D:I

    .line 290
    .line 291
    sget v2, Ll/zvk;->E:I

    .line 292
    .line 293
    or-int/2addr v0, v2

    .line 294
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0, p0, v1, v5}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    :cond_8
    :goto_1
    return-void
.end method

.method public final synthetic p4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/qzz;->E0:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget v1, Ll/qa00;->q:I

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object p0, p0, Ll/qzz;->E0:Lv/VDraweeView;

    .line 35
    .line 36
    sget v0, Ll/ibc0;->h:I

    .line 37
    .line 38
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public p5(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/yxz;->N1:Z

    .line 3
    .line 4
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-direct {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->y6:I

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->z6:I

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :goto_0
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget v2, Ll/zvk;->A:I

    .line 45
    .line 46
    sget v3, Ll/zvk;->E:I

    .line 47
    .line 48
    or-int/2addr v2, v3

    .line 49
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const/high16 v2, 0x40000000    # 2.0f

    .line 54
    .line 55
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const/high16 v2, 0x40e00000    # 7.0f

    .line 64
    .line 65
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const/16 v2, 0x4b

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-wide/16 v2, 0xbb8

    .line 80
    .line 81
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance v0, Ll/txz;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ll/txz;-><init>(Ll/yxz;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const/high16 v0, 0x41000000    # 8.0f

    .line 99
    .line 100
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 112
    .line 113
    check-cast p0, Ll/tvz;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-interface {p0}, Ll/mzl;->F()Ll/ruy;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Ll/ruy;->o0()Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p1, v1, p0}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    const-string p0, "tooltips_type"

    .line 131
    .line 132
    const-string p1, "bubble"

    .line 133
    .line 134
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string p1, "tooltips_type_ui"

    .line 139
    .line 140
    const-string v0, "bubble_basic_double_edge"

    .line 141
    .line 142
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    const-string v0, "tooltips_trigger_page"

    .line 147
    .line 148
    const-string v1, "chat_page"

    .line 149
    .line 150
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v1, "tooltips_trigger_reason"

    .line 155
    .line 156
    const-string v2, "tips"

    .line 157
    .line 158
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    const-string v2, "tooltips_trigger_module"

    .line 163
    .line 164
    const-string v3, "null"

    .line 165
    .line 166
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    filled-new-array {p0, p1, v0, v1, v2}, [Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    const-string p1, "e_bubble_chat_page_id_verification_tips"

    .line 175
    .line 176
    const-string v0, "p_chat_view"

    .line 177
    .line 178
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public final synthetic q4(Ljava/util/List;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/k05;->k()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    const-string v1, "e_newmatch_next_batch"

    .line 25
    .line 26
    invoke-static {v1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Ll/k05;->p()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    check-cast p2, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 52
    .line 53
    check-cast v2, Ll/tvz;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/tvz;->r3()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "other_uid"

    .line 60
    .line 61
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 66
    .line 67
    check-cast v3, Ll/tvz;

    .line 68
    .line 69
    invoke-virtual {v3}, Ll/clz;->y3()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const-string v4, "newmatch_next_from"

    .line 74
    .line 75
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v4, "newmatch_next_number"

    .line 88
    .line 89
    invoke-static {v4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    filled-new-array {v2, v3, p1}, [Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const-string v2, "e_newmatch_next"

    .line 98
    .line 99
    invoke-static {v2, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 100
    .line 101
    .line 102
    move-object p1, p2

    .line 103
    :goto_0
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p2, p1}, Ll/k05;->q(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    const/16 v1, 0x1a

    .line 115
    .line 116
    invoke-static {p2, p1, v0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    const-string p2, "newmatch_next"

    .line 121
    .line 122
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u2(Landroid/content/Intent;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final q5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/yxz;->I3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 5
    .line 6
    check-cast v0, Ll/tvz;

    .line 7
    .line 8
    iget-object v0, v0, Ll/clz;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->q(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 18
    .line 19
    check-cast v0, Ll/tvz;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "heat_reduce_function_name"

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->key:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "e_heat_reduce_remind"

    .line 38
    .line 39
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->message:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    if-ne p1, v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/yxz;->M3(Landroid/content/Context;Ljava/lang/String;)Ll/oze$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_4

    .line 65
    .line 66
    iget-object v2, p0, Ll/qzz;->e:Lv/VDraweeView;

    .line 67
    .line 68
    iget v0, v0, Ll/oze$a;->d:I

    .line 69
    .line 70
    invoke-virtual {v2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->photo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 75
    .line 76
    if-ne p1, v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Ll/qzz;->e:Lv/VDraweeView;

    .line 79
    .line 80
    sget v2, Ll/ibc0;->W6:I

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->chuEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 87
    .line 88
    if-eq p1, v0, :cond_3

    .line 89
    .line 90
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->friendEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 91
    .line 92
    if-ne p1, v0, :cond_4

    .line 93
    .line 94
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 97
    .line 98
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/z;->r3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_4

    .line 109
    .line 110
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 111
    .line 112
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-nez v2, :cond_4

    .line 117
    .line 118
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 119
    .line 120
    iget-object v3, p0, Ll/qzz;->e:Lv/VDraweeView;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v2, v3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 136
    .line 137
    check-cast v0, Ll/tvz;

    .line 138
    .line 139
    invoke-virtual {v0}, Ll/clz;->m3()D

    .line 140
    .line 141
    .line 142
    move-result-wide v2

    .line 143
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 144
    .line 145
    check-cast v0, Ll/tvz;

    .line 146
    .line 147
    invoke-virtual {v0}, Ll/clz;->k3()D

    .line 148
    .line 149
    .line 150
    move-result-wide v4

    .line 151
    sub-double/2addr v2, v4

    .line 152
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->b(D)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v2, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    const-string v3, "\u6e29\u5ea6\u4e0b\u964d\u4e86%s\u00b0C"

    .line 162
    .line 163
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v0, "\n"

    .line 175
    .line 176
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->title:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    iget-object v2, p0, Ll/qzz;->c:Landroid/widget/TextView;

    .line 189
    .line 190
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/qzz;->f:Landroid/widget/TextView;

    .line 194
    .line 195
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->content:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/qzz;->d:Landroid/widget/FrameLayout;

    .line 201
    .line 202
    new-instance v2, Ll/ixz;

    .line 203
    .line 204
    invoke-direct {v2, p0, p1}, Ll/ixz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;)V

    .line 205
    .line 206
    .line 207
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 208
    .line 209
    .line 210
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 211
    .line 212
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 213
    .line 214
    .line 215
    new-instance v0, Ljava/util/ArrayList;

    .line 216
    .line 217
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .line 219
    .line 220
    iget-object v2, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 221
    .line 222
    const/4 v3, 0x2

    .line 223
    new-array v4, v3, [F

    .line 224
    .line 225
    fill-array-data v4, :array_0

    .line 226
    .line 227
    .line 228
    const-string v5, "alpha"

    .line 229
    .line 230
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    iget-object v2, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 238
    .line 239
    const/high16 v4, 0x40e00000    # 7.0f

    .line 240
    .line 241
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    int-to-float v4, v4

    .line 246
    new-array v3, v3, [F

    .line 247
    .line 248
    aput v4, v3, v1

    .line 249
    .line 250
    const/4 v1, 0x0

    .line 251
    const/4 v4, 0x1

    .line 252
    aput v1, v3, v4

    .line 253
    .line 254
    const-string v1, "translationY"

    .line 255
    .line 256
    invoke-static {v2, v1, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 264
    .line 265
    .line 266
    new-instance v0, Ll/yxz$k;

    .line 267
    .line 268
    invoke-direct {v0, p0}, Ll/yxz$k;-><init>(Ll/yxz;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 272
    .line 273
    .line 274
    const-wide/16 v0, 0x1e3

    .line 275
    .line 276
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 277
    .line 278
    .line 279
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 280
    .line 281
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 288
    .line 289
    .line 290
    iget-object p1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 291
    .line 292
    new-instance v0, Ll/jxz;

    .line 293
    .line 294
    invoke-direct {v0, p0}, Ll/jxz;-><init>(Ll/yxz;)V

    .line 295
    .line 296
    .line 297
    const-wide/16 v1, 0x2ee

    .line 298
    .line 299
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 300
    .line 301
    .line 302
    iget-object p1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 303
    .line 304
    new-instance v0, Ll/kxz;

    .line 305
    .line 306
    invoke-direct {v0, p0}, Ll/kxz;-><init>(Ll/yxz;)V

    .line 307
    .line 308
    .line 309
    const-wide/16 v1, 0x1388

    .line 310
    .line 311
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 312
    .line 313
    .line 314
    iget-object p1, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 315
    .line 316
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->x()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    invoke-virtual {p1, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    const/4 v0, 0x5

    .line 333
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    iget-object p0, p0, Ll/qzz;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 338
    .line 339
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/qzz;->r()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/r97;->V0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/yxz;->T3()V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/yxz;->P3()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/yxz;->U3()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic r4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qzz;->p0:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r5()V
    .locals 3

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
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 18
    .line 19
    iget-object v0, v0, Ll/xab;->S:Ll/jxd0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/yxz;->f2:Ljava/lang/Runnable;

    .line 34
    .line 35
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object p0, p0, Ll/yxz;->f2:Ljava/lang/Runnable;

    .line 43
    .line 44
    const-wide/16 v1, 0x1f4

    .line 45
    .line 46
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic s4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast p0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final s5()V
    .locals 6

    .line 1
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tye;->b()Lcom/p1/mobile/putong/core/data/EmojiAnimData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->emojiAnimCreatedTime:Ljava/util/Map;

    .line 10
    .line 11
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 12
    .line 13
    check-cast v2, Ll/tvz;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/clz;->i3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->emojiAnimCreatedTime:Ljava/util/Map;

    .line 26
    .line 27
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 28
    .line 29
    check-cast v2, Ll/tvz;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/clz;->i3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/lang/Double;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 46
    .line 47
    add-double/2addr v1, v3

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-wide/16 v1, 0x0

    .line 50
    .line 51
    :goto_0
    iget-object v3, p0, Ll/qzz;->p1:Ll/clz;

    .line 52
    .line 53
    check-cast v3, Ll/tvz;

    .line 54
    .line 55
    invoke-virtual {v3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    sget-object v4, Ll/uxj0;->a:Ll/uxj0;

    .line 60
    .line 61
    invoke-static {v4}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-virtual {v4, v5}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    new-instance v5, Ll/swz;

    .line 74
    .line 75
    invoke-direct {v5, p0, v1, v2}, Ll/swz;-><init>(Ll/yxz;D)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4, v5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v3, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v2, Ll/twz;

    .line 95
    .line 96
    invoke-direct {v2, p0, v0}, Ll/twz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/data/EmojiAnimData;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic t4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 2
    .line 3
    new-instance v1, Ll/rwz;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/rwz;-><init>(Ll/yxz;)V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {v0, v2, v1}, Ll/hxy;->y(ZLjava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "shortcut_type"

    .line 19
    .line 20
    const-string v1, "emoji_picture"

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "e_close_click"

    .line 31
    .line 32
    invoke-static {v1, p0, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public t5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yxz;->Z3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic u4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast p0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 3

    .line 1
    const-string v0, "\u964d\u6e29\u52a8\u753b"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 9
    .line 10
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 11
    .line 12
    if-le v0, v1, :cond_2

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->five:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 15
    .line 16
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 17
    .line 18
    if-lt v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->first:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 22
    .line 23
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 24
    .line 25
    iget-object v2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    if-le v0, v1, :cond_1

    .line 28
    .line 29
    new-instance v0, Ll/cxz;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/cxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v2, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    new-instance v0, Ll/dxz;

    .line 39
    .line 40
    invoke-direct {v0, p0, p1}, Ll/dxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v2, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 48
    .line 49
    check-cast p0, Ll/tvz;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    iput-boolean p1, p0, Ll/tvz;->P0:Z

    .line 53
    .line 54
    return-void
.end method

.method public final synthetic v4()V
    .locals 2

    .line 1
    new-instance v0, Ll/ywz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ywz;-><init>(Ll/yxz;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p0, v1, v0}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final v5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 4

    .line 1
    const-string v0, "tempDownAnimInner"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 7
    .line 8
    const-wide/16 v1, 0x1

    .line 9
    .line 10
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/qxz;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/qxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Ll/rxz;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/rxz;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/yxz;->W1:Ll/kcg0;

    .line 39
    .line 40
    return-void
.end method

.method public final synthetic w4(Ljava/util/List;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/hxy;->B(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 9
    .line 10
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v2, Ll/qec0;->Q2:I

    .line 15
    .line 16
    iget-object v3, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;

    .line 24
    .line 25
    iget-object v2, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 35
    .line 36
    iget-object v4, p0, Ll/qzz;->p1:Ll/clz;

    .line 37
    .line 38
    check-cast v4, Ll/tvz;

    .line 39
    .line 40
    invoke-virtual {v4}, Ll/clz;->i3()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v3, v4, p1}, Lcom/p1/mobile/putong/core/api/g;->te(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v3, Ll/gwz;

    .line 49
    .line 50
    invoke-direct {v3, p0}, Ll/gwz;-><init>(Ll/yxz;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->h(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    new-instance p1, Ll/hwz;

    .line 57
    .line 58
    invoke-direct {p1}, Ll/hwz;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v1, p1}, Ll/qzz;->f2(ILjava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public w5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 2

    .line 1
    const-string v0, "\u5347\u6e29\u52a8\u753b"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    new-instance v1, Ll/exz;

    .line 13
    .line 14
    invoke-direct {v1, p0, p2, p1}, Ll/exz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/yxz;->x5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic x4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qzz;->r1:Ll/hxy;

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/hxy;->B(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 9
    .line 10
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v2, Ll/qec0;->Y4:I

    .line 15
    .line 16
    iget-object v3, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;

    .line 24
    .line 25
    iget-object v2, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->a0(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/yxz;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/pwz;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/pwz;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1, v2}, Ll/qzz;->f2(ILjava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    sget v1, Ll/qa00;->m:I

    .line 44
    .line 45
    iget-object p0, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    sub-int/2addr v1, p0

    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final x5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/gxz;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2}, Ll/gxz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/hxz;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/hxz;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/yxz;->V1:Ll/kcg0;

    .line 34
    .line 35
    return-void
.end method

.method public final synthetic y4(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p2, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->r7(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "user_risk_type"

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "e_chat_safety_notice"

    .line 27
    .line 28
    const-string p2, "p_chat_view"

    .line 29
    .line 30
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public y5(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yxz;->P1:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->x(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic z4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 2
    .line 3
    check-cast p0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z5(I)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    filled-new-array {p1, v2}, [I

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/qzz;->k:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/qzz;->g1:Lv/navigationbar/VNavigationBar;

    .line 24
    .line 25
    iget-object p0, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v0, Ll/g9c0;->Y:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
