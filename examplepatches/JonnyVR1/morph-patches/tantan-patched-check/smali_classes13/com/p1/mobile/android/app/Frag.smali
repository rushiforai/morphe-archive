.class public Lcom/p1/mobile/android/app/Frag;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Ll/ner;
.implements Ll/e3m;


# static fields
.field public static isFragResumed:Z


# instance fields
.field private activityReslutManager:Lcom/p1/mobile/android/app/a;

.field private cachedView:Landroid/view/View;

.field private hasDestroyView:Z

.field private lifecycleSubject:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation
.end field

.field private lifecycleSubjectTemp:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation
.end field

.field private final popLifeSub:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vk80;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubjectTemp:Lrx/subjects/a;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Frag;->hasDestroyView:Z

    .line 22
    .line 23
    new-instance v0, Lcom/p1/mobile/android/app/a;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/p1/mobile/android/app/a;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->i4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic W3(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->h4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic X3(Ll/y20;Ll/x20;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/android/app/c$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/p1/mobile/android/app/c$b;

    .line 6
    .line 7
    iget-object p1, p2, Lcom/p1/mobile/android/app/c$c;->p:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p2, p0, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public static bridge synthetic Y3(Lcom/p1/mobile/android/app/Frag;)Lcom/p1/mobile/android/app/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    return-object p0
.end method


# virtual methods
.method public H2()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Z3(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public a4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->cachedView:Landroid/view/View;

    .line 3
    .line 4
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public b4()Lcom/p1/mobile/android/app/Dialog$e;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final c4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->cachedView:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->cachedView:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public creates(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 17
    sget-object v0, Lcom/p1/mobile/android/app/Act;->ACTION0_NOTHING:Ll/x20;

    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    return-void
.end method

.method public creates(Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u11;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Ll/p4j;

    .line 9
    .line 10
    invoke-direct {v0, p1, p2}, Ll/p4j;-><init>(Ll/y20;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public d4()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    return-void
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Lcom/p1/mobile/android/app/Frag$b;

    invoke-direct {v0, p0, p1, p2}, Lcom/p1/mobile/android/app/Frag$b;-><init>(Lcom/p1/mobile/android/app/Frag;Ll/pcj;Z)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Frag$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/app/Frag$a;-><init>(Lcom/p1/mobile/android/app/Frag;Lrx/c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final e4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/o4j;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/o4j;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f4()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public getPopLifeName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "_"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final synthetic h4(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->ACTIVE:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->getPopLifeName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 28
    .line 29
    if-eq p1, v0, :cond_5

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    if-ne p1, v0, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 37
    .line 38
    if-eq p1, v0, :cond_4

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->k4()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 47
    .line 48
    if-ne p1, v0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 52
    .line 53
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->PENDING:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    xor-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->getPopLifeName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {v0, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    return-void

    .line 81
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->STOP:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    xor-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->getPopLifeName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {v0, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 104
    .line 105
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->DESTROY:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    xor-int/lit8 v1, v1, 0x1

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->getPopLifeName()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {v0, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final synthetic i4(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const-string v1, "[common][lifecycle]"

    .line 9
    .line 10
    invoke-static {v1, p0, p1, v0}, Ll/tu2;->b(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public j4(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public k0(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V
    .locals 1

    .line 1
    const/16 v0, 0x7891

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/android/app/Frag;->u4(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public l4(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {p0, p1, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public lifecycle()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubjectTemp:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public lifecycle_()Lcom/p1/mobile/android/app/c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/c;->n:Lcom/p1/mobile/android/app/c;

    .line 19
    .line 20
    return-object p0
.end method

.method public m4(Ljava/lang/Runnable;I)V
    .locals 2

    .line 1
    int-to-long v0, p2

    .line 2
    invoke-static {p0, p1, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o4(I)Landroid/app/Dialog;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Frag;->p4(IZ)Landroid/app/Dialog;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/android/app/a;->b(IILandroid/content/Intent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/n4j;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/n4j;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/android/app/c;->e:Lcom/p1/mobile/android/app/c;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->Z3(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Ll/af60;->c(Landroidx/fragment/app/Fragment;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->e4()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->d4()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->f4()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 32
    .line 33
    new-instance v1, Lcom/p1/mobile/android/app/c$a;

    .line 34
    .line 35
    invoke-direct {v1, p1}, Lcom/p1/mobile/android/app/c$a;-><init>(Landroid/os/Bundle;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, p0}, Ll/af60;->d(Landroidx/fragment/app/Fragment;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Frag;->hasDestroyView:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->a4()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->c4()V

    .line 12
    .line 13
    .line 14
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onCreateAnimation(IZI)Landroid/view/animation/Animation;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0}, Ll/af60;->g(Landroidx/fragment/app/Fragment;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    sput-boolean v0, Lcom/p1/mobile/android/app/Frag;->isFragResumed:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, ",onCreateView sis"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {p3, v1}, Ll/vi3;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, ",getArguments"

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v1, v2}, Ll/vi3;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/android/app/Frag;->cachedView:Landroid/view/View;

    .line 61
    .line 62
    if-nez v1, :cond_0

    .line 63
    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Frag;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/android/app/Frag;->j4(J)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2, p0, p1}, Ll/af60;->a(Landroidx/fragment/app/Fragment;Landroid/view/View;)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/android/app/Frag;->cachedView:Landroid/view/View;

    .line 84
    .line 85
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 86
    .line 87
    .line 88
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->c4()V

    .line 89
    .line 90
    .line 91
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Frag;->hasDestroyView:Z

    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 94
    .line 95
    new-instance p2, Lcom/p1/mobile/android/app/c$b;

    .line 96
    .line 97
    invoke-direct {p2, p3}, Lcom/p1/mobile/android/app/c$b;-><init>(Landroid/os/Bundle;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 104
    .line 105
    sget-object p2, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1, p0}, Ll/af60;->d(Landroidx/fragment/app/Fragment;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->cachedView:Landroid/view/View;

    .line 118
    .line 119
    return-object p0

    .line 120
    :cond_1
    const/4 p0, 0x0

    .line 121
    return-object p0
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->cachedView:Landroid/view/View;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->a4()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->y4()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Frag;->hasDestroyView:Z

    .line 18
    .line 19
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onDetach()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->n:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubjectTemp:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 25
    .line 26
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->PENDING:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 15
    .line 16
    xor-int/lit8 p1, p1, 0x1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->getPopLifeName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v0, p1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/vk80;

    .line 35
    .line 36
    iget-object v0, v0, Ll/vk80;->a:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 37
    .line 38
    xor-int/lit8 p1, p1, 0x1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->getPopLifeName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v0, p1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnResume:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnResume:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    sput-boolean p0, Lcom/p1/mobile/android/app/Frag;->isFragResumed:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnStart:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Act;->hasBlockOnStart:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public p4(IZ)Landroid/app/Dialog;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public popLifeObs()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/vk80;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->popLifeSub:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public q4(Ljava/lang/String;Z)Landroid/app/Dialog;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/android/app/Frag;->r4(Ljava/lang/String;ZZ)Landroid/app/Dialog;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public r4(Ljava/lang/String;ZZ)Landroid/app/Dialog;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1, v1, p2, p3}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/app/Dialog;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    return-object v1
.end method

.method public s4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public t4(Lcom/p1/mobile/android/app/a$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/a;->c(Lcom/p1/mobile/android/app/a$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u4(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Lcom/p1/mobile/android/app/a;->a(Lcom/p1/mobile/android/app/a$a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/android/app/Frag$c;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p3}, Lcom/p1/mobile/android/app/Frag$c;-><init>(Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/android/app/a$a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/a;->c(Lcom/p1/mobile/android/app/a$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0, p2, p1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public v4(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Act;->startActivityForResultFromFragmentWithCustomTransition(Lcom/p1/mobile/android/app/Frag;Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w4(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityFromFragmentWithCustomTransition(Lcom/p1/mobile/android/app/Frag;Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x4(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y4()V
    .locals 0

    .line 1
    return-void
.end method
