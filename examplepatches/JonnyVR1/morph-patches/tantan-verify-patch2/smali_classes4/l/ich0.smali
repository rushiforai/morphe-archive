.class public Ll/ich0;
.super Ll/n4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/p8l$a;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/p8l$a;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->B0()V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 17
    .line 18
    iget-object p0, p0, Ll/j7b;->U:Ll/vxd0;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Ll/vxd0;->a(I)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 27
    .line 28
    iget-object p0, p0, Ll/j7b;->V:Ll/byd0;

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ich0;->d(Ll/p8l$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ich0;->e(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/j7b;->W:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/j7b;->s3()V

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/gch0;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {p0, v0}, Ll/gch0;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/hch0;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ll/hch0;-><init>(Ll/p8l$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/gch0;->O(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SURPRISE_BOX:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const/16 v2, 0x4e20

    .line 49
    .line 50
    invoke-virtual {v0, v1, p1, p0, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Ll/cl80;->q(Ll/al80;)V

    .line 63
    .line 64
    .line 65
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 66
    .line 67
    return-object p0
.end method

.method public e(Ll/p8l$a;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/j7b;->W:Z

    .line 6
    .line 7
    return p0
.end method
