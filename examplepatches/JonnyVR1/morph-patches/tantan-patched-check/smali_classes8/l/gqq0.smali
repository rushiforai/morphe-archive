.class public final Ll/gqq0;
.super Ll/ij2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ij2<",
        "Ll/mqq0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013R\u0017\u0010\u0018\u001a\u00020\u00148\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/gqq0;",
        "Ll/ij2;",
        "Ll/mqq0;",
        "Ll/pej0;",
        "dlg",
        "Ll/s1e;",
        "lifecycleProvider",
        "<init>",
        "(Ll/pej0;Ll/s1e;)V",
        "",
        "e",
        "()V",
        "Lcom/p1/mobile/putong/core/data/MemberZoneFilter;",
        "editData",
        "f",
        "(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V",
        "c",
        "Ll/pej0;",
        "d",
        "()Ll/pej0;",
        "Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "act",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final c:Ll/pej0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/pej0;Ll/s1e;)V
    .locals 0
    .param p1    # Ll/pej0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/s1e;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/ij2;-><init>(Ll/s1e;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/gqq0;->c:Ll/pej0;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/pej0;->s()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    iput-object p1, p0, Ll/gqq0;->d:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    return-void
.end method

.method public static c(Ll/gqq0;Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mqq0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/mqq0;->B(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final d()Ll/pej0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gqq0;->c:Ll/pej0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()V
    .locals 2

    .line 1
    sget-object v0, Ll/eqq0;->Companion:Ll/eqq0$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/eqq0$a;->c()Ll/eqq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eqq0;->h()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/fqq0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/fqq0;-><init>(Ll/gqq0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V
    .locals 11
    .param p1    # Lcom/p1/mobile/putong/core/data/MemberZoneFilter;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/eqq0;->Companion:Ll/eqq0$a;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/eqq0$a;->c()Ll/eqq0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v1, v2}, Ll/eqq0;->p(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/eqq0$a;->c()Ll/eqq0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p1}, Ll/eqq0;->o(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V

    .line 19
    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->max_age:I

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "suggest_see_user_search_max_age"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->min_age:I

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "suggest_see_user_search_min_age"

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->radius:I

    .line 46
    .line 47
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "suggest_see_user_search_radius"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->realFace:Z

    .line 58
    .line 59
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "advanced_filter_real"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->popular:Z

    .line 70
    .line 71
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v1, "advanced_filter_pop"

    .line 76
    .line 77
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->matched:Z

    .line 82
    .line 83
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "advanced_filter_matched"

    .line 88
    .line 89
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->richMedia:Z

    .line 94
    .line 95
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v1, "advanced_filter_rich_info"

    .line 100
    .line 101
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->online:Z

    .line 106
    .line 107
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const-string v1, "advanced_filter_online"

    .line 112
    .line 113
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->certification:Z

    .line 118
    .line 119
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const-string v0, "advanced_filter_real_name"

    .line 124
    .line 125
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object v10

    .line 129
    filled-new-array/range {v2 .. v10}, [Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    const-string v0, "e_save_filter_value"

    .line 134
    .line 135
    const-string v1, "p_advanced_filter_page"

    .line 136
    .line 137
    invoke-static {v0, v1, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Ll/gqq0;->c:Ll/pej0;

    .line 141
    .line 142
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 143
    .line 144
    .line 145
    return-void
.end method
