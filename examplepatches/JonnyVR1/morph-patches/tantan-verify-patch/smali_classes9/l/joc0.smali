.class public final Ll/joc0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\u0007\u001a\u00020\u00062\n\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J1\u0010\u000e\u001a\u00020\r2\n\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\u00042\u0006\u0010\n\u001a\u00020\t2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\t0\u000bH\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ9\u0010\u0012\u001a\u00020\r2\n\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\u00042\u0006\u0010\n\u001a\u00020\t2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\t0\u000b2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/joc0;",
        "",
        "<init>",
        "()V",
        "Ll/bjs;",
        "presenter",
        "",
        "e",
        "(Ll/bjs;)Z",
        "Ll/uoe0;",
        "requestInfo",
        "Ll/y20;",
        "action",
        "",
        "d",
        "(Ll/bjs;Ll/uoe0;Ll/y20;)V",
        "",
        "receiveUserCount",
        "f",
        "(Ll/bjs;Ll/uoe0;Ll/y20;I)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/joc0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/joc0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/joc0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/joc0;->INSTANCE:Ll/joc0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    sget-object p0, Ll/eoc0;->INSTANCE:Ll/eoc0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eoc0;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Ll/y20;Ll/uoe0;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p3, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p3}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Ll/civ;

    .line 8
    .line 9
    invoke-virtual {p3}, Ll/civ;->f()V

    .line 10
    .line 11
    .line 12
    sget-object p3, Ll/eoc0;->INSTANCE:Ll/eoc0;

    .line 13
    .line 14
    invoke-virtual {p3}, Ll/eoc0;->c()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static final d(Ll/bjs;Ll/uoe0;Ll/y20;)V
    .locals 3
    .param p0    # Ll/bjs;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ll/uoe0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;",
            "Ll/uoe0;",
            "Ll/y20<",
            "Ll/uoe0;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/p6s;->I0()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    :cond_0
    new-instance v0, Ll/vme0;

    .line 41
    .line 42
    const/16 v1, 0x2bc

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ll/vme0;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    check-cast v0, Ljava/util/List;

    .line 55
    .line 56
    move-object v1, v0

    .line 57
    check-cast v1, Ljava/util/Collection;

    .line 58
    .line 59
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ll/uoe0;->q(Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    sget-object v1, Ll/htd0;->f:Ll/htd0;

    .line 69
    .line 70
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ll/civ;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/civ;->g()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    const/4 v2, 0x2

    .line 87
    if-lt v1, v2, :cond_1

    .line 88
    .line 89
    sget-object v1, Ll/eoc0;->INSTANCE:Ll/eoc0;

    .line 90
    .line 91
    invoke-virtual {v1}, Ll/eoc0;->b()V

    .line 92
    .line 93
    .line 94
    sget-object v1, Ll/joc0;->INSTANCE:Ll/joc0;

    .line 95
    .line 96
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {v1, p0, p1, p2, v0}, Ll/joc0;->f(Ll/bjs;Ll/uoe0;Ll/y20;I)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_1
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    return-void

    .line 108
    :cond_3
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public static final e(Ll/bjs;)Z
    .locals 2
    .param p0    # Ll/bjs;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;)Z"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/p6s;->I0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/bjs;->H4()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "voiceLiveAudience"

    .line 63
    .line 64
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    new-instance v0, Ll/vme0;

    .line 71
    .line 72
    const/16 v1, 0x2bc

    .line 73
    .line 74
    invoke-direct {v0, v1}, Ll/vme0;-><init>(I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    .line 83
    .line 84
    check-cast p0, Ljava/util/List;

    .line 85
    .line 86
    check-cast p0, Ljava/util/Collection;

    .line 87
    .line 88
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_1

    .line 93
    .line 94
    const/4 p0, 0x1

    .line 95
    return p0

    .line 96
    :cond_1
    const/4 p0, 0x0

    .line 97
    return p0
.end method


# virtual methods
.method public final f(Ll/bjs;Ll/uoe0;Ll/y20;I)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;",
            "Ll/uoe0;",
            "Ll/y20<",
            "Ll/uoe0;",
            ">;I)V"
        }
    .end annotation

    .line 1
    move-object/from16 p0, p2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/yec0;->v1:I

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    sget v2, Ll/mdc0;->z0:I

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Landroid/widget/Button;

    .line 38
    .line 39
    sget v3, Ll/mdc0;->f0:I

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Landroid/widget/TextView;

    .line 46
    .line 47
    sget v4, Ll/mdc0;->d2:I

    .line 48
    .line 49
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lv/VDraweeView;

    .line 54
    .line 55
    sget v5, Ll/mdc0;->l2:I

    .line 56
    .line 57
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    check-cast v5, Landroid/widget/TextView;

    .line 62
    .line 63
    sget v6, Ll/mdc0;->n2:I

    .line 64
    .line 65
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    check-cast v6, Landroid/widget/TextView;

    .line 70
    .line 71
    sget v7, Ll/mdc0;->m6:I

    .line 72
    .line 73
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    check-cast v7, Landroid/widget/TextView;

    .line 78
    .line 79
    sget v8, Ll/mdc0;->n6:I

    .line 80
    .line 81
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    check-cast v8, Landroid/widget/TextView;

    .line 86
    .line 87
    sget-object v9, Ll/htd0;->c:Ll/htd0;

    .line 88
    .line 89
    invoke-static {v9}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v9

    .line 93
    check-cast v9, Ll/hiv;

    .line 94
    .line 95
    iget-object v10, p0, Ll/uoe0;->d:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v9, v10}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    iget-object v10, v9, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 102
    .line 103
    const/high16 v11, 0x42980000    # 76.0f

    .line 104
    .line 105
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v11

    .line 113
    const-string v13, "context_livingAct"

    .line 114
    .line 115
    invoke-static {v13, v4, v10, v12, v11}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v9}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    invoke-static {}, Ll/u8n;->a()Z

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    if-eqz v4, :cond_1

    .line 130
    .line 131
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->re:I

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_1
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->me:I

    .line 135
    .line 136
    :goto_0
    invoke-virtual {v9}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 137
    .line 138
    .line 139
    move-result-wide v10

    .line 140
    long-to-double v10, v10

    .line 141
    invoke-static {v10, v11}, Ll/a9g0;->d(D)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-static {v4, v5}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    invoke-static {}, Ll/u8n;->a()Z

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    if-eqz v4, :cond_2

    .line 157
    .line 158
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->K:I

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->J:I

    .line 162
    .line 163
    :goto_1
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-static {v4, v5}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    iget v4, p0, Ll/uoe0;->f:I

    .line 175
    .line 176
    mul-int v4, v4, p4

    .line 177
    .line 178
    int-to-long v4, v4

    .line 179
    invoke-virtual {v9}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 180
    .line 181
    .line 182
    move-result-wide v6

    .line 183
    mul-long/2addr v4, v6

    .line 184
    invoke-static {}, Ll/u8n;->a()Z

    .line 185
    .line 186
    .line 187
    move-result v6

    .line 188
    if-eqz v6, :cond_3

    .line 189
    .line 190
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->L:I

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_3
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->M:I

    .line 194
    .line 195
    :goto_2
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    invoke-static {v6, v4}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    new-instance v1, Ll/goc0;

    .line 215
    .line 216
    invoke-direct {v1}, Ll/goc0;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v0, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    new-instance v1, Ll/hoc0;

    .line 228
    .line 229
    move-object/from16 v4, p3

    .line 230
    .line 231
    invoke-direct {v1, v4, p0, v0}, Ll/hoc0;-><init>(Ll/y20;Ll/uoe0;Ll/jl80;)V

    .line 232
    .line 233
    .line 234
    invoke-static {v2, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 235
    .line 236
    .line 237
    new-instance p0, Ll/ioc0;

    .line 238
    .line 239
    invoke-direct {p0, v0}, Ll/ioc0;-><init>(Ll/jl80;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v3, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 243
    .line 244
    .line 245
    :cond_4
    :goto_3
    return-void
.end method
