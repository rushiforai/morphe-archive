.class public final Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0010 \n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\tJ\r\u0010\u000b\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\tJ\r\u0010\u000c\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u000c\u0010\tJ\u001d\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\r\u0010\u0013\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0013\u0010\tR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017R*\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\u00188\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0019\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001e\u00a8\u0006 "
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;",
        "Ll/ar2;",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;",
        "frag",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V",
        "",
        "a0",
        "()V",
        "destroy",
        "p0",
        "r0",
        "Ll/y6b$a;",
        "supremeSuggestData",
        "",
        "hasSupremePartner",
        "n0",
        "(Ll/y6b$a;Z)V",
        "q0",
        "a",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;",
        "o0",
        "()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;",
        "",
        "b",
        "Ljava/util/List;",
        "getUserList",
        "()Ljava/util/List;",
        "setUserList",
        "(Ljava/util/List;)V",
        "userList",
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
.field public final a:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Ll/y6b$a;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->a:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;

    .line 8
    .line 9
    return-void
.end method

.method public static e0(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->b:Ljava/util/List;

    .line 2
    .line 3
    check-cast p1, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->G()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static f0(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;Lkotlin/Triple;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->F(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/joa;->O3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p1}, Lkotlin/Triple;->getThird()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->hasIdealTypesSelected()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x1

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 31
    .line 32
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->E(ZZ)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    check-cast v0, Landroid/util/Pair;

    .line 44
    .line 45
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Ljava/util/Collection;

    .line 48
    .line 49
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    check-cast p1, Landroid/util/Pair;

    .line 63
    .line 64
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast p1, Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->C()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 83
    .line 84
    invoke-virtual {p0, v2, v2}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->E(ZZ)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    check-cast v0, Landroid/util/Pair;

    .line 96
    .line 97
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v0, Ljava/util/List;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->b:Ljava/util/List;

    .line 102
    .line 103
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 104
    .line 105
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 106
    .line 107
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    check-cast p1, Landroid/util/Pair;

    .line 115
    .line 116
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    .line 120
    .line 121
    check-cast p1, Ljava/util/List;

    .line 122
    .line 123
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->B(Ljava/util/List;Z)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 132
    .line 133
    .line 134
    check-cast v0, Landroid/util/Pair;

    .line 135
    .line 136
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast v0, Ljava/util/Collection;

    .line 139
    .line 140
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_4

    .line 145
    .line 146
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 147
    .line 148
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 149
    .line 150
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->E(ZZ)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_4
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    .line 160
    .line 161
    check-cast v0, Landroid/util/Pair;

    .line 162
    .line 163
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 164
    .line 165
    check-cast v0, Ljava/util/List;

    .line 166
    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->b:Ljava/util/List;

    .line 168
    .line 169
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 170
    .line 171
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 172
    .line 173
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    .line 179
    .line 180
    check-cast p1, Landroid/util/Pair;

    .line 181
    .line 182
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 183
    .line 184
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    .line 186
    .line 187
    check-cast p1, Ljava/util/List;

    .line 188
    .line 189
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->B(Ljava/util/List;Z)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public static g0(Lkotlin/jvm/functions/Function3;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Triple;
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2, p3}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lkotlin/Triple;

    .line 6
    .line 7
    return-object p0
.end method

.method public static h0(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->J()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static i0(Ll/pf60;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/y6b;->H3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static j0(Lkotlin/jvm/functions/Function2;Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/pf60;

    .line 6
    .line 7
    return-object p0
.end method

.method public static k0(Lcom/p1/mobile/putong/core/data/UserPrivilege;Landroid/util/Pair;Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;)Lkotlin/Triple;
    .locals 1

    .line 1
    new-instance v0, Lkotlin/Triple;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static l0(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static m0(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->b:Ljava/util/List;

    .line 2
    .line 3
    check-cast p1, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->G()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v8h0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/v8h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/w8h0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/w8h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 20
    .line 21
    const-string v1, "supremePartner"

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/y6b;->v3()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget-object v3, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter$initSubscription$3;->INSTANCE:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter$initSubscription$3;

    .line 44
    .line 45
    new-instance v4, Ll/x8h0;

    .line 46
    .line 47
    invoke-direct {v4, v3}, Ll/x8h0;-><init>(Lkotlin/jvm/functions/Function2;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v2, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v2, Ll/y8h0;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/y8h0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 73
    .line 74
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 89
    .line 90
    invoke-virtual {v1}, Ll/y6b;->N3()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 97
    .line 98
    invoke-virtual {v2}, Ll/y6b;->t3()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    new-instance v3, Ll/z8h0;

    .line 103
    .line 104
    invoke-direct {v3}, Ll/z8h0;-><init>()V

    .line 105
    .line 106
    .line 107
    new-instance v4, Ll/a9h0;

    .line 108
    .line 109
    invoke-direct {v4, v3}, Ll/a9h0;-><init>(Lkotlin/jvm/functions/Function3;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0, v1, v2, v4}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/b9h0;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/b9h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;)V

    .line 123
    .line 124
    .line 125
    new-instance v2, Ll/c9h0;

    .line 126
    .line 127
    invoke-direct {v2, p0}, Ll/c9h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/y6b;->M3()Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/d9h0;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/d9h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final n0(Ll/y6b$a;Z)V
    .locals 2
    .param p1    # Ll/y6b$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->a:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;->pageId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object v0, p1, Ll/y6b$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "other_user_id"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {v0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "e_custom_card"

    .line 27
    .line 28
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->a:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;

    .line 40
    .line 41
    iget-object p1, p1, Ll/y6b$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->an(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/data/User;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->q0()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final o0()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->a:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->b:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->F(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/y6b;->H3()Lrx/c;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final q0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/y6b;->w3(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final r0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
