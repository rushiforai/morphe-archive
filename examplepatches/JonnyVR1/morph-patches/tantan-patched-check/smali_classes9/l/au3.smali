.class public Ll/au3;
.super Ll/tz0;
.source "SourceFile"


# instance fields
.field public A:Ljava/lang/String;

.field public y:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;"
        }
    .end annotation
.end field

.field public z:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Ll/tz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p0, v0, Ll/au3;->y:Ljava/util/List;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic A4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->hasDownloaded:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic B4(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic C4(Ll/au3;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/au3;->N4(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D4(Ll/au3;Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/au3;->Q4(Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E4(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->hasDownloaded:Z

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

.method private synthetic L4(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/au3;->V4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->type:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic p4(Ll/au3;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/au3;->L4(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V

    return-void
.end method

.method public static synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "magicGesture"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "magic_gesture error:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const-string p0, "no message"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "magic_gesture"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic s4(Ll/au3;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/au3;->P4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    return-void
.end method

.method public static synthetic t4(Ll/au3;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/au3;->R4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Z)V

    return-void
.end method

.method public static synthetic u4(Ll/au3;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/au3;->O4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v4(Ll/au3;Lcom/p1/mobile/putong/live/base/data/BLiveMagic;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/au3;->M4(Lcom/p1/mobile/putong/live/base/data/BLiveMagic;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->productID:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->productID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->productID:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->productID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic y4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->typeName:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->typeName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic z4(Lcom/p1/mobile/putong/live/base/data/BLiveMagic;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMagic;->liveMagicLists:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method


# virtual methods
.method public final G4(Ljava/util/List;)Z
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 18
    .line 19
    new-instance v0, Ll/ot3;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/ot3;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final H4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->J3:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/au3;->A:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p0, Ll/au3;->y:Ljava/util/List;

    .line 21
    .line 22
    new-instance v3, Ll/kt3;

    .line 23
    .line 24
    invoke-direct {v3, p0}, Ll/kt3;-><init>(Ll/au3;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->R(Ljava/lang/String;Ljava/util/List;Ll/z20;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/c0s;

    .line 31
    .line 32
    invoke-direct {v1, p0, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Ll/lt3;

    .line 36
    .line 37
    invoke-direct {p0}, Ll/lt3;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->c:Landroid/view/View;

    .line 44
    .line 45
    new-instance v0, Ll/mt3;

    .line 46
    .line 47
    invoke-direct {v0, v1}, Ll/mt3;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    return-object v1
.end method

.method public final I4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V
    .locals 4

    .line 1
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jfv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jfv;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->type:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "4"

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    new-instance v0, Ll/k210;

    .line 27
    .line 28
    const/16 v1, 0x320

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/uzl;

    .line 38
    .line 39
    const/16 v2, 0x3ea

    .line 40
    .line 41
    invoke-interface {v0, v2}, Ll/uzl;->G(I)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/xxh0;->a()Ll/xxh0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->modelPath:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v3, p1}, Ll/xxh0;->b(Landroid/content/Context;Ljava/lang/String;)Ll/wxh0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    new-instance v0, Ll/k210;

    .line 61
    .line 62
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Ll/uzl;

    .line 70
    .line 71
    invoke-interface {p0, v2, p1}, Ll/uzl;->B(ILl/wxh0;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    return-void

    .line 75
    :cond_2
    new-instance v0, Ll/k210;

    .line 76
    .line 77
    const/16 v1, 0x9c4

    .line 78
    .line 79
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    check-cast p0, Ll/uzl;

    .line 87
    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->typeName:Ljava/lang/String;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->modelPath:Ljava/lang/String;

    .line 91
    .line 92
    invoke-interface {p0, v0, p1}, Ll/uzl;->t0(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final J4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jfv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jfv;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->type:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "4"

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    new-instance p1, Ll/k210;

    .line 27
    .line 28
    const/16 v0, 0x320

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ll/k210;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ll/uzl;

    .line 38
    .line 39
    const/16 p1, 0x3ea

    .line 40
    .line 41
    invoke-interface {p0, p1}, Ll/uzl;->G(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    new-instance v0, Ll/k210;

    .line 46
    .line 47
    const/16 v1, 0x9c4

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ll/uzl;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->typeName:Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {p0, p1}, Ll/uzl;->D0(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final K4(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nt3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nt3;-><init>(Ll/au3;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final synthetic M4(Lcom/p1/mobile/putong/live/base/data/BLiveMagic;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagic;->title:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/au3;->A:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagic;->liveMagicLists:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/au3;->S4(Ljava/util/List;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lrx/c;->never()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic N4(Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/au3;->K4(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/au3;->y:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "liveMagicLists size:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/au3;->y:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "magic_gesture"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/zrw;->l(Ljava/util/List;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic O4(Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->j()Ll/c3t;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/mof0;->k()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Ll/yt3;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/yt3;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/zt3;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/zt3;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ll/it3;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/it3;-><init>(Ll/au3;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/jt3;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/jt3;-><init>(Ll/au3;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final synthetic P4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/au3;->y:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/wt3;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/wt3;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/xt3;

    .line 20
    .line 21
    invoke-direct {v1, p1}, Ll/xt3;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->copyOther(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/au3;->U4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/au3;->y:Ljava/util/List;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/au3;->G4(Ljava/util/List;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v1, "checkMagicList:"

    .line 47
    .line 48
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "magic_gesture"

    .line 59
    .line 60
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/au3;->W4(Z)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/au3;->y:Ljava/util/List;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/au3;->T4(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic Q4(Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->filterLiveMode:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    xor-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final R4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Z)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/au3;->I4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->notice:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Ll/au3;->J4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 13
    .line 14
    .line 15
    :goto_0
    new-instance p1, Ljava/util/HashSet;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/au3;->y:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_3

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;

    .line 37
    .line 38
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 63
    .line 64
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->isSelected:Z

    .line 65
    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->type:Ljava/lang/String;

    .line 69
    .line 70
    const-string v2, "4"

    .line 71
    .line 72
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_2

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->productID:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 85
    .line 86
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Ll/ifv;

    .line 91
    .line 92
    iget-object p0, p0, Ll/ifv;->a:Ll/xyd0;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final S4(Ljava/util/List;)Ljava/util/List;
    .locals 8
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/au3;->y:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-eqz v3, :cond_5

    .line 21
    .line 22
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;

    .line 27
    .line 28
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    if-eqz v0, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget-object v4, p0, Ll/au3;->y:Ljava/util/List;

    .line 44
    .line 45
    new-instance v5, Ll/pt3;

    .line 46
    .line 47
    invoke-direct {v5, v3}, Ll/pt3;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v4, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;

    .line 55
    .line 56
    if-nez v4, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    :cond_4
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_0

    .line 70
    .line 71
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 76
    .line 77
    iget-object v6, v4, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 78
    .line 79
    new-instance v7, Ll/qt3;

    .line 80
    .line 81
    invoke-direct {v7, v5}, Ll/qt3;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v6, v7}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 89
    .line 90
    if-eqz v6, :cond_4

    .line 91
    .line 92
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->copyOther(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_5
    invoke-interface {p1, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 97
    .line 98
    .line 99
    return-object p1
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/kf2;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/ht3;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/ht3;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/rt3;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/rt3;-><init>(Ll/au3;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/k210;

    .line 46
    .line 47
    const/16 v1, 0x9c4

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ll/uzl;

    .line 57
    .line 58
    invoke-interface {v0}, Ll/uzl;->v()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/st3;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/st3;-><init>(Ll/au3;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/tt3;

    .line 81
    .line 82
    invoke-direct {v1}, Ll/tt3;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/ut3;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/ut3;-><init>(Ll/au3;)V

    .line 92
    .line 93
    .line 94
    new-instance p0, Ll/vt3;

    .line 95
    .line 96
    invoke-direct {p0}, Ll/vt3;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/zrv;->j()Ll/c3t;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public T4(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    iget-object v0, p0, Ll/au3;->z:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/au3;->A:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v2, Ll/kt3;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/kt3;-><init>(Ll/au3;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->R(Ljava/lang/String;Ljava/util/List;Ll/z20;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public final U4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ifv;

    .line 8
    .line 9
    iget-object v0, v0, Ll/ifv;->a:Ll/xyd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/util/Set;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->productID:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->isSelected:Z

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/au3;->I4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public V3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/e80;->V3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "magicGesture"

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public V4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/au3;->z:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/au3;->H4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/au3;->z:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/au3;->z:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public W4(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e80;->b4(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "magicGesture"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
