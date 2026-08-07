.class public Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;
    }
.end annotation


# instance fields
.field public c:Lv/VList;

.field public d:Lv/VText;

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->i2(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->h2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->g2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a2(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v1

    .line 11
    :goto_0
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static bridge synthetic b2(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static e2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "user_id"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "is_matched"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private synthetic g2(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->c:Lv/VList;

    .line 2
    .line 3
    const-string v0, "MutualContactsAct"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lv/VList;->setCrashLogFlag(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->c:Lv/VList;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->c:Lv/VList;

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->d2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->g:Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->c:Lv/VList;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private synthetic h2()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic i2(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 4
    .line 5
    invoke-static {v0}, Ll/e1b;->J0(Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->d:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->g:Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->t(Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static k2(Lcom/p1/mobile/putong/data/Contact;Lv/VDraweeView;Landroid/widget/TextView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contact;->thumbnailUri:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/a9g0;->j(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v0, " "

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/b220;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/b220;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0, v1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v0, 0x0

    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :goto_0
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    sget p0, Ll/dbc0;->h0:I

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    sget p0, Ll/dbc0;->Fu:I

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 66
    .line 67
    .line 68
    :goto_1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Contact;->thumbnailUri:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p2, p1, p0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c220;->b(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/d220;->b(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    new-instance v0, Ll/y120;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/y120;-><init>(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/z120;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/z120;-><init>(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/a220;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/a220;-><init>(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)V

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

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "user_id"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "is_matched"

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->f:Z

    .line 28
    .line 29
    return-void
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->e:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v2, Ll/og3;->c:Ll/og3;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->f:Z

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    sget-object v5, Ll/og3;->b:Ll/og3;

    .line 12
    .line 13
    const-string v0, "other user id"

    .line 14
    .line 15
    const-string v3, "matched"

    .line 16
    .line 17
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
