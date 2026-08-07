.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"


# instance fields
.field public B:Ll/f4x;

.field public C:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->W4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic W4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    iget-object v0, v0, Ll/dkb;->n4:Ll/jxd0;

    .line 9
    .line 10
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/f4x;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/f4x;-><init>(Ll/ner;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->B:Ll/f4x;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->C:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->B:Ll/f4x;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->c(Ll/f4x;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->B:Ll/f4x;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->C:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 43
    .line 44
    .line 45
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->B:Ll/f4x;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/f4x;->a0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/v3x;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/v3x;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;)V

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

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->C:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->C:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->C:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->n()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeTabFrag;->C:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_marriage_home"

    .line 2
    .line 3
    return-object p0
.end method
