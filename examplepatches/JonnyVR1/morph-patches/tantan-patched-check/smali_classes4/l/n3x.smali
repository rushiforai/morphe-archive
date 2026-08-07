.class public Ll/n3x;
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

.method public static A(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 9
    .line 10
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q1:Ll/wyd0;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r1:Ll/wyd0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_1

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r1:Ll/wyd0;

    .line 63
    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v0, "#"

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r1:Ll/wyd0;

    .line 93
    .line 94
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q1:Ll/wyd0;

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r1:Ll/wyd0;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 114
    .line 115
    .line 116
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 119
    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r1:Ll/wyd0;

    .line 121
    .line 122
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public static B(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Ll/dkb;->b8(Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p1, "mode_switching"

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const-string p1, "marryMode"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p1, "loveMode"

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    iget-object p0, p0, Ll/dkb;->F1:Lrx/subjects/b;

    .line 45
    .line 46
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static C(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 43
    .line 44
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 48
    .line 49
    sget p1, Ll/dbc0;->P8:I

    .line 50
    .line 51
    iput p1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 52
    .line 53
    iput-boolean p2, v0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 54
    .line 55
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public static D(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 1
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, Ll/n3x;->E(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static E(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 5
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/CharSequence;

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 67
    .line 68
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 71
    .line 72
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const-string v4, ""

    .line 77
    .line 78
    if-nez v3, :cond_0

    .line 79
    .line 80
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-nez v3, :cond_0

    .line 91
    .line 92
    new-instance v3, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    :cond_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_1

    .line 109
    .line 110
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_1

    .line 115
    .line 116
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    move-object v4, p1

    .line 121
    check-cast v4, Ljava/lang/String;

    .line 122
    .line 123
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 124
    .line 125
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 126
    .line 127
    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 144
    .line 145
    sget v0, Ll/dbc0;->U8:I

    .line 146
    .line 147
    iput v0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 148
    .line 149
    iput-boolean p2, p1, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 150
    .line 151
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    :cond_2
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/n3x;->d(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/n3x;->t(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x6

    .line 20
    if-le v1, v2, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-interface {p0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 47
    .line 48
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v4, Ll/n3x$a;

    .line 51
    .line 52
    invoke-direct {v4, v3}, Ll/n3x$a;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p0, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-object v1
.end method

.method public static b(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/CharSequence;

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    const-string v1, "[0-9]*"

    .line 63
    .line 64
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 83
    .line 84
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 88
    .line 89
    .line 90
    move-result v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    const-string v4, "cm"

    .line 92
    .line 93
    if-eqz v3, :cond_0

    .line 94
    .line 95
    const/16 v3, 0xa0

    .line 96
    .line 97
    if-lt v1, v3, :cond_0

    .line 98
    .line 99
    :try_start_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-nez p0, :cond_1

    .line 122
    .line 123
    const/16 p0, 0xaf

    .line 124
    .line 125
    if-lt v1, p0, :cond_1

    .line 126
    .line 127
    new-instance p0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 143
    .line 144
    :cond_1
    :goto_0
    iput-boolean p2, v2, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 145
    .line 146
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-nez p0, :cond_2

    .line 153
    .line 154
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 155
    .line 156
    .line 157
    :catch_0
    :cond_2
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const-string v0, "\u5e74\u6536\u5165"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    if-eqz v1, :cond_6

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    if-eqz v1, :cond_6

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 12
    .line 13
    if-eqz v1, :cond_6

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_6

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_6

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ljava/lang/String;

    .line 57
    .line 58
    :try_start_0
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-eqz v3, :cond_6

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_0

    .line 83
    .line 84
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const v4, 0x30d40

    .line 89
    .line 90
    .line 91
    if-ge v3, v4, :cond_1

    .line 92
    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_6

    .line 98
    .line 99
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    const v3, 0x493e0

    .line 104
    .line 105
    .line 106
    if-lt p0, v3, :cond_6

    .line 107
    .line 108
    :cond_1
    const-string p0, ""

    .line 109
    .line 110
    const-string v3, "200000"

    .line 111
    .line 112
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    const-string v4, "300000"

    .line 117
    .line 118
    if-eqz v3, :cond_2

    .line 119
    .line 120
    :try_start_1
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    if-eqz v3, :cond_2

    .line 125
    .line 126
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 127
    .line 128
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Y:I

    .line 129
    .line 130
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    goto :goto_0

    .line 135
    :cond_2
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 139
    const-string v4, "600000"

    .line 140
    .line 141
    if-eqz v3, :cond_3

    .line 142
    .line 143
    :try_start_2
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-eqz v3, :cond_3

    .line 148
    .line 149
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 150
    .line 151
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Z:I

    .line 152
    .line 153
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    goto :goto_0

    .line 158
    :cond_3
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 162
    const-string v4, "1000000"

    .line 163
    .line 164
    if-eqz v3, :cond_4

    .line 165
    .line 166
    :try_start_3
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-eqz v2, :cond_4

    .line 171
    .line 172
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 173
    .line 174
    sget v1, Lcom/p1/mobile/putong/core/R$string;->a0:I

    .line 175
    .line 176
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    goto :goto_0

    .line 181
    :cond_4
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_5

    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 188
    .line 189
    sget v1, Lcom/p1/mobile/putong/core/R$string;->b0:I

    .line 190
    .line 191
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    :cond_5
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-nez v1, :cond_6

    .line 200
    .line 201
    new-instance v1, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 202
    .line 203
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 204
    .line 205
    .line 206
    iput-boolean p2, v1, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 207
    .line 208
    new-instance p2, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 221
    .line 222
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :catch_0
    move-exception p0

    .line 227
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 228
    .line 229
    .line 230
    :cond_6
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_b

    .line 9
    .line 10
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, -0x1

    .line 14
    const/4 v4, 0x1

    .line 15
    const/4 v5, 0x0

    .line 16
    if-eqz v1, :cond_5

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 19
    .line 20
    if-eqz v1, :cond_5

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 23
    .line 24
    if-eqz v1, :cond_5

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_5

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/lang/CharSequence;

    .line 47
    .line 48
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_5

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-eqz v6, :cond_5

    .line 73
    .line 74
    new-instance v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 75
    .line 76
    invoke-direct {v6}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    sparse-switch v7, :sswitch_data_0

    .line 87
    .line 88
    .line 89
    :goto_0
    move v1, v3

    .line 90
    goto :goto_1

    .line 91
    :sswitch_0
    const-string v7, "divorced_without_child"

    .line 92
    .line 93
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    const/4 v1, 0x3

    .line 101
    goto :goto_1

    .line 102
    :sswitch_1
    const-string v7, "divorced_with_child"

    .line 103
    .line 104
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-nez v1, :cond_2

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    move v1, v2

    .line 112
    goto :goto_1

    .line 113
    :sswitch_2
    const-string v7, "single_since_birth"

    .line 114
    .line 115
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_3

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_3
    move v1, v4

    .line 123
    goto :goto_1

    .line 124
    :sswitch_3
    const-string v7, "single"

    .line 125
    .line 126
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_4

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_4
    move v1, v5

    .line 134
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 135
    .line 136
    .line 137
    goto :goto_2

    .line 138
    :pswitch_0
    const-string v1, "\u79bb\u5f02\u65e0\u5b69\u5b50"

    .line 139
    .line 140
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :pswitch_1
    const-string v1, "\u79bb\u5f02\u6709\u5b69\u5b50"

    .line 144
    .line 145
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :pswitch_2
    const-string v1, "\u6bcd\u80ce\u5355\u8eab"

    .line 149
    .line 150
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :pswitch_3
    const-string v1, "\u672a\u5a5a\u672a\u80b2"

    .line 154
    .line 155
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 156
    .line 157
    :goto_2
    iget-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-nez v1, :cond_5

    .line 164
    .line 165
    sget v1, Ll/dbc0;->Td:I

    .line 166
    .line 167
    iput v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 168
    .line 169
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 173
    .line 174
    if-eqz v1, :cond_9

    .line 175
    .line 176
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 177
    .line 178
    if-eqz v1, :cond_9

    .line 179
    .line 180
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 181
    .line 182
    if-eqz v1, :cond_9

    .line 183
    .line 184
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->babyWilling:Ljava/util/List;

    .line 185
    .line 186
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    if-nez v1, :cond_9

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 193
    .line 194
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 195
    .line 196
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 197
    .line 198
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->babyWilling:Ljava/util/List;

    .line 199
    .line 200
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    check-cast v1, Ljava/lang/CharSequence;

    .line 205
    .line 206
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-nez v1, :cond_9

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 213
    .line 214
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 215
    .line 216
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 217
    .line 218
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->babyWilling:Ljava/util/List;

    .line 219
    .line 220
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    check-cast v1, Ljava/lang/String;

    .line 225
    .line 226
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 227
    .line 228
    .line 229
    move-result v6

    .line 230
    if-eqz v6, :cond_9

    .line 231
    .line 232
    new-instance v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 233
    .line 234
    invoke-direct {v6}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 241
    .line 242
    .line 243
    move-result v7

    .line 244
    sparse-switch v7, :sswitch_data_1

    .line 245
    .line 246
    .line 247
    :goto_3
    move v2, v3

    .line 248
    goto :goto_4

    .line 249
    :sswitch_4
    const-string v7, "not_want"

    .line 250
    .line 251
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    if-nez v1, :cond_8

    .line 256
    .line 257
    goto :goto_3

    .line 258
    :sswitch_5
    const-string v2, "leave_it_to_fate"

    .line 259
    .line 260
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    if-nez v1, :cond_6

    .line 265
    .line 266
    goto :goto_3

    .line 267
    :cond_6
    move v2, v4

    .line 268
    goto :goto_4

    .line 269
    :sswitch_6
    const-string v2, "want"

    .line 270
    .line 271
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    if-nez v1, :cond_7

    .line 276
    .line 277
    goto :goto_3

    .line 278
    :cond_7
    move v2, v5

    .line 279
    :cond_8
    :goto_4
    packed-switch v2, :pswitch_data_1

    .line 280
    .line 281
    .line 282
    goto :goto_5

    .line 283
    :pswitch_4
    const-string v1, "\u4e0d\u8981\u5b69\u5b50"

    .line 284
    .line 285
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 286
    .line 287
    goto :goto_5

    .line 288
    :pswitch_5
    const-string v1, "\u751f\u5b69\u5b50\u968f\u7f18"

    .line 289
    .line 290
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 291
    .line 292
    goto :goto_5

    .line 293
    :pswitch_6
    const-string v1, "\u60f3\u8981\u5b69\u5b50"

    .line 294
    .line 295
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 296
    .line 297
    :goto_5
    iget-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 298
    .line 299
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    if-nez v1, :cond_9

    .line 304
    .line 305
    sget v1, Ll/dbc0;->Md:I

    .line 306
    .line 307
    iput v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 308
    .line 309
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 313
    .line 314
    if-eqz v1, :cond_a

    .line 315
    .line 316
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 317
    .line 318
    if-eqz v1, :cond_a

    .line 319
    .line 320
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 321
    .line 322
    if-eqz v1, :cond_a

    .line 323
    .line 324
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 325
    .line 326
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    if-nez v1, :cond_a

    .line 331
    .line 332
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 333
    .line 334
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 335
    .line 336
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 337
    .line 338
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 339
    .line 340
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    check-cast v1, Ljava/lang/String;

    .line 345
    .line 346
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 347
    .line 348
    .line 349
    move-result v2

    .line 350
    if-eqz v2, :cond_a

    .line 351
    .line 352
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 353
    .line 354
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 355
    .line 356
    .line 357
    new-instance v3, Ljava/lang/StringBuilder;

    .line 358
    .line 359
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 360
    .line 361
    .line 362
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    const-string v1, "cm"

    .line 366
    .line 367
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v1

    .line 374
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 375
    .line 376
    sget v1, Ll/dbc0;->Yq:I

    .line 377
    .line 378
    iput v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 379
    .line 380
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    :cond_a
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->WEIGHT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 384
    .line 385
    invoke-static {v1, p0}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 390
    .line 391
    .line 392
    move-result v2

    .line 393
    if-eqz v2, :cond_b

    .line 394
    .line 395
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 396
    .line 397
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 398
    .line 399
    .line 400
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 401
    .line 402
    sget v1, Ll/dbc0;->ar:I

    .line 403
    .line 404
    iput v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 405
    .line 406
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 410
    .line 411
    if-eqz v1, :cond_c

    .line 412
    .line 413
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 414
    .line 415
    if-eqz v1, :cond_c

    .line 416
    .line 417
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 418
    .line 419
    if-eqz v1, :cond_c

    .line 420
    .line 421
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 422
    .line 423
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    if-nez v1, :cond_c

    .line 428
    .line 429
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 430
    .line 431
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 432
    .line 433
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 434
    .line 435
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 436
    .line 437
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    move-result-object v1

    .line 441
    check-cast v1, Ljava/lang/String;

    .line 442
    .line 443
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 444
    .line 445
    .line 446
    move-result v2

    .line 447
    if-eqz v2, :cond_c

    .line 448
    .line 449
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 450
    .line 451
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 452
    .line 453
    .line 454
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 455
    .line 456
    sget v1, Ll/dbc0;->X8:I

    .line 457
    .line 458
    iput v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 459
    .line 460
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    .line 462
    .line 463
    :cond_c
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->INCOME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 464
    .line 465
    invoke-static {v1, p0}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v1

    .line 469
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    if-eqz v2, :cond_d

    .line 474
    .line 475
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 476
    .line 477
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 478
    .line 479
    .line 480
    new-instance v3, Ljava/lang/StringBuilder;

    .line 481
    .line 482
    const-string v6, "\u5e74\u6536\u5165"

    .line 483
    .line 484
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 488
    .line 489
    .line 490
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 495
    .line 496
    sget v1, Ll/dbc0;->V8:I

    .line 497
    .line 498
    iput v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 499
    .line 500
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 501
    .line 502
    .line 503
    :cond_d
    invoke-static {v0, p0}, Ll/n3x;->D(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    .line 504
    .line 505
    .line 506
    invoke-static {v0, p0, v4}, Ll/n3x;->C(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Z)V

    .line 507
    .line 508
    .line 509
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 510
    .line 511
    const-string v2, "\u4e2d\u56fd"

    .line 512
    .line 513
    const-string v3, "\u00b7"

    .line 514
    .line 515
    const-string v4, ""

    .line 516
    .line 517
    if-eqz v1, :cond_13

    .line 518
    .line 519
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 520
    .line 521
    if-eqz v1, :cond_13

    .line 522
    .line 523
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 524
    .line 525
    if-eqz v1, :cond_13

    .line 526
    .line 527
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 528
    .line 529
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 530
    .line 531
    .line 532
    move-result v1

    .line 533
    if-nez v1, :cond_13

    .line 534
    .line 535
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 536
    .line 537
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 538
    .line 539
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 540
    .line 541
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 542
    .line 543
    new-instance v6, Ljava/util/ArrayList;

    .line 544
    .line 545
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 546
    .line 547
    .line 548
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    :cond_e
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 553
    .line 554
    .line 555
    move-result v7

    .line 556
    if-eqz v7, :cond_10

    .line 557
    .line 558
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v7

    .line 562
    check-cast v7, Ljava/lang/String;

    .line 563
    .line 564
    invoke-static {v2, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 565
    .line 566
    .line 567
    move-result v8

    .line 568
    if-eqz v8, :cond_f

    .line 569
    .line 570
    goto :goto_6

    .line 571
    :cond_f
    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 572
    .line 573
    .line 574
    move-result v8

    .line 575
    if-nez v8, :cond_e

    .line 576
    .line 577
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 578
    .line 579
    .line 580
    goto :goto_6

    .line 581
    :cond_10
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 582
    .line 583
    .line 584
    move-result-object v1

    .line 585
    move-object v6, v4

    .line 586
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 587
    .line 588
    .line 589
    move-result v7

    .line 590
    if-eqz v7, :cond_12

    .line 591
    .line 592
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 593
    .line 594
    .line 595
    move-result-object v7

    .line 596
    check-cast v7, Ljava/lang/String;

    .line 597
    .line 598
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 599
    .line 600
    .line 601
    move-result v8

    .line 602
    if-nez v8, :cond_11

    .line 603
    .line 604
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 605
    .line 606
    .line 607
    move-result v8

    .line 608
    if-nez v8, :cond_11

    .line 609
    .line 610
    new-instance v8, Ljava/lang/StringBuilder;

    .line 611
    .line 612
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 613
    .line 614
    .line 615
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 619
    .line 620
    .line 621
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object v6

    .line 628
    goto :goto_7

    .line 629
    :cond_11
    new-instance v8, Ljava/lang/StringBuilder;

    .line 630
    .line 631
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 632
    .line 633
    .line 634
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 635
    .line 636
    .line 637
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    .line 639
    .line 640
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 641
    .line 642
    .line 643
    move-result-object v6

    .line 644
    goto :goto_7

    .line 645
    :cond_12
    new-instance v1, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 646
    .line 647
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 648
    .line 649
    .line 650
    const-string v7, "\u73b0\u5c45"

    .line 651
    .line 652
    invoke-virtual {v7, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 653
    .line 654
    .line 655
    move-result-object v6

    .line 656
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 657
    .line 658
    sget v6, Ll/dbc0;->br:I

    .line 659
    .line 660
    iput v6, v1, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 661
    .line 662
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 663
    .line 664
    .line 665
    :cond_13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFESSION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 666
    .line 667
    invoke-static {v1, p0}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 668
    .line 669
    .line 670
    move-result-object v1

    .line 671
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 672
    .line 673
    .line 674
    move-result v6

    .line 675
    if-eqz v6, :cond_14

    .line 676
    .line 677
    new-instance v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 678
    .line 679
    invoke-direct {v6}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 680
    .line 681
    .line 682
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 683
    .line 684
    sget v1, Ll/dbc0;->er:I

    .line 685
    .line 686
    iput v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 687
    .line 688
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    :cond_14
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MONTHLY_COST:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 692
    .line 693
    invoke-static {v1, p0}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 694
    .line 695
    .line 696
    move-result-object v1

    .line 697
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 698
    .line 699
    .line 700
    move-result v6

    .line 701
    if-eqz v6, :cond_15

    .line 702
    .line 703
    new-instance v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 704
    .line 705
    invoke-direct {v6}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 706
    .line 707
    .line 708
    new-instance v7, Ljava/lang/StringBuilder;

    .line 709
    .line 710
    const-string v8, "\u6708\u6d88\u8d39"

    .line 711
    .line 712
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 713
    .line 714
    .line 715
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 716
    .line 717
    .line 718
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 719
    .line 720
    .line 721
    move-result-object v1

    .line 722
    iput-object v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 723
    .line 724
    sget v1, Ll/dbc0;->Zq:I

    .line 725
    .line 726
    iput v1, v6, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 727
    .line 728
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 729
    .line 730
    .line 731
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 732
    .line 733
    if-eqz v1, :cond_1d

    .line 734
    .line 735
    iget-object v6, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 736
    .line 737
    if-eqz v6, :cond_1d

    .line 738
    .line 739
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 740
    .line 741
    if-eqz v6, :cond_1d

    .line 742
    .line 743
    new-instance v6, Ljava/lang/StringBuilder;

    .line 744
    .line 745
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 746
    .line 747
    .line 748
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 749
    .line 750
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 751
    .line 752
    iget-object v7, v7, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 753
    .line 754
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 755
    .line 756
    .line 757
    move-result v7

    .line 758
    if-eqz v7, :cond_16

    .line 759
    .line 760
    move-object v7, v4

    .line 761
    goto :goto_8

    .line 762
    :cond_16
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 763
    .line 764
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 765
    .line 766
    iget-object v7, v7, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 767
    .line 768
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 769
    .line 770
    .line 771
    move-result-object v7

    .line 772
    check-cast v7, Ljava/lang/String;

    .line 773
    .line 774
    :goto_8
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 775
    .line 776
    .line 777
    move-result v8

    .line 778
    if-nez v8, :cond_17

    .line 779
    .line 780
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 781
    .line 782
    .line 783
    move-result v2

    .line 784
    if-nez v2, :cond_17

    .line 785
    .line 786
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 787
    .line 788
    .line 789
    :cond_17
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 790
    .line 791
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 792
    .line 793
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 794
    .line 795
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 796
    .line 797
    .line 798
    move-result v2

    .line 799
    if-eqz v2, :cond_18

    .line 800
    .line 801
    move-object v2, v4

    .line 802
    goto :goto_9

    .line 803
    :cond_18
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 804
    .line 805
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 806
    .line 807
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 808
    .line 809
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 810
    .line 811
    .line 812
    move-result-object v2

    .line 813
    check-cast v2, Ljava/lang/String;

    .line 814
    .line 815
    :goto_9
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 816
    .line 817
    .line 818
    move-result v7

    .line 819
    if-nez v7, :cond_1a

    .line 820
    .line 821
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 822
    .line 823
    .line 824
    move-result-object v7

    .line 825
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 826
    .line 827
    .line 828
    move-result v7

    .line 829
    if-nez v7, :cond_19

    .line 830
    .line 831
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 832
    .line 833
    .line 834
    :cond_19
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 835
    .line 836
    .line 837
    :cond_1a
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 838
    .line 839
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 840
    .line 841
    iget-object v7, v7, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 842
    .line 843
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 844
    .line 845
    .line 846
    move-result v7

    .line 847
    if-eqz v7, :cond_1b

    .line 848
    .line 849
    goto :goto_a

    .line 850
    :cond_1b
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 851
    .line 852
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 853
    .line 854
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 855
    .line 856
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 857
    .line 858
    .line 859
    move-result-object v1

    .line 860
    move-object v4, v1

    .line 861
    check-cast v4, Ljava/lang/String;

    .line 862
    .line 863
    :goto_a
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 864
    .line 865
    .line 866
    move-result v1

    .line 867
    if-nez v1, :cond_1c

    .line 868
    .line 869
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 870
    .line 871
    .line 872
    move-result v1

    .line 873
    if-nez v1, :cond_1c

    .line 874
    .line 875
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 876
    .line 877
    .line 878
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 879
    .line 880
    .line 881
    :cond_1c
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 882
    .line 883
    .line 884
    move-result-object v1

    .line 885
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 886
    .line 887
    .line 888
    move-result v1

    .line 889
    if-nez v1, :cond_1d

    .line 890
    .line 891
    new-instance v1, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 892
    .line 893
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 894
    .line 895
    .line 896
    new-instance v2, Ljava/lang/StringBuilder;

    .line 897
    .line 898
    const-string v3, "\u6765\u81ea "

    .line 899
    .line 900
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 901
    .line 902
    .line 903
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 904
    .line 905
    .line 906
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 907
    .line 908
    .line 909
    move-result-object v2

    .line 910
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 911
    .line 912
    sget v2, Ll/dbc0;->Xq:I

    .line 913
    .line 914
    iput v2, v1, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 915
    .line 916
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 917
    .line 918
    .line 919
    :cond_1d
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 920
    .line 921
    if-eqz p0, :cond_1e

    .line 922
    .line 923
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 924
    .line 925
    if-eqz p0, :cond_1e

    .line 926
    .line 927
    invoke-static {p0}, Ll/q8g0;->m0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ll/pf60;

    .line 928
    .line 929
    .line 930
    move-result-object p0

    .line 931
    new-instance v1, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 932
    .line 933
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 934
    .line 935
    .line 936
    iget-object v2, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 937
    .line 938
    check-cast v2, Ljava/lang/String;

    .line 939
    .line 940
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 941
    .line 942
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 943
    .line 944
    check-cast p0, Ljava/lang/Integer;

    .line 945
    .line 946
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 947
    .line 948
    .line 949
    move-result p0

    .line 950
    iput p0, v1, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 951
    .line 952
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 953
    .line 954
    .line 955
    :cond_1e
    :goto_b
    return-object v0

    .line 956
    nop

    .line 957
    :sswitch_data_0
    .sparse-switch
        -0x35c77bb8 -> :sswitch_3
        0x3238ae03 -> :sswitch_2
        0x40e41bb4 -> :sswitch_1
        0x6c8ed5f4 -> :sswitch_0
    .end sparse-switch

    .line 958
    .line 959
    .line 960
    .line 961
    .line 962
    .line 963
    .line 964
    .line 965
    .line 966
    .line 967
    .line 968
    .line 969
    .line 970
    .line 971
    .line 972
    .line 973
    .line 974
    .line 975
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 976
    .line 977
    .line 978
    .line 979
    .line 980
    .line 981
    .line 982
    .line 983
    .line 984
    .line 985
    .line 986
    .line 987
    :sswitch_data_1
    .sparse-switch
        0x379210 -> :sswitch_6
        0x15562f24 -> :sswitch_5
        0x5df96bfc -> :sswitch_4
    .end sparse-switch

    .line 988
    .line 989
    .line 990
    .line 991
    .line 992
    .line 993
    .line 994
    .line 995
    .line 996
    .line 997
    .line 998
    .line 999
    .line 1000
    .line 1001
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public static e()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/n3x;->r()Lcom/p1/mobile/putong/core/data/MarryRedDot;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/MarryRedDot;->enable:Z

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/MarryRedDot;->type:Ljava/lang/String;

    .line 14
    .line 15
    const-string v3, "all"

    .line 16
    .line 17
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/MarryRedDot;->type:Ljava/lang/String;

    .line 24
    .line 25
    const-string v3, "part"

    .line 26
    .line 27
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    iget-object v2, v2, Ll/dkb;->n4:Ll/jxd0;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_2

    .line 50
    .line 51
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/MarryRedDot;->mark:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-nez v2, :cond_2

    .line 58
    .line 59
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    iget-object v1, v1, Ll/dkb;->o4:Ll/wyd0;

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Ljava/lang/CharSequence;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MarryRedDot;->mark:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    xor-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    return v0

    .line 80
    :cond_2
    :goto_0
    return v1
.end method

.method public static f(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_2

    .line 11
    .line 12
    invoke-static {}, Ll/n3x;->s()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-object v0
.end method

.method public static g()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->r0()Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const-string v0, ""

    .line 24
    .line 25
    return-object v0
.end method

.method public static h()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->r0()Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, ""

    .line 11
    .line 12
    return-object v0
.end method

.method public static i()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->r0()Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const-string v0, ""

    .line 24
    .line 25
    return-object v0
.end method

.method public static j()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->r0()Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MarryConfig;->enable_pay_wall:Z

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method public static k()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->r0()Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, ""

    .line 11
    .line 12
    return-object v0
.end method

.method public static l()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->r0()Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, ""

    .line 11
    .line 12
    return-object v0
.end method

.method public static m()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->r0()Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const-string v0, ""

    .line 24
    .line 25
    return-object v0
.end method

.method public static n()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->s0()Lcom/p1/mobile/putong/core/data/MarryGuideConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MarryGuideConfig;->scroll_pay_wall:Z

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    return v0
.end method

.method public static o(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_2

    .line 9
    .line 10
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_AGE_EDIT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 31
    .line 32
    invoke-static {v1, p0}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 43
    .line 44
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 53
    .line 54
    const/4 v2, 0x2

    .line 55
    const/4 v3, 0x0

    .line 56
    if-eqz v1, :cond_6

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 59
    .line 60
    if-eqz v1, :cond_6

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 63
    .line 64
    if-eqz v1, :cond_6

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_6

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Ljava/lang/CharSequence;

    .line 87
    .line 88
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_6

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 99
    .line 100
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-eqz v4, :cond_6

    .line 113
    .line 114
    new-instance v4, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 115
    .line 116
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    const/4 v6, -0x1

    .line 127
    sparse-switch v5, :sswitch_data_0

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_0
    const-string v5, "bachelor"

    .line 132
    .line 133
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-nez v1, :cond_2

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_2
    const/4 v6, 0x3

    .line 141
    goto :goto_0

    .line 142
    :sswitch_1
    const-string v5, "associate"

    .line 143
    .line 144
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-nez v1, :cond_3

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_3
    move v6, v2

    .line 152
    goto :goto_0

    .line 153
    :sswitch_2
    const-string v5, "master"

    .line 154
    .line 155
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_4

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_4
    const/4 v6, 0x1

    .line 163
    goto :goto_0

    .line 164
    :sswitch_3
    const-string v5, "doctor"

    .line 165
    .line 166
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-nez v1, :cond_5

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_5
    move v6, v3

    .line 174
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :pswitch_0
    const-string v1, "\u672c\u79d1\u53ca\u4ee5\u4e0a"

    .line 179
    .line 180
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :pswitch_1
    const-string v1, "\u5927\u4e13\u53ca\u4ee5\u4e0a"

    .line 184
    .line 185
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :pswitch_2
    const-string v1, "\u7855\u58eb\u53ca\u4ee5\u4e0a"

    .line 189
    .line 190
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 191
    .line 192
    goto :goto_1

    .line 193
    :pswitch_3
    const-string v1, "\u535a\u58eb"

    .line 194
    .line 195
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 196
    .line 197
    :goto_1
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-nez v1, :cond_6

    .line 204
    .line 205
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    :cond_6
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_INCOME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 209
    .line 210
    invoke-static {v1, p0}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    if-eqz v4, :cond_7

    .line 219
    .line 220
    new-instance v4, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 221
    .line 222
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 223
    .line 224
    .line 225
    new-instance v5, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    const-string v6, "\u5e74\u6536\u5165"

    .line 228
    .line 229
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 240
    .line 241
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 245
    .line 246
    if-eqz v1, :cond_8

    .line 247
    .line 248
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 249
    .line 250
    if-eqz v1, :cond_8

    .line 251
    .line 252
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 253
    .line 254
    if-eqz v1, :cond_8

    .line 255
    .line 256
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 257
    .line 258
    if-eqz v1, :cond_8

    .line 259
    .line 260
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    if-ne v1, v2, :cond_8

    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 267
    .line 268
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 269
    .line 270
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 271
    .line 272
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 273
    .line 274
    invoke-static {v1}, Ll/n3x;->q(Ljava/util/List;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-static {v1}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 279
    .line 280
    .line 281
    move-result v2

    .line 282
    if-eqz v2, :cond_8

    .line 283
    .line 284
    new-instance v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 285
    .line 286
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 287
    .line 288
    .line 289
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 290
    .line 291
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    :cond_8
    invoke-static {v0, p0}, Ll/n3x;->y(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    .line 295
    .line 296
    .line 297
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    const/4 v1, 0x5

    .line 302
    if-le p0, v1, :cond_9

    .line 303
    .line 304
    invoke-interface {v0, v3, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    return-object p0

    .line 309
    :cond_9
    :goto_2
    return-object v0

    .line 310
    nop

    .line 311
    :sswitch_data_0
    .sparse-switch
        -0x4f106ee1 -> :sswitch_3
        -0x4072d59e -> :sswitch_2
        0x5e900f1e -> :sswitch_1
        0x7e487fae -> :sswitch_0
    .end sparse-switch

    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static p(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 7

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [Ljava/lang/String;

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const-string v3, ""

    .line 6
    .line 7
    aput-object v3, v1, v2

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    aput-object v3, v1, v4

    .line 11
    .line 12
    const/4 v5, 0x2

    .line 13
    aput-object v3, v1, v5

    .line 14
    .line 15
    iget-object v6, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 16
    .line 17
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 18
    .line 19
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 20
    .line 21
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    if-nez v6, :cond_3

    .line 28
    .line 29
    :goto_0
    if-ge v2, v0, :cond_1

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-le v3, v2, :cond_0

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Ljava/lang/String;

    .line 58
    .line 59
    aput-object v3, v1, v2

    .line 60
    .line 61
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    aget-object p0, v1, v5

    .line 65
    .line 66
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-nez p0, :cond_2

    .line 71
    .line 72
    aget-object p0, v1, v5

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_2
    aget-object p0, v1, v4

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_3
    return-object v3
.end method

.method public static q(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "unlimited"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/String;

    .line 17
    .line 18
    :goto_0
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    move-object p0, v1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const/4 v2, 0x1

    .line 27
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    :goto_1
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    const-string p0, "\u4e0d\u9650"

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_2
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_3

    .line 53
    .line 54
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 55
    .line 56
    const-string v1, "%scm\u4ee5\u4e0b"

    .line 57
    .line 58
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_3
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    sget-object p0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 74
    .line 75
    const-string v1, "%scm\u4ee5\u4e0a"

    .line 76
    .line 77
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {p0, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_4
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_5

    .line 91
    .line 92
    sget-object p0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 93
    .line 94
    const-string v1, "%scm"

    .line 95
    .line 96
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {p0, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_5
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 106
    .line 107
    const-string v2, "%s - %scm"

    .line 108
    .line 109
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {v1, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0
.end method

.method public static r()Lcom/p1/mobile/putong/core/data/MarryRedDot;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static s()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q1:Ll/wyd0;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r1:Ll/wyd0;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    const-string v2, "#"

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    array-length v2, v1

    .line 63
    const/4 v3, 0x0

    .line 64
    :goto_0
    if-ge v3, v2, :cond_1

    .line 65
    .line 66
    aget-object v4, v1, v3

    .line 67
    .line 68
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-nez v5, :cond_0

    .line 73
    .line 74
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    return-object v0

    .line 81
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q1:Ll/wyd0;

    .line 86
    .line 87
    invoke-virtual {v2, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r1:Ll/wyd0;

    .line 95
    .line 96
    invoke-virtual {v1}, Ll/wyd0;->clear()Z

    .line 97
    .line 98
    .line 99
    return-object v0
.end method

.method public static t(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v2, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ljava/lang/CharSequence;

    .line 51
    .line 52
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_0

    .line 57
    .line 58
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ljava/lang/String;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    move-object v0, v5

    .line 74
    :goto_0
    iget-object v6, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 75
    .line 76
    if-eqz v6, :cond_1

    .line 77
    .line 78
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 79
    .line 80
    if-eqz v6, :cond_1

    .line 81
    .line 82
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 83
    .line 84
    if-eqz v6, :cond_1

    .line 85
    .line 86
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 87
    .line 88
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    if-nez v6, :cond_1

    .line 93
    .line 94
    iget-object v6, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 95
    .line 96
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 97
    .line 98
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 99
    .line 100
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    check-cast v6, Ljava/lang/CharSequence;

    .line 107
    .line 108
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-nez v6, :cond_1

    .line 113
    .line 114
    iget-object v6, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 115
    .line 116
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 117
    .line 118
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 119
    .line 120
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    check-cast v6, Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_1
    move-object v6, v5

    .line 130
    :goto_1
    invoke-static {v0}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    const/4 v9, 0x2

    .line 135
    const-string v10, "unlimited"

    .line 136
    .line 137
    const/4 v11, 0x1

    .line 138
    if-eqz v7, :cond_7

    .line 139
    .line 140
    new-instance v7, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 141
    .line 142
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 149
    .line 150
    .line 151
    move-result v12

    .line 152
    const-string v13, "divorced_without_child"

    .line 153
    .line 154
    const-string v14, "divorced_with_child"

    .line 155
    .line 156
    const-string v15, "single"

    .line 157
    .line 158
    sparse-switch v12, :sswitch_data_0

    .line 159
    .line 160
    .line 161
    :goto_2
    const/4 v12, -0x1

    .line 162
    goto :goto_3

    .line 163
    :sswitch_0
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v12

    .line 167
    if-nez v12, :cond_2

    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_2
    move v12, v9

    .line 171
    goto :goto_3

    .line 172
    :sswitch_1
    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v12

    .line 176
    if-nez v12, :cond_3

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_3
    move v12, v11

    .line 180
    goto :goto_3

    .line 181
    :sswitch_2
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v12

    .line 185
    if-nez v12, :cond_4

    .line 186
    .line 187
    goto :goto_2

    .line 188
    :cond_4
    move v12, v4

    .line 189
    :goto_3
    packed-switch v12, :pswitch_data_0

    .line 190
    .line 191
    .line 192
    goto :goto_4

    .line 193
    :pswitch_0
    const-string v12, "\u79bb\u5f02\u65e0\u5b69\u5b50"

    .line 194
    .line 195
    iput-object v12, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 196
    .line 197
    goto :goto_4

    .line 198
    :pswitch_1
    const-string v12, "\u79bb\u5f02\u6709\u5b69\u5b50"

    .line 199
    .line 200
    iput-object v12, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 201
    .line 202
    goto :goto_4

    .line 203
    :pswitch_2
    const-string v12, "\u672a\u5a5a\u672a\u80b2"

    .line 204
    .line 205
    iput-object v12, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 206
    .line 207
    :goto_4
    invoke-static {v6, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 208
    .line 209
    .line 210
    move-result v12

    .line 211
    if-nez v12, :cond_6

    .line 212
    .line 213
    const-string v12, "unmarried"

    .line 214
    .line 215
    invoke-static {v6, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 216
    .line 217
    .line 218
    move-result v12

    .line 219
    if-eqz v12, :cond_5

    .line 220
    .line 221
    invoke-static {v0, v15}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 222
    .line 223
    .line 224
    move-result v12

    .line 225
    if-nez v12, :cond_6

    .line 226
    .line 227
    :cond_5
    const-string v12, "divorced"

    .line 228
    .line 229
    invoke-static {v6, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 230
    .line 231
    .line 232
    move-result v6

    .line 233
    if-eqz v6, :cond_7

    .line 234
    .line 235
    invoke-static {v0, v13}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 236
    .line 237
    .line 238
    move-result v6

    .line 239
    if-nez v6, :cond_6

    .line 240
    .line 241
    invoke-static {v0, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-eqz v0, :cond_7

    .line 246
    .line 247
    :cond_6
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    :cond_7
    const-string v0, "\u7855\u58eb"

    .line 251
    .line 252
    const-string v6, "\u535a\u58eb"

    .line 253
    .line 254
    const-string v7, "\u5927\u4e13\u4ee5\u4e0b"

    .line 255
    .line 256
    const-string v12, "\u5927\u4e13"

    .line 257
    .line 258
    const-string v13, "\u672c\u79d1"

    .line 259
    .line 260
    filled-new-array {v7, v12, v13, v0, v6}, [Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 265
    .line 266
    .line 267
    move-result-object v6

    .line 268
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 269
    .line 270
    if-eqz v0, :cond_8

    .line 271
    .line 272
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 273
    .line 274
    if-eqz v0, :cond_8

    .line 275
    .line 276
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 277
    .line 278
    if-eqz v0, :cond_8

    .line 279
    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 281
    .line 282
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-nez v0, :cond_8

    .line 287
    .line 288
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 289
    .line 290
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 291
    .line 292
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 293
    .line 294
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 295
    .line 296
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    check-cast v0, Ljava/lang/CharSequence;

    .line 301
    .line 302
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    if-nez v0, :cond_8

    .line 307
    .line 308
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 309
    .line 310
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 311
    .line 312
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 313
    .line 314
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 315
    .line 316
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    check-cast v0, Ljava/lang/String;

    .line 321
    .line 322
    goto :goto_5

    .line 323
    :cond_8
    move-object v0, v10

    .line 324
    :goto_5
    iget-object v7, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 325
    .line 326
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 327
    .line 328
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 329
    .line 330
    iget-object v7, v7, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 331
    .line 332
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 333
    .line 334
    .line 335
    move-result v7

    .line 336
    if-eqz v7, :cond_9

    .line 337
    .line 338
    iget-object v7, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 339
    .line 340
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 341
    .line 342
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 343
    .line 344
    iget-object v7, v7, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 345
    .line 346
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 347
    .line 348
    .line 349
    move-result v7

    .line 350
    if-nez v7, :cond_9

    .line 351
    .line 352
    iget-object v5, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 353
    .line 354
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 355
    .line 356
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 357
    .line 358
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 359
    .line 360
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object v5

    .line 364
    check-cast v5, Ljava/lang/String;

    .line 365
    .line 366
    :cond_9
    invoke-static {v5}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 367
    .line 368
    .line 369
    move-result v7

    .line 370
    if-eqz v7, :cond_10

    .line 371
    .line 372
    new-instance v7, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 373
    .line 374
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 375
    .line 376
    .line 377
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 378
    .line 379
    .line 380
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 381
    .line 382
    .line 383
    move-result v12

    .line 384
    const/4 v13, 0x4

    .line 385
    const/4 v14, 0x3

    .line 386
    sparse-switch v12, :sswitch_data_1

    .line 387
    .line 388
    .line 389
    :goto_6
    const/4 v0, -0x1

    .line 390
    goto :goto_7

    .line 391
    :sswitch_3
    const-string v12, "bachelor"

    .line 392
    .line 393
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result v0

    .line 397
    if-nez v0, :cond_a

    .line 398
    .line 399
    goto :goto_6

    .line 400
    :cond_a
    move v0, v13

    .line 401
    goto :goto_7

    .line 402
    :sswitch_4
    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    if-nez v0, :cond_b

    .line 407
    .line 408
    goto :goto_6

    .line 409
    :cond_b
    move v0, v14

    .line 410
    goto :goto_7

    .line 411
    :sswitch_5
    const-string v12, "associate"

    .line 412
    .line 413
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-nez v0, :cond_c

    .line 418
    .line 419
    goto :goto_6

    .line 420
    :cond_c
    move v0, v9

    .line 421
    goto :goto_7

    .line 422
    :sswitch_6
    const-string v12, "master"

    .line 423
    .line 424
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    move-result v0

    .line 428
    if-nez v0, :cond_d

    .line 429
    .line 430
    goto :goto_6

    .line 431
    :cond_d
    move v0, v11

    .line 432
    goto :goto_7

    .line 433
    :sswitch_7
    const-string v12, "doctor"

    .line 434
    .line 435
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    if-nez v0, :cond_e

    .line 440
    .line 441
    goto :goto_6

    .line 442
    :cond_e
    move v0, v4

    .line 443
    :goto_7
    packed-switch v0, :pswitch_data_1

    .line 444
    .line 445
    .line 446
    goto :goto_8

    .line 447
    :pswitch_3
    invoke-static {v6, v5, v11}, Ll/n3x;->x(Ljava/util/List;Ljava/lang/String;I)I

    .line 448
    .line 449
    .line 450
    move-result v0

    .line 451
    if-lt v0, v9, :cond_f

    .line 452
    .line 453
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 454
    .line 455
    goto :goto_8

    .line 456
    :pswitch_4
    invoke-static {v6, v5, v4}, Ll/n3x;->x(Ljava/util/List;Ljava/lang/String;I)I

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-ltz v0, :cond_f

    .line 461
    .line 462
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 463
    .line 464
    goto :goto_8

    .line 465
    :pswitch_5
    invoke-static {v6, v5, v4}, Ll/n3x;->x(Ljava/util/List;Ljava/lang/String;I)I

    .line 466
    .line 467
    .line 468
    move-result v0

    .line 469
    if-lt v0, v11, :cond_f

    .line 470
    .line 471
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 472
    .line 473
    goto :goto_8

    .line 474
    :pswitch_6
    invoke-static {v6, v5, v9}, Ll/n3x;->x(Ljava/util/List;Ljava/lang/String;I)I

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    if-lt v0, v14, :cond_f

    .line 479
    .line 480
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 481
    .line 482
    goto :goto_8

    .line 483
    :pswitch_7
    invoke-static {v6, v5, v14}, Ll/n3x;->x(Ljava/util/List;Ljava/lang/String;I)I

    .line 484
    .line 485
    .line 486
    move-result v0

    .line 487
    if-lt v0, v13, :cond_f

    .line 488
    .line 489
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 490
    .line 491
    :cond_f
    :goto_8
    iget-object v0, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 492
    .line 493
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    if-nez v0, :cond_10

    .line 498
    .line 499
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 500
    .line 501
    .line 502
    move v7, v11

    .line 503
    goto :goto_9

    .line 504
    :cond_10
    move v7, v4

    .line 505
    :goto_9
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 506
    .line 507
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 508
    .line 509
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 510
    .line 511
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result v0

    .line 515
    if-eqz v0, :cond_11

    .line 516
    .line 517
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 518
    .line 519
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 520
    .line 521
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 522
    .line 523
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 524
    .line 525
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 526
    .line 527
    .line 528
    move-result v0

    .line 529
    if-nez v0, :cond_11

    .line 530
    .line 531
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 532
    .line 533
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 534
    .line 535
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 536
    .line 537
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 538
    .line 539
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    check-cast v0, Ljava/lang/CharSequence;

    .line 544
    .line 545
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 546
    .line 547
    .line 548
    move-result v0

    .line 549
    if-nez v0, :cond_11

    .line 550
    .line 551
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 552
    .line 553
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 554
    .line 555
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 556
    .line 557
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 558
    .line 559
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    move-result-object v0

    .line 563
    check-cast v0, Ljava/lang/String;

    .line 564
    .line 565
    goto :goto_a

    .line 566
    :cond_11
    move-object v0, v10

    .line 567
    :goto_a
    const-string v18, "60-100w"

    .line 568
    .line 569
    const-string v19, "100w"

    .line 570
    .line 571
    const-string v12, "unlimited"

    .line 572
    .line 573
    const-string v13, "5w"

    .line 574
    .line 575
    const-string v14, "5-10w"

    .line 576
    .line 577
    const-string v15, "10-20w"

    .line 578
    .line 579
    const-string v16, "20-30w"

    .line 580
    .line 581
    const-string v17, "30-60w"

    .line 582
    .line 583
    filled-new-array/range {v12 .. v19}, [Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v12

    .line 587
    invoke-static {v12}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 588
    .line 589
    .line 590
    move-result-object v12

    .line 591
    const-string v18, "600000-1000000"

    .line 592
    .line 593
    const-string v19, "1000000-"

    .line 594
    .line 595
    const-string v13, "-50000"

    .line 596
    .line 597
    const-string v14, "50000-100000"

    .line 598
    .line 599
    const-string v15, "100000-200000"

    .line 600
    .line 601
    const-string v16, "200000-300000"

    .line 602
    .line 603
    const-string v17, "300000-600000"

    .line 604
    .line 605
    filled-new-array/range {v13 .. v19}, [Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v13

    .line 609
    invoke-static {v13}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 610
    .line 611
    .line 612
    move-result-object v13

    .line 613
    iget-object v14, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 614
    .line 615
    if-eqz v14, :cond_15

    .line 616
    .line 617
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 618
    .line 619
    if-eqz v14, :cond_15

    .line 620
    .line 621
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 622
    .line 623
    if-eqz v14, :cond_15

    .line 624
    .line 625
    iget-object v14, v14, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 626
    .line 627
    invoke-static {v14}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 628
    .line 629
    .line 630
    move-result v14

    .line 631
    if-nez v14, :cond_15

    .line 632
    .line 633
    iget-object v14, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 634
    .line 635
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 636
    .line 637
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 638
    .line 639
    iget-object v14, v14, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 640
    .line 641
    invoke-static {v14}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 642
    .line 643
    .line 644
    move-result v14

    .line 645
    if-nez v14, :cond_15

    .line 646
    .line 647
    iget-object v14, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 648
    .line 649
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 650
    .line 651
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 652
    .line 653
    iget-object v14, v14, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 654
    .line 655
    invoke-interface {v14, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 656
    .line 657
    .line 658
    move-result-object v14

    .line 659
    check-cast v14, Ljava/lang/String;

    .line 660
    .line 661
    :try_start_0
    iget-object v15, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 662
    .line 663
    iget-object v15, v15, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 664
    .line 665
    iget-object v15, v15, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 666
    .line 667
    iget-object v15, v15, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 668
    .line 669
    invoke-interface {v15, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 670
    .line 671
    .line 672
    move-result-object v15

    .line 673
    check-cast v15, Ljava/lang/String;

    .line 674
    .line 675
    invoke-static {v14}, Ll/n3x;->v(Ljava/lang/String;)Z

    .line 676
    .line 677
    .line 678
    move-result v16

    .line 679
    if-eqz v16, :cond_15

    .line 680
    .line 681
    invoke-static {v15}, Ll/n3x;->v(Ljava/lang/String;)Z

    .line 682
    .line 683
    .line 684
    move-result v16

    .line 685
    if-eqz v16, :cond_15

    .line 686
    .line 687
    move v8, v4

    .line 688
    :goto_b
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 689
    .line 690
    .line 691
    move-result v9

    .line 692
    if-ge v8, v9, :cond_13

    .line 693
    .line 694
    invoke-interface {v12, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 695
    .line 696
    .line 697
    move-result-object v9

    .line 698
    check-cast v9, Ljava/lang/CharSequence;

    .line 699
    .line 700
    invoke-static {v0, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 701
    .line 702
    .line 703
    move-result v9

    .line 704
    if-eqz v9, :cond_12

    .line 705
    .line 706
    goto :goto_c

    .line 707
    :cond_12
    add-int/lit8 v8, v8, 0x1

    .line 708
    .line 709
    goto :goto_b

    .line 710
    :catch_0
    move-exception v0

    .line 711
    move v8, v4

    .line 712
    goto :goto_d

    .line 713
    :cond_13
    const/4 v8, -0x1

    .line 714
    :goto_c
    if-eqz v8, :cond_14

    .line 715
    .line 716
    if-lez v8, :cond_15

    .line 717
    .line 718
    new-instance v0, Ljava/lang/StringBuilder;

    .line 719
    .line 720
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 721
    .line 722
    .line 723
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 724
    .line 725
    .line 726
    const-string v9, "-"

    .line 727
    .line 728
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 729
    .line 730
    .line 731
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    .line 733
    .line 734
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 735
    .line 736
    .line 737
    move-result-object v0

    .line 738
    sub-int/2addr v8, v11

    .line 739
    invoke-static {v13, v0, v8}, Ll/n3x;->x(Ljava/util/List;Ljava/lang/String;I)I

    .line 740
    .line 741
    .line 742
    move-result v0

    .line 743
    if-ne v0, v8, :cond_15

    .line 744
    .line 745
    :cond_14
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->INCOME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 746
    .line 747
    invoke-static {v0, v1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 748
    .line 749
    .line 750
    move-result-object v0

    .line 751
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 752
    .line 753
    .line 754
    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 755
    if-nez v8, :cond_15

    .line 756
    .line 757
    :try_start_1
    new-instance v8, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 758
    .line 759
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 760
    .line 761
    .line 762
    new-instance v9, Ljava/lang/StringBuilder;

    .line 763
    .line 764
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 765
    .line 766
    .line 767
    const-string v12, "\u5e74\u6536\u5165"

    .line 768
    .line 769
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 770
    .line 771
    .line 772
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 773
    .line 774
    .line 775
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 776
    .line 777
    .line 778
    move-result-object v0

    .line 779
    iput-object v0, v8, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 780
    .line 781
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 782
    .line 783
    .line 784
    move v0, v11

    .line 785
    goto :goto_e

    .line 786
    :catch_1
    move-exception v0

    .line 787
    move v8, v11

    .line 788
    :goto_d
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 789
    .line 790
    .line 791
    move v0, v8

    .line 792
    goto :goto_e

    .line 793
    :cond_15
    move v0, v4

    .line 794
    :goto_e
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 795
    .line 796
    const/16 v9, 0x12

    .line 797
    .line 798
    const/16 v12, 0xc8

    .line 799
    .line 800
    if-eqz v8, :cond_17

    .line 801
    .line 802
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 803
    .line 804
    if-eqz v8, :cond_17

    .line 805
    .line 806
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 807
    .line 808
    if-eqz v8, :cond_17

    .line 809
    .line 810
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 811
    .line 812
    if-eqz v8, :cond_17

    .line 813
    .line 814
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 815
    .line 816
    .line 817
    move-result v8

    .line 818
    if-nez v8, :cond_17

    .line 819
    .line 820
    :try_start_2
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 821
    .line 822
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 823
    .line 824
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 825
    .line 826
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 827
    .line 828
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 829
    .line 830
    .line 831
    move-result-object v8

    .line 832
    check-cast v8, Ljava/lang/String;

    .line 833
    .line 834
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 835
    .line 836
    .line 837
    move-result v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 838
    :catch_2
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 839
    .line 840
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 841
    .line 842
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 843
    .line 844
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 845
    .line 846
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 847
    .line 848
    .line 849
    move-result v8

    .line 850
    if-le v8, v11, :cond_17

    .line 851
    .line 852
    :try_start_3
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 853
    .line 854
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 855
    .line 856
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 857
    .line 858
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 859
    .line 860
    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 861
    .line 862
    .line 863
    move-result-object v8

    .line 864
    check-cast v8, Ljava/lang/CharSequence;

    .line 865
    .line 866
    invoke-static {v8, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 867
    .line 868
    .line 869
    move-result v8

    .line 870
    if-nez v8, :cond_17

    .line 871
    .line 872
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 873
    .line 874
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 875
    .line 876
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 877
    .line 878
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 879
    .line 880
    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 881
    .line 882
    .line 883
    move-result-object v8

    .line 884
    check-cast v8, Ljava/lang/CharSequence;

    .line 885
    .line 886
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 887
    .line 888
    .line 889
    move-result v8

    .line 890
    if-eqz v8, :cond_16

    .line 891
    .line 892
    goto :goto_f

    .line 893
    :cond_16
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 894
    .line 895
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 896
    .line 897
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 898
    .line 899
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 900
    .line 901
    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 902
    .line 903
    .line 904
    move-result-object v8

    .line 905
    check-cast v8, Ljava/lang/String;

    .line 906
    .line 907
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 908
    .line 909
    .line 910
    move-result v12
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 911
    :catch_3
    :cond_17
    :goto_f
    iget-object v8, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 912
    .line 913
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 914
    .line 915
    .line 916
    move-result v8

    .line 917
    if-lt v8, v9, :cond_18

    .line 918
    .line 919
    iget-object v8, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 920
    .line 921
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 922
    .line 923
    .line 924
    move-result v8

    .line 925
    if-gt v8, v12, :cond_18

    .line 926
    .line 927
    new-instance v8, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 928
    .line 929
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 930
    .line 931
    .line 932
    new-instance v9, Ljava/lang/StringBuilder;

    .line 933
    .line 934
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 935
    .line 936
    .line 937
    iget-object v10, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 938
    .line 939
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 940
    .line 941
    .line 942
    const-string v10, "\u5c81"

    .line 943
    .line 944
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    .line 946
    .line 947
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 948
    .line 949
    .line 950
    move-result-object v9

    .line 951
    iput-object v9, v8, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 952
    .line 953
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 954
    .line 955
    .line 956
    :cond_18
    iget-object v8, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 957
    .line 958
    if-eqz v8, :cond_1a

    .line 959
    .line 960
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 961
    .line 962
    if-eqz v8, :cond_1a

    .line 963
    .line 964
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 965
    .line 966
    if-eqz v8, :cond_1a

    .line 967
    .line 968
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 969
    .line 970
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 971
    .line 972
    .line 973
    move-result v8

    .line 974
    if-nez v8, :cond_1a

    .line 975
    .line 976
    iget-object v8, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 977
    .line 978
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 979
    .line 980
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 981
    .line 982
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 983
    .line 984
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 985
    .line 986
    .line 987
    move-result-object v8

    .line 988
    check-cast v8, Ljava/lang/CharSequence;

    .line 989
    .line 990
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 991
    .line 992
    .line 993
    move-result v8

    .line 994
    if-nez v8, :cond_1a

    .line 995
    .line 996
    iget-object v8, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 997
    .line 998
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 999
    .line 1000
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 1001
    .line 1002
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 1003
    .line 1004
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v8

    .line 1008
    check-cast v8, Ljava/lang/String;

    .line 1009
    .line 1010
    invoke-static {v8}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 1011
    .line 1012
    .line 1013
    move-result v9

    .line 1014
    if-eqz v9, :cond_1a

    .line 1015
    .line 1016
    const-string v9, "[0-9]*"

    .line 1017
    .line 1018
    invoke-static {v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v9

    .line 1022
    invoke-virtual {v9, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 1023
    .line 1024
    .line 1025
    move-result-object v9

    .line 1026
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->matches()Z

    .line 1027
    .line 1028
    .line 1029
    move-result v9

    .line 1030
    if-eqz v9, :cond_1a

    .line 1031
    .line 1032
    :try_start_4
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1033
    .line 1034
    .line 1035
    move-result v9

    .line 1036
    iget-object v10, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1037
    .line 1038
    iget-object v10, v10, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 1039
    .line 1040
    iget-object v10, v10, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 1041
    .line 1042
    iget-object v10, v10, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 1043
    .line 1044
    invoke-static {v10}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 1045
    .line 1046
    .line 1047
    move-result v12
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6

    .line 1048
    const/16 v13, 0x8c

    .line 1049
    .line 1050
    const/16 v14, 0xd2

    .line 1051
    .line 1052
    if-nez v12, :cond_19

    .line 1053
    .line 1054
    :try_start_5
    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v12

    .line 1058
    check-cast v12, Ljava/lang/String;

    .line 1059
    .line 1060
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1061
    .line 1062
    .line 1063
    move-result v13
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 1064
    :catch_4
    :try_start_6
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 1065
    .line 1066
    .line 1067
    move-result v12

    .line 1068
    if-le v12, v11, :cond_19

    .line 1069
    .line 1070
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v10

    .line 1074
    check-cast v10, Ljava/lang/String;

    .line 1075
    .line 1076
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1077
    .line 1078
    .line 1079
    move-result v14
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 1080
    :catch_5
    :cond_19
    if-lt v9, v13, :cond_1a

    .line 1081
    .line 1082
    if-gt v9, v14, :cond_1a

    .line 1083
    .line 1084
    :try_start_7
    new-instance v9, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 1085
    .line 1086
    invoke-direct {v9}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 1087
    .line 1088
    .line 1089
    new-instance v10, Ljava/lang/StringBuilder;

    .line 1090
    .line 1091
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 1092
    .line 1093
    .line 1094
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1095
    .line 1096
    .line 1097
    const-string v8, "cm"

    .line 1098
    .line 1099
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1100
    .line 1101
    .line 1102
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v8

    .line 1106
    iput-object v8, v9, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 1107
    .line 1108
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 1109
    .line 1110
    .line 1111
    goto :goto_10

    .line 1112
    :catch_6
    :cond_1a
    move v11, v4

    .line 1113
    :goto_10
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1114
    .line 1115
    if-eqz v8, :cond_1c

    .line 1116
    .line 1117
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 1118
    .line 1119
    if-eqz v8, :cond_1c

    .line 1120
    .line 1121
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 1122
    .line 1123
    if-eqz v8, :cond_1c

    .line 1124
    .line 1125
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 1126
    .line 1127
    if-eqz v8, :cond_1c

    .line 1128
    .line 1129
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 1130
    .line 1131
    .line 1132
    move-result v8

    .line 1133
    if-lez v8, :cond_1c

    .line 1134
    .line 1135
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1136
    .line 1137
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 1138
    .line 1139
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 1140
    .line 1141
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 1142
    .line 1143
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1144
    .line 1145
    .line 1146
    move-result-object v8

    .line 1147
    check-cast v8, Ljava/lang/CharSequence;

    .line 1148
    .line 1149
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1150
    .line 1151
    .line 1152
    move-result v8

    .line 1153
    if-nez v8, :cond_1c

    .line 1154
    .line 1155
    iget-object v8, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1156
    .line 1157
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 1158
    .line 1159
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 1160
    .line 1161
    iget-object v8, v8, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 1162
    .line 1163
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1164
    .line 1165
    .line 1166
    move-result-object v8

    .line 1167
    check-cast v8, Ljava/lang/String;

    .line 1168
    .line 1169
    new-instance v9, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 1170
    .line 1171
    invoke-direct {v9}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 1172
    .line 1173
    .line 1174
    const-string v10, "same_city"

    .line 1175
    .line 1176
    invoke-static {v8, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1177
    .line 1178
    .line 1179
    move-result v8

    .line 1180
    if-eqz v8, :cond_1c

    .line 1181
    .line 1182
    invoke-static {v3}, Ll/n3x;->p(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 1183
    .line 1184
    .line 1185
    move-result-object v3

    .line 1186
    invoke-static {v1}, Ll/n3x;->p(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v8

    .line 1190
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1191
    .line 1192
    .line 1193
    move-result v10

    .line 1194
    if-nez v10, :cond_1b

    .line 1195
    .line 1196
    invoke-static {v3, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1197
    .line 1198
    .line 1199
    move-result v8

    .line 1200
    if-eqz v8, :cond_1b

    .line 1201
    .line 1202
    iput-object v3, v9, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 1203
    .line 1204
    :cond_1b
    iget-object v3, v9, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 1205
    .line 1206
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1207
    .line 1208
    .line 1209
    move-result v3

    .line 1210
    if-nez v3, :cond_1c

    .line 1211
    .line 1212
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1213
    .line 1214
    .line 1215
    :cond_1c
    if-nez v7, :cond_1d

    .line 1216
    .line 1217
    invoke-static {v5}, Ll/n3x;->u(Ljava/lang/String;)Z

    .line 1218
    .line 1219
    .line 1220
    move-result v3

    .line 1221
    if-eqz v3, :cond_1d

    .line 1222
    .line 1223
    invoke-static {v6, v5, v4}, Ll/n3x;->x(Ljava/util/List;Ljava/lang/String;I)I

    .line 1224
    .line 1225
    .line 1226
    move-result v3

    .line 1227
    const/4 v6, 0x2

    .line 1228
    if-lt v3, v6, :cond_1d

    .line 1229
    .line 1230
    new-instance v3, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 1231
    .line 1232
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 1233
    .line 1234
    .line 1235
    iput-boolean v4, v3, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 1236
    .line 1237
    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 1238
    .line 1239
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1240
    .line 1241
    .line 1242
    :cond_1d
    if-nez v0, :cond_1e

    .line 1243
    .line 1244
    invoke-static {v1, v2, v4}, Ll/n3x;->c(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Z)V

    .line 1245
    .line 1246
    .line 1247
    :cond_1e
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFESSION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 1248
    .line 1249
    invoke-static {v0, v1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 1250
    .line 1251
    .line 1252
    move-result-object v0

    .line 1253
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1254
    .line 1255
    .line 1256
    move-result v3

    .line 1257
    if-nez v3, :cond_20

    .line 1258
    .line 1259
    const-string v3, "\u4e8b\u4e1a\u7f16"

    .line 1260
    .line 1261
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 1262
    .line 1263
    .line 1264
    move-result v3

    .line 1265
    if-nez v3, :cond_1f

    .line 1266
    .line 1267
    const-string v3, "\u516c\u52a1\u5458"

    .line 1268
    .line 1269
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 1270
    .line 1271
    .line 1272
    move-result v3

    .line 1273
    if-eqz v3, :cond_20

    .line 1274
    .line 1275
    :cond_1f
    new-instance v3, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 1276
    .line 1277
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 1278
    .line 1279
    .line 1280
    iput-boolean v4, v3, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 1281
    .line 1282
    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 1283
    .line 1284
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1285
    .line 1286
    .line 1287
    :cond_20
    invoke-static {v2, v1, v4}, Ll/n3x;->C(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Z)V

    .line 1288
    .line 1289
    .line 1290
    invoke-static {v2, v1, v4}, Ll/n3x;->E(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Z)V

    .line 1291
    .line 1292
    .line 1293
    if-nez v11, :cond_21

    .line 1294
    .line 1295
    invoke-static {v1, v2, v4}, Ll/n3x;->b(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Z)V

    .line 1296
    .line 1297
    .line 1298
    :cond_21
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 1299
    .line 1300
    .line 1301
    move-result v0

    .line 1302
    const/4 v1, 0x6

    .line 1303
    if-le v0, v1, :cond_22

    .line 1304
    .line 1305
    invoke-interface {v2, v4, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 1306
    .line 1307
    .line 1308
    move-result-object v2

    .line 1309
    :cond_22
    return-object v2

    .line 1310
    nop

    .line 1311
    :sswitch_data_0
    .sparse-switch
        -0x35c77bb8 -> :sswitch_2
        0x40e41bb4 -> :sswitch_1
        0x6c8ed5f4 -> :sswitch_0
    .end sparse-switch

    .line 1312
    .line 1313
    .line 1314
    .line 1315
    .line 1316
    .line 1317
    .line 1318
    .line 1319
    .line 1320
    .line 1321
    .line 1322
    .line 1323
    .line 1324
    .line 1325
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 1326
    .line 1327
    .line 1328
    .line 1329
    .line 1330
    .line 1331
    .line 1332
    .line 1333
    .line 1334
    .line 1335
    :sswitch_data_1
    .sparse-switch
        -0x4f106ee1 -> :sswitch_7
        -0x4072d59e -> :sswitch_6
        0x5e900f1e -> :sswitch_5
        0x708758e1 -> :sswitch_4
        0x7e487fae -> :sswitch_3
    .end sparse-switch

    .line 1336
    .line 1337
    .line 1338
    .line 1339
    .line 1340
    .line 1341
    .line 1342
    .line 1343
    .line 1344
    .line 1345
    .line 1346
    .line 1347
    .line 1348
    .line 1349
    .line 1350
    .line 1351
    .line 1352
    .line 1353
    .line 1354
    .line 1355
    .line 1356
    .line 1357
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public static u(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Zj:I

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    const-string v0, "Temporarily not revealed"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    const-string v0, "\u66ab\u4e0d\u900f\u9732"

    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    const-string v0, "\u6682\u4e0d\u900f\u9732"

    .line 40
    .line 41
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    const-string v0, "\u4e0d\u9650"

    .line 48
    .line 49
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    const-string v0, "\u6682\u65e0"

    .line 56
    .line 57
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const/4 p0, 0x1

    .line 65
    return p0

    .line 66
    :cond_2
    :goto_0
    return v1
.end method

.method public static v(Ljava/lang/String;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Zj:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const-string v0, "Temporarily not revealed"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string v0, "\u66ab\u4e0d\u900f\u9732"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string v0, "\u6682\u4e0d\u900f\u9732"

    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    const-string v0, "\u4e0d\u9650"

    .line 40
    .line 41
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    const-string v0, "\u6682\u65e0"

    .line 48
    .line 49
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public static w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->p4:Ll/wyd0;

    .line 6
    .line 7
    invoke-static {}, Ll/yab;->U()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/zwk;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const-string v1, "http://m.staging2.p1staff.com"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v1, "https://m.tantanapp.com"

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/marriage-activity-2024/index.html?speed=true&_bid=1004591&hideNavigationBar=1&hideNotch=1&from="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const/4 v8, 0x1

    .line 46
    const/4 v9, 0x0

    .line 47
    const-string v3, ""

    .line 48
    .line 49
    const/4 v5, 0x1

    .line 50
    const/4 v6, 0x1

    .line 51
    const/4 v7, 0x1

    .line 52
    move-object v2, p0

    .line 53
    invoke-static/range {v2 .. v9}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static x(Ljava/util/List;Ljava/lang/String;I)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_4

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-le p2, v0, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    if-gez p2, :cond_2

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-ge p2, v0, :cond_4

    .line 30
    .line 31
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/CharSequence;

    .line 36
    .line 37
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    return p2

    .line 44
    :cond_3
    add-int/lit8 p2, p2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_4
    :goto_1
    return v1
.end method

.method public static y(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 2
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/lang/String;

    .line 57
    .line 58
    new-instance v0, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 59
    .line 60
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v1, "same_city"

    .line 64
    .line 65
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    const-string p1, "\u4e0d\u63a5\u53d7\u5f02\u5730"

    .line 72
    .line 73
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    const-string v1, "different_city"

    .line 77
    .line 78
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    const-string p1, "\u53ef\u63a5\u53d7\u5f02\u5730"

    .line 85
    .line 86
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 87
    .line 88
    :cond_1
    :goto_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_2
    return-void
.end method

.method public static z(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 2
    .line 3
    const-string v1, "raw"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/nwb;->n(Lcom/p1/mobile/putong/data/Media;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method
