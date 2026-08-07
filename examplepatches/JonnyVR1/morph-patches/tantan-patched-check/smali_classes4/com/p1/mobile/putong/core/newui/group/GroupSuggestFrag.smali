.class public Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/ppk;

.field public z:Ll/hpk;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->O4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic O4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->N4()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->N4()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->z:Ll/hpk;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/hpk;->R0()V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public N4()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/r97;->x2()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hpk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hpk;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->z:Ll/hpk;

    .line 10
    .line 11
    new-instance v0, Ll/ppk;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ll/ppk;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->A:Ll/ppk;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->z:Ll/hpk;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->z:Ll/hpk;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/hpk;->a0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/nok;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/nok;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;)V

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

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestFrag;->A:Ll/ppk;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ppk;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
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
    const-string p0, "p_group_chat_square"

    .line 2
    .line 3
    return-object p0
.end method
