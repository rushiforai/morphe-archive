.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct$b;,
        Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct$a;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;",
            ">;"
        }
    .end annotation
.end field

.field public e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->h2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;ZLjava/lang/String;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->i2(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;ZLjava/lang/String;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->k2(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public static bridge synthetic a2(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->d:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic b2(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    return-void
.end method

.method public static d2(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "loop_create_tag_info"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "loop_is_oversea"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private synthetic h2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->g2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct$b;->a(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public e2()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final g2()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "loop_is_oversea"

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
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v3, "loop_create_tag_info"

    .line 17
    .line 18
    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 23
    .line 24
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v4, Ll/xsa0;

    .line 28
    .line 29
    invoke-direct {v4, p0, v3, v0, v1}, Ll/xsa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->a5(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->d:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->d:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 48
    .line 49
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/ysa0;

    .line 53
    .line 54
    invoke-direct {v1, p0, v0}, Ll/ysa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->a5(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->d:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct$a;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;Landroidx/fragment/app/FragmentManager;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;->setIsCanScroll(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 85
    .line 86
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e:I

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final synthetic i2(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;ZLjava/lang/String;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    invoke-virtual {p1, p6}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->U4(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->k()Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-eqz p4, :cond_0

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e:I

    .line 13
    .line 14
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 15
    .line 16
    invoke-virtual {p3, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->d:Ljava/util/List;

    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e:I

    .line 22
    .line 23
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->Z4(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    new-instance p4, Landroid/content/Intent;

    .line 38
    .line 39
    invoke-direct {p4}, Landroid/content/Intent;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/xra;->g()Z

    .line 43
    .line 44
    .line 45
    move-result p5

    .line 46
    if-eqz p5, :cond_2

    .line 47
    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string p5, "\u4e2d\u56fd\u00b7"

    .line 58
    .line 59
    invoke-direct {p2, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p3, "\u00b7"

    .line 66
    .line 67
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :goto_0
    const-string p2, "loop_result_key"

    .line 87
    .line 88
    invoke-virtual {p4, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const/4 p2, -0x1

    .line 96
    invoke-virtual {p1, p2, p4}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wsa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wsa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic k2(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    new-instance p2, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p3, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->V4()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p5

    .line 15
    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p5, "\u00b7"

    .line 19
    .line 20
    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->U4(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p3, "loop_result_key"

    .line 39
    .line 40
    invoke-virtual {p2, p3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 p3, -0x1

    .line 48
    invoke-virtual {p1, p3, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->c:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
