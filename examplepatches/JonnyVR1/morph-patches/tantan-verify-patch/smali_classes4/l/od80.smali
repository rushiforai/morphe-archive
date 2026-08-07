.class public Ll/od80;
.super Ll/n4;
.source "SourceFile"


# instance fields
.field public a:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/n4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/od80;->a:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/od80;->c(Ll/p8l$a;)Ljava/lang/Boolean;

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
    invoke-virtual {p0, p1}, Ll/od80;->e(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pla;->m3()V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/md80$a;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p1}, Ll/md80$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    const-string p1, ""

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/md80$a;->a(Ljava/lang/String;)Ll/md80$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/md80$a;->b()V

    .line 24
    .line 25
    .line 26
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    return-object p0
.end method

.method public final d(Ll/t7m;)Z
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/q7m;->getCardData()Ll/ik4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/wj90;->e(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ll/q7m;->getCardData()Ll/ik4;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ll/q7m;->getCardData()Ll/ik4;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-interface {p1}, Ll/q7m;->getCardData()Ll/ik4;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_0

    .line 63
    .line 64
    const/4 p0, 0x1

    .line 65
    return p0

    .line 66
    :cond_0
    return v0
.end method

.method public e(Ll/p8l$a;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/s7a;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p1, Ll/p8l$a;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Ll/cvl;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p1, Ll/p8l$a;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/cvl;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/cvl;->T()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 32
    .line 33
    if-ne v0, v2, :cond_1

    .line 34
    .line 35
    iget-object v0, p1, Ll/p8l$a;->c:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ll/f1g0;->d()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    instance-of v2, v0, Ll/t7m;

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    check-cast v0, Ll/t7m;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/q7m;->q0()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    invoke-static {}, Ll/v5b0;->h()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/od80;->d(Ll/t7m;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_1

    .line 78
    .line 79
    invoke-static {}, Ll/s7a;->A()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/pla;->t3()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    const-wide/16 v3, 0x18

    .line 96
    .line 97
    invoke-virtual {v2, v3, v4}, Ll/dkb;->h8(J)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-static {}, Ll/joa;->I3()Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-nez v3, :cond_1

    .line 106
    .line 107
    if-nez v2, :cond_1

    .line 108
    .line 109
    if-ge v0, p1, :cond_1

    .line 110
    .line 111
    iget-boolean p1, p0, Ll/od80;->a:Z

    .line 112
    .line 113
    if-eqz p1, :cond_1

    .line 114
    .line 115
    iput-boolean v1, p0, Ll/od80;->a:Z

    .line 116
    .line 117
    const/4 p0, 0x1

    .line 118
    return p0

    .line 119
    :cond_1
    return v1
.end method
