.class public Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;
.super Ll/jic0;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/jxd0;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->e:Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions;->a()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->c:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Ll/l01;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-direct {v0, p1}, Ll/l01;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->d:Ljava/util/Map;

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->c:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/o030;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/o030;-><init>(Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic E(Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->g3:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x4

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->I(Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->G(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->e:Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p2, v2, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget v0, Ll/kec0;->U3:I

    .line 16
    .line 17
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p2, Ll/kec0;->S3:I

    .line 34
    .line 35
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget p1, Ll/adc0;->jf:I

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Landroid/widget/TextView;

    .line 46
    .line 47
    const-string p2, "7.3.3"

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-object p0
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    sget p3, Ll/adc0;->Sd:I

    .line 5
    .line 6
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    check-cast p3, Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->getTitle()Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->e:Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;

    .line 23
    .line 24
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->d:Ljava/util/Map;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->getId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-interface {p4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Ll/jxd0;

    .line 39
    .line 40
    invoke-virtual {p2}, Ll/hxd0;->obs()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p0, p3, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p2, Ll/p030;

    .line 49
    .line 50
    invoke-direct {p2, p1}, Ll/p030;-><init>(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->c:Ljava/util/List;

    .line 6
    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 14
    .line 15
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/jxd0;

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "faq_"

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->getId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, "_"

    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-direct {v1, p1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->H(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->d:Ljava/util/Map;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->getId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/jxd0;

    .line 18
    .line 19
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$LiveQuestion;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->e:Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startLiveVerificationPage(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$a;->e:Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;->getId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/FaqAct;->Y1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
