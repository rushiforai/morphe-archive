.class public Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.super Lcom/p1/mobile/putong/core/app/AutoReleaseVideoFrag;
.source "SourceFile"


# instance fields
.field public A:Z

.field public z:Lcom/p1/mobile/putong/core/newui/main/a$v;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/app/AutoReleaseVideoFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->A:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->P4(Landroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method public O4()Lcom/p1/mobile/putong/core/newui/main/a$v;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->z:Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Y5()Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->z:Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->z:Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 36
    .line 37
    return-object p0
.end method

.method public final synthetic P4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Q4()V
    .locals 1

    .line 1
    new-instance v0, Ll/l930;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/l930;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public R4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->S4()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->A:Z

    .line 6
    .line 7
    return-void
.end method

.method public S4()V
    .locals 0

    .line 1
    return-void
.end method

.method public final T4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->A:Z

    .line 3
    .line 4
    return-void
.end method

.method public U4()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->A:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->T4()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->S4()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
