.class public final Ll/cs30$b;
.super Landroidx/viewpager2/widget/ViewPager2$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cs30;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/cs30$b",
        "Landroidx/viewpager2/widget/ViewPager2$i;",
        "",
        "position",
        "",
        "onPageSelected",
        "(I)V",
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
.field public final synthetic a:Ll/cs30;


# direct methods
.method public constructor <init>(Ll/cs30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(Ll/cs30;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Ll/cs30;->G(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/cs30;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Ll/cs30;->G(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cs30;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/cs30;->C(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 41
    .line 42
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 47
    .line 48
    iget-object v0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/cs30;->m()Z

    .line 51
    .line 52
    .line 53
    move-result v13

    .line 54
    const-string v4, "p_meet_view,e_popup,click"

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    const/4 v7, 0x0

    .line 58
    const/4 v8, -0x1

    .line 59
    const/4 v9, 0x0

    .line 60
    const/4 v10, 0x0

    .line 61
    const/4 v11, 0x0

    .line 62
    const/4 v12, 0x0

    .line 63
    invoke-interface/range {v2 .. v13}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Gd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;ILl/x20;Ll/x20;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, v0}, Ll/cs30;->E(Z)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    const-wide/16 v2, 0x3e8

    .line 74
    .line 75
    if-ne p1, v1, :cond_2

    .line 76
    .line 77
    invoke-static {}, Ll/t450;->j()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    iget-object v0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 92
    .line 93
    invoke-virtual {v0}, Ll/cs30;->e()Lcom/p1/mobile/putong/core/newui/newmeet/NewMeetAct;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    const/4 v9, 0x0

    .line 98
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 99
    .line 100
    const-string v6, "p_diamond_tab,e_popup,click"

    .line 101
    .line 102
    const/4 v7, 0x0

    .line 103
    const/4 v8, 0x0

    .line 104
    invoke-interface/range {v4 .. v10}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/cs30;->e()Lcom/p1/mobile/putong/core/newui/newmeet/NewMeetAct;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object p0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 114
    .line 115
    new-instance v4, Ll/ds30;

    .line 116
    .line 117
    invoke-direct {v4, p0}, Ll/ds30;-><init>(Ll/cs30;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v4, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    if-ne p1, v1, :cond_3

    .line 125
    .line 126
    iget-object v0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/cs30;->e()Lcom/p1/mobile/putong/core/newui/newmeet/NewMeetAct;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object p0, p0, Ll/cs30$b;->a:Ll/cs30;

    .line 133
    .line 134
    new-instance v4, Ll/es30;

    .line 135
    .line 136
    invoke-direct {v4, p0}, Ll/es30;-><init>(Ll/cs30;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v0, v4, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 140
    .line 141
    .line 142
    :cond_3
    :goto_0
    if-ne p1, v1, :cond_4

    .line 143
    .line 144
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->M5()V

    .line 149
    .line 150
    .line 151
    :cond_4
    return-void
.end method
