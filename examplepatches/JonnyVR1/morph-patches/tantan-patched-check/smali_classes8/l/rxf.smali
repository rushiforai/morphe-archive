.class public Ll/rxf;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "FakeAndGoodExperience"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static b()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->i1:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    return v0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->i1:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->i1:Ll/vxd0;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    add-int/2addr v0, v2

    .line 25
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j1:Ll/byd0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/Long;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    const-wide/16 v3, 0x0

    .line 49
    .line 50
    cmp-long v0, v0, v3

    .line 51
    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j1:Ll/byd0;

    .line 59
    .line 60
    invoke-static {}, Ll/pzi0;->o()J

    .line 61
    .line 62
    .line 63
    move-result-wide v3

    .line 64
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_0
    new-instance v0, Ll/uyf;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/uyf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 74
    .line 75
    .line 76
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/dkb;->Z7()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    const/4 v1, 0x0

    .line 85
    const-string v3, "p_suggest_users_home_view"

    .line 86
    .line 87
    invoke-virtual {v0, p0, v1, v3}, Ll/uyf;->C(ZZLjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    new-instance p0, Ll/qxf;

    .line 91
    .line 92
    invoke-direct {p0}, Ll/qxf;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string v1, "FakeAndGoodExperience"

    .line 103
    .line 104
    invoke-virtual {p0, v2, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ll/uyf;->show()V

    .line 108
    .line 109
    .line 110
    return-void
.end method
