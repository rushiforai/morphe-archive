.class public Ll/wrf0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/p1/mobile/putong/data/SwipeExcites;


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

.method public static a(I)Z
    .locals 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 8
    .line 9
    iget v0, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->timestamp:I

    .line 10
    .line 11
    sub-int/2addr p0, v0

    .line 12
    if-gez p0, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    const v0, 0x15180

    .line 16
    .line 17
    .line 18
    div-int/2addr p0, v0

    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 28
    .line 29
    const-string v2, "male"

    .line 30
    .line 31
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MaleRule;->slideCardsAndRewards:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    sub-int/2addr v0, v2

    .line 51
    if-lt v0, p0, :cond_3

    .line 52
    .line 53
    return v2

    .line 54
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 63
    .line 64
    const-string v3, "female"

    .line 65
    .line 66
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MaleRule;->slideCardsAndRewards:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    sub-int/2addr v0, v2

    .line 85
    if-lt v0, p0, :cond_3

    .line 86
    .line 87
    return v2

    .line 88
    :cond_3
    :goto_0
    return v1
.end method

.method public static b()J
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wrf0;->k(I)Ljava/lang/Long;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    return-wide v0
.end method

.method public static c()I
    .locals 1

    .line 1
    invoke-static {}, Ll/wrf0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, Ll/wrf0;->e()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {v0}, Ll/wrf0;->d(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    return v0
.end method

.method public static d(I)Ljava/lang/Integer;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    if-gez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    sget-object v1, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    sget-object v1, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    sget-object v1, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    sget-object v1, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/FemaleRule;->rewardsCardsNumber:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    sget-object v1, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/data/FemaleRule;->rewardsCardsNumber:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-le v1, p0, :cond_1

    .line 66
    .line 67
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/FemaleRule;->rewardsCardsNumber:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Ljava/lang/Integer;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_1
    return-object v0
.end method

.method public static e()I
    .locals 6

    .line 1
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-static {}, Ll/pzi0;->n()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    const-wide/16 v4, 0x3e8

    .line 16
    .line 17
    div-long/2addr v2, v4

    .line 18
    long-to-int v0, v2

    .line 19
    sget-object v2, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 22
    .line 23
    iget v2, v2, Lcom/p1/mobile/putong/data/SwipeConfig;->timestamp:I

    .line 24
    .line 25
    sub-int/2addr v0, v2

    .line 26
    if-gez v0, :cond_1

    .line 27
    .line 28
    const/4 v0, -0x1

    .line 29
    return v0

    .line 30
    :cond_1
    const v2, 0x15180

    .line 31
    .line 32
    .line 33
    div-int/2addr v0, v2

    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 43
    .line 44
    const-string v3, "male"

    .line 45
    .line 46
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    sget-object v2, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/data/MaleRule;->slideCardsAndRewards:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 68
    .line 69
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 74
    .line 75
    const-string v3, "female"

    .line 76
    .line 77
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_3

    .line 82
    .line 83
    sget-object v2, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 86
    .line 87
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/p1/mobile/putong/data/MaleRule;->slideCardsAndRewards:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    goto :goto_0

    .line 96
    :cond_3
    const/4 v2, 0x0

    .line 97
    :goto_0
    add-int/lit8 v2, v2, -0x1

    .line 98
    .line 99
    if-lt v2, v0, :cond_4

    .line 100
    .line 101
    return v0

    .line 102
    :cond_4
    :goto_1
    return v1
.end method

.method public static f()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->l()Ljava/util/List;

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
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/pk50;->l()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/pk50;->l()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 43
    .line 44
    sput-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 53
    .line 54
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->taskSwitch:Z

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    return v0

    .line 60
    :cond_0
    const/4 v0, 0x0

    .line 61
    sput-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 62
    .line 63
    :cond_1
    return v1
.end method

.method public static g()Z
    .locals 2

    .line 1
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/wrf0;->f()Z

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 17
    .line 18
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->taskSwitch:Z

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeExcites;->swipeConfig:Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 23
    .line 24
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->swipeStimulationOn:Z

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    return v0

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    return v0
.end method

.method public static h()Z
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

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
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 25
    .line 26
    const-string v2, "female"

    .line 27
    .line 28
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {}, Ll/wrf0;->b()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-static {}, Ll/wrf0;->c()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    int-to-long v4, v0

    .line 43
    cmp-long v0, v2, v4

    .line 44
    .line 45
    if-gez v0, :cond_0

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    return v0

    .line 49
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 52
    .line 53
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U1:Z

    .line 54
    .line 55
    :cond_1
    return v1
.end method

.method public static i()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->n()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    long-to-int v0, v0

    .line 9
    invoke-static {v0}, Ll/wrf0;->a(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static j()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/wrf0;->a:Lcom/p1/mobile/putong/data/SwipeExcites;

    .line 3
    .line 4
    return-void
.end method

.method public static k(I)Ljava/lang/Long;
    .locals 7

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->b1:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const-wide/16 v2, 0x1

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    if-ne v4, p0, :cond_0

    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d1:Ll/byd0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ljava/lang/Long;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    add-long/2addr v0, v2

    .line 59
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d1:Ll/byd0;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Ljava/lang/Long;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->b1:Ll/wyd0;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d1:Ll/byd0;

    .line 93
    .line 94
    const-wide/16 v5, 0x0

    .line 95
    .line 96
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    if-ne v4, p0, :cond_2

    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d1:Ll/byd0;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/lang/Long;

    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 118
    .line 119
    .line 120
    move-result-wide v0

    .line 121
    add-long/2addr v0, v2

    .line 122
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d1:Ll/byd0;

    .line 134
    .line 135
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    check-cast p0, Ljava/lang/Long;

    .line 140
    .line 141
    return-object p0
.end method
