.class public Ll/ltp;
.super Ll/g4s;
.source "SourceFile"


# instance fields
.field public A:Landroid/view/View;

.field public x:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public y:Lv/VDraweeView;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ll/xup;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->H2:I

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
    invoke-direct {p0, p1, v0}, Ll/g4s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v0, Ll/mdc0;->e1:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/jtp;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/jtp;-><init>(Ll/ltp;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sget v0, Ll/mdc0;->E:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lv/VDraweeView;

    .line 55
    .line 56
    iput-object p1, p0, Ll/ltp;->y:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget v0, Ll/mdc0;->U3:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 69
    .line 70
    iput-object p1, p0, Ll/ltp;->x:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget v0, Ll/mdc0;->W3:I

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Landroid/widget/TextView;

    .line 83
    .line 84
    iput-object p1, p0, Ll/ltp;->z:Landroid/widget/TextView;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    sget v0, Ll/mdc0;->Q:I

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Ll/ltp;->A:Landroid/view/View;

    .line 97
    .line 98
    new-instance v0, Ll/ktp;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/ktp;-><init>(Ll/ltp;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static synthetic m0(Ll/ltp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ltp;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/ltp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ltp;->o0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public q0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ltp;->y:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sget v2, Ll/qa00;->G:I

    .line 8
    .line 9
    sub-int/2addr v1, v2

    .line 10
    const/high16 v2, 0x44110000    # 580.0f

    .line 11
    .line 12
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const-string v3, "context_livingAct"

    .line 17
    .line 18
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVER08yWTcyVkZFMkhLVkxFVDVLWU5FVlZWSEREVzE0IiwidyI6MTEyNSwiaCI6MTc0MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjgwODYyMTMxMzc0MDM1MzU0ODd9.png"

    .line 19
    .line 20
    invoke-static {v3, v0, v4, v1, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->memberNum:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    add-int/2addr v0, v1

    .line 27
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zg:I

    .line 32
    .line 33
    invoke-static {v2, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 38
    .line 39
    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 43
    .line 44
    .line 45
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    .line 46
    .line 47
    const-string v5, "#EC6CB7"

    .line 48
    .line 49
    invoke-static {v5}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    invoke-direct {v4, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/2addr v2, v0

    .line 69
    const/16 v0, 0x22

    .line 70
    .line 71
    invoke-virtual {v3, v4, v5, v2, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/ltp;->z:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ll/a3o0;

    .line 80
    .line 81
    const/4 v2, 0x0

    .line 82
    invoke-direct {v0, v2}, Ll/a3o0;-><init>(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, p1}, Ll/a3o0;->t(Ll/ner;)V

    .line 86
    .line 87
    .line 88
    new-instance p1, Lcom/p1/mobile/putong/data/UserMedal;

    .line 89
    .line 90
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/UserMedal;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v2, "light"

    .line 94
    .line 95
    iput-object v2, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 96
    .line 97
    iput v1, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 98
    .line 99
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalName:Ljava/lang/String;

    .line 100
    .line 101
    iput-object p2, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p0, p0, Ll/ltp;->x:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 104
    .line 105
    invoke-virtual {v0, p0, p1}, Ll/a3o0;->r(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method
