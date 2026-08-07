.class public Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;,
        Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;
    }
.end annotation


# instance fields
.field public A:Lv/navigationbar/VNavigationBar;

.field public B:Lv/VText;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Lv/VFrame;

.field public G:Lv/VList;

.field public H:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;",
            ">;"
        }
    .end annotation
.end field

.field public I:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;

.field public J:Ll/wyd0;

.field public z:Lv/VLinear;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->H:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ll/wyd0;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "previewStatus_"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, ""

    .line 36
    .line 37
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->J:Ll/wyd0;

    .line 41
    .line 42
    new-instance v0, Ll/l1l;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/l1l;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/m1l;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/m1l;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->V4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->U4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->X4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->W4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic Q4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->H:Ljava/util/ArrayList;

    return-object p0
.end method

.method private synthetic U4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic V4(Landroid/os/Bundle;)V
    .locals 9

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/core/R$string;->S6:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/core/R$string;->E7:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v2, 0x2

    .line 25
    invoke-direct {v1, p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 29
    .line 30
    sget p1, Lcom/p1/mobile/putong/core/R$string;->a7:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/4 v3, 0x3

    .line 37
    invoke-direct {v2, p0, v3, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance v3, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 41
    .line 42
    sget p1, Lcom/p1/mobile/putong/core/R$string;->U6:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const/4 v4, 0x4

    .line 49
    invoke-direct {v3, p0, v4, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v4, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 53
    .line 54
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Y6:I

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/4 v5, 0x5

    .line 61
    invoke-direct {v4, p0, v5, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    new-instance v5, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 65
    .line 66
    sget p1, Lcom/p1/mobile/putong/core/R$string;->G7:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const/4 v6, 0x6

    .line 73
    invoke-direct {v5, p0, v6, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    new-instance v6, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 77
    .line 78
    sget p1, Lcom/p1/mobile/putong/core/R$string;->W6:I

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const/4 v7, 0x7

    .line 85
    invoke-direct {v6, p0, v7, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    new-instance v7, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 89
    .line 90
    sget p1, Lcom/p1/mobile/putong/core/R$string;->J6:I

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const/16 v8, 0x8

    .line 97
    .line 98
    invoke-direct {v7, p0, v8, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->H:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->H:Ljava/util/ArrayList;

    .line 107
    .line 108
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->I:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;

    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    sget p1, Lcom/p1/mobile/putong/core/R$string;->K6:I

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method private synthetic X4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/asj0;->a0(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public R4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/r1l;->b(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/s1l;->b(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T4()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r1l;->c(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W4(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    const-string v0, "hidden"

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->D:Lv/VText;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget v2, Lcom/p1/mobile/putong/core/R$string;->C7:I

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/R$string;->B7:I

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->D:Lv/VText;

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget v3, Ll/c9c0;->u1:I

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    sget v3, Ll/c9c0;->U1:I

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->D:Lv/VText;

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    sget v2, Ll/dbc0;->xs:I

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    sget v2, Ll/dbc0;->ws:I

    .line 69
    .line 70
    :goto_2
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->C:Lv/VText;

    .line 74
    .line 75
    const/4 v2, 0x1

    .line 76
    const/4 v3, 0x0

    .line 77
    if-nez p1, :cond_4

    .line 78
    .line 79
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->J:Ll/wyd0;

    .line 80
    .line 81
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_3

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_3
    move v4, v3

    .line 95
    goto :goto_4

    .line 96
    :cond_4
    :goto_3
    move v4, v2

    .line 97
    :goto_4
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->D:Lv/VText;

    .line 101
    .line 102
    if-nez p1, :cond_6

    .line 103
    .line 104
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->J:Ll/wyd0;

    .line 105
    .line 106
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    check-cast v4, Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    if-eqz v4, :cond_5

    .line 117
    .line 118
    goto :goto_5

    .line 119
    :cond_5
    move v4, v3

    .line 120
    goto :goto_6

    .line 121
    :cond_6
    :goto_5
    move v4, v2

    .line 122
    :goto_6
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->B:Lv/VText;

    .line 126
    .line 127
    if-nez p1, :cond_7

    .line 128
    .line 129
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->J:Ll/wyd0;

    .line 130
    .line 131
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    check-cast v4, Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    if-nez v4, :cond_7

    .line 142
    .line 143
    goto :goto_7

    .line 144
    :cond_7
    move v2, v3

    .line 145
    :goto_7
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->J:Ll/wyd0;

    .line 149
    .line 150
    if-eqz p1, :cond_8

    .line 151
    .line 152
    goto :goto_8

    .line 153
    :cond_8
    const-string v0, "good"

    .line 154
    .line 155
    :goto_8
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 5
    .line 6
    new-instance v0, Ll/n1l;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/n1l;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    sget v0, Ll/dbc0;->vs:I

    .line 17
    .line 18
    new-instance v1, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$a;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Lv/navigationbar/VNavigationBar;->w(ILandroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 27
    .line 28
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lv/VIcon;

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const v1, -0x4cdededf

    .line 50
    .line 51
    .line 52
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    sget v0, Ll/dbc0;->q:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    const/high16 v0, 0x40000000    # 2.0f

    .line 66
    .line 67
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 84
    .line 85
    .line 86
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 87
    .line 88
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget v0, Ll/dbc0;->q:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->E:Lv/VText;

    .line 98
    .line 99
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Hq:I

    .line 100
    .line 101
    const-string v1, "7.3.3"

    .line 102
    .line 103
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->G:Lv/VList;

    .line 115
    .line 116
    const-string v0, "HelpCenterFrag"

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lv/VList;->setCrashLogFlag(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->G:Lv/VList;

    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->z:Lv/VLinear;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    new-instance p1, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;

    .line 129
    .line 130
    const/4 v0, 0x0

    .line 131
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Ll/q1l;)V

    .line 132
    .line 133
    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->I:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->G:Lv/VList;

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->G:Lv/VList;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->S4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->R4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3

    .line 1
    sget v0, Ll/lfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 4
    .line 5
    .line 6
    sget v0, Ll/adc0;->j8:I

    .line 7
    .line 8
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ll/o1l;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/o1l;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1, p0, p1, p2, v0}, Ll/eu9;->l(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Landroid/view/Menu;Landroid/view/MenuInflater;Landroid/view/MenuItem;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_help_center_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public y4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->T4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
