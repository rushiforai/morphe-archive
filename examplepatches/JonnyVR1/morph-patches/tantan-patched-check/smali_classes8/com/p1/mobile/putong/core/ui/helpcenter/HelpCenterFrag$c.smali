.class public Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;Ll/q1l;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;ILandroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->w(ILandroid/view/View;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->t(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->yd:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->Q4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;II)V
    .locals 1

    .line 1
    sget p2, Ll/adc0;->g3:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 8
    .line 9
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->Q4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 18
    .line 19
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;->c:Ll/jxd0;

    .line 20
    .line 21
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    check-cast p3, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    xor-int/lit8 p3, p3, 0x1

    .line 32
    .line 33
    invoke-static {p2, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    sget p3, Ll/adc0;->Sd:I

    .line 37
    .line 38
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    check-cast p3, Landroid/widget/TextView;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->Q4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;->b:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    new-instance p3, Ll/p1l;

    .line 62
    .line 63
    invoke-direct {p3, p0, p4, p2}, Ll/p1l;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;ILandroid/view/View;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic w(ILandroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->Q4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 12
    .line 13
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;->c:Ll/jxd0;

    .line 14
    .line 15
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-boolean p2, p3, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;->d:Z

    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;->a()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->Q4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 49
    .line 50
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;->a:I

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->c:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;->Q4(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$b;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p3, v0, p0}, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->X1(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p2, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method
