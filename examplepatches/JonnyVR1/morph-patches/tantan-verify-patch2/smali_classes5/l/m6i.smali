.class public Ll/m6i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "bubble_feed_tab_guide"

.field public static b:I = 0x18

.field public static c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/PopGuide;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Z

.field public static e:Ljava/lang/String;

.field public static f:I

.field public static g:Z

.field public static h:Z

.field public static i:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/m6i;->c:Lrx/subjects/a;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput-boolean v0, Ll/m6i;->d:Z

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    sput-object v1, Ll/m6i;->e:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    sput v1, Ll/m6i;->f:I

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    sput-boolean v1, Ll/m6i;->g:Z

    .line 19
    .line 20
    sput-boolean v0, Ll/m6i;->h:Z

    .line 21
    .line 22
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

.method public static a(J)V
    .locals 7

    .line 1
    new-instance v0, Lcom/google/gson/Gson;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

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
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object v2, v2, Ll/dkb;->S2:Ll/wyd0;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    new-instance v1, Ll/m6i$a;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/m6i$a;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/util/List;

    .line 43
    .line 44
    :cond_0
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    add-int/lit8 v2, v2, -0x1

    .line 59
    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Ljava/lang/Long;

    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 67
    .line 68
    .line 69
    move-result-wide v2

    .line 70
    new-instance v4, Ll/m6i$b;

    .line 71
    .line 72
    invoke-direct {v4, v2, v3}, Ll/m6i$b;-><init>(J)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v4}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 76
    .line 77
    .line 78
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-static {}, Ll/gra;->X()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-lt v2, v3, :cond_1

    .line 87
    .line 88
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 91
    .line 92
    iget-object v2, v2, Ll/dkb;->T2:Ll/byd0;

    .line 93
    .line 94
    invoke-static {}, Ll/gra;->Y()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    int-to-long v3, v3

    .line 99
    const-wide/32 v5, 0x36ee80

    .line 100
    .line 101
    .line 102
    mul-long/2addr v3, v5

    .line 103
    add-long/2addr p0, v3

    .line 104
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {v2, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    :cond_1
    invoke-virtual {v0, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 118
    .line 119
    iget-object p1, p1, Ll/dkb;->S2:Ll/wyd0;

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public static b()Z
    .locals 9

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v2, v2, Ll/dkb;->U2:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x1

    .line 25
    if-lez v0, :cond_0

    .line 26
    .line 27
    move v0, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v0, v1

    .line 30
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object v3, v3, Ll/dkb;->Q2:Ll/byd0;

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    invoke-static {v3, v4}, Ll/pzi0;->D(J)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    iget-object v4, v4, Ll/dkb;->R2:Ll/byd0;

    .line 55
    .line 56
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Ljava/lang/Long;

    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    invoke-static {v4, v5}, Ll/yab;->Q(J)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    sget v5, Ll/m6i;->b:I

    .line 71
    .line 72
    if-le v4, v5, :cond_1

    .line 73
    .line 74
    move v4, v2

    .line 75
    goto :goto_1

    .line 76
    :cond_1
    move v4, v1

    .line 77
    :goto_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 78
    .line 79
    .line 80
    move-result-wide v5

    .line 81
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 84
    .line 85
    iget-object v7, v7, Ll/dkb;->T2:Ll/byd0;

    .line 86
    .line 87
    invoke-virtual {v7}, Ll/azd0;->get()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    check-cast v7, Ljava/lang/Long;

    .line 92
    .line 93
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 94
    .line 95
    .line 96
    move-result-wide v7

    .line 97
    cmp-long v5, v5, v7

    .line 98
    .line 99
    if-lez v5, :cond_2

    .line 100
    .line 101
    move v5, v2

    .line 102
    goto :goto_2

    .line 103
    :cond_2
    move v5, v1

    .line 104
    :goto_2
    if-eqz v0, :cond_3

    .line 105
    .line 106
    if-nez v3, :cond_3

    .line 107
    .line 108
    if-eqz v4, :cond_3

    .line 109
    .line 110
    if-eqz v5, :cond_3

    .line 111
    .line 112
    return v2

    .line 113
    :cond_3
    return v1
.end method

.method public static c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/m6i;->d:Z

    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    sput-object v0, Ll/m6i;->e:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    sput v0, Ll/m6i;->f:I

    .line 10
    .line 11
    return-void
.end method

.method public static d()V
    .locals 2

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/m6i;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object v0, Ll/m6i;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/dkb;->m7()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/m6i$c;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/m6i$c;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/m6i$d;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/m6i$d;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sput-object p0, Ll/m6i;->i:Ll/kcg0;

    .line 42
    .line 43
    return-void
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Landroid/view/View;Lcom/p1/mobile/putong/core/data/PopGuide;)V
    .locals 7

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    move-object v0, p0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->j6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_1
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/PopGuide;->userId:Ljava/lang/String;

    .line 27
    .line 28
    sput-object v0, Ll/m6i;->e:Ljava/lang/String;

    .line 29
    .line 30
    iget v0, p3, Lcom/p1/mobile/putong/core/data/PopGuide;->reason:I

    .line 31
    .line 32
    sput v0, Ll/m6i;->f:I

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget v1, Ll/kec0;->m3:I

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Ll/adc0;->Sd:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Landroid/widget/TextView;

    .line 53
    .line 54
    iget-object v2, p3, Lcom/p1/mobile/putong/core/data/PopGuide;->guide:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    sget v1, Ll/adc0;->N5:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lv/VDraweeView;

    .line 66
    .line 67
    iget-object v2, p3, Lcom/p1/mobile/putong/core/data/PopGuide;->icon:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    const/4 v4, 0x1

    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 84
    .line 85
    iget-object v5, p3, Lcom/p1/mobile/putong/core/data/PopGuide;->icon:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v2, v1, v5, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget-object v2, Ll/m6i;->a:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    new-instance v1, Ll/zvk;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v0}, Ll/zvk;->j(Landroid/view/View;)Ll/zvk;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const v2, -0x181e3

    .line 109
    .line 110
    .line 111
    filled-new-array {v2}, [I

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v0, v2}, Ll/zvk;->e([I)Ll/zvk;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const/16 v2, 0x4b

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Ll/zvk;->h(I)Ll/zvk;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const/16 v2, 0xd

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Ll/zvk;->t(I)Ll/zvk;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    const/high16 v2, 0x41000000    # 8.0f

    .line 132
    .line 133
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    neg-int v2, v2

    .line 138
    invoke-virtual {v0, v2}, Ll/zvk;->o(I)Ll/zvk;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-wide/16 v2, 0x1388

    .line 143
    .line 144
    invoke-virtual {v0, v2, v3}, Ll/zvk;->a(J)Ll/zvk;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const/high16 v2, 0x41200000    # 10.0f

    .line 149
    .line 150
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    invoke-virtual {v0, v3, v5, v6, v2}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    new-instance v2, Ll/m6i$f;

    .line 171
    .line 172
    invoke-direct {v2, p0}, Ll/m6i$f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0, v2}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    new-instance v0, Ll/m6i$e;

    .line 180
    .line 181
    invoke-direct {v0}, Ll/m6i$e;-><init>()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, v0}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    sget v0, Ll/qa00;->i:I

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Ll/zvk;->p(I)Ll/zvk;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    const/high16 v0, 0x40e00000    # 7.0f

    .line 195
    .line 196
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    invoke-virtual {p0, v0}, Ll/zvk;->f(I)Ll/zvk;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    sget v0, Ll/zvk;->D:I

    .line 205
    .line 206
    sget v2, Ll/zvk;->E:I

    .line 207
    .line 208
    or-int/2addr v0, v2

    .line 209
    invoke-virtual {p0, v0}, Ll/zvk;->i(I)Ll/zvk;

    .line 210
    .line 211
    .line 212
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-virtual {p0, v1, p2, p1}, Ll/fwk;->r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    sput-object p0, Ll/m6i;->a:Ljava/lang/String;

    .line 221
    .line 222
    sput-boolean v4, Ll/m6i;->d:Z

    .line 223
    .line 224
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 225
    .line 226
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 227
    .line 228
    iget-object p0, p0, Ll/dkb;->R2:Ll/byd0;

    .line 229
    .line 230
    invoke-static {}, Ll/pzi0;->o()J

    .line 231
    .line 232
    .line 233
    move-result-wide p1

    .line 234
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    invoke-static {}, Ll/pzi0;->o()J

    .line 242
    .line 243
    .line 244
    move-result-wide p0

    .line 245
    invoke-static {p0, p1}, Ll/m6i;->a(J)V

    .line 246
    .line 247
    .line 248
    const-string p0, "leadtocommunity_uid"

    .line 249
    .line 250
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/PopGuide;->userId:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    const-string p1, "leadtocommunity_reason"

    .line 257
    .line 258
    iget p2, p3, Lcom/p1/mobile/putong/core/data/PopGuide;->reason:I

    .line 259
    .line 260
    invoke-static {p1, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    const-string p1, "e_leadtocommunity"

    .line 269
    .line 270
    const-string p2, "p_suggest_users_home_view"

    .line 271
    .line 272
    invoke-static {p1, p2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 273
    .line 274
    .line 275
    :cond_3
    :goto_1
    return-void
.end method
