.class public final Ll/sjm0$a;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sjm0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/sjm0$a;",
        "Landroidx/viewpager2/adapter/FragmentStateAdapter;",
        "Landroidx/fragment/app/FragmentActivity;",
        "fragmentActivity",
        "<init>",
        "(Ll/sjm0;Landroidx/fragment/app/FragmentActivity;)V",
        "",
        "position",
        "Landroidx/fragment/app/Fragment;",
        "A",
        "(I)Landroidx/fragment/app/Fragment;",
        "getItemCount",
        "()I",
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
.field public final synthetic j:Ll/sjm0;


# direct methods
.method public constructor <init>(Ll/sjm0;Landroidx/fragment/app/FragmentActivity;)V
    .locals 0
    .param p1    # Ll/sjm0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentActivity;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Landroidx/viewpager2/adapter/FragmentStateAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public A(I)Landroidx/fragment/app/Fragment;
    .locals 9
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsFrag;->Companion:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsFrag$a;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-static {p0, p1, v0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsFrag$a;->b(Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsFrag$a;Ljava/lang/String;ILjava/lang/Object;)Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsFrag;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p1, Ll/rs9;->Companion:Ll/rs9$a;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/rs9$a;->h()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const-string v1, "hideNavigation"

    .line 19
    .line 20
    const-string v2, "fromDeeplink"

    .line 21
    .line 22
    const-string v3, "from"

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/sjm0;->k()Lcom/p1/mobile/putong/core/ui/visitor/VisitorsAct;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/sjm0;->k()Lcom/p1/mobile/putong/core/ui/visitor/VisitorsAct;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iget-object p0, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/sjm0;->k()Lcom/p1/mobile/putong/core/ui/visitor/VisitorsAct;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    sget-object v1, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->Companion:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag$a;

    .line 70
    .line 71
    invoke-virtual {v1, p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag$a;->a(Ljava/lang/String;ZZ)Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 77
    .line 78
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;-><init>()V

    .line 79
    .line 80
    .line 81
    new-instance v5, Landroid/os/Bundle;

    .line 82
    .line 83
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 84
    .line 85
    .line 86
    iget-object v6, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 87
    .line 88
    invoke-virtual {v6}, Ll/sjm0;->k()Lcom/p1/mobile/putong/core/ui/visitor/VisitorsAct;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    invoke-virtual {v6}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    invoke-virtual {v6, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    iget-object v7, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 101
    .line 102
    invoke-virtual {v7}, Ll/sjm0;->k()Lcom/p1/mobile/putong/core/ui/visitor/VisitorsAct;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    invoke-virtual {v7}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    invoke-virtual {v7, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    iget-object v8, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 115
    .line 116
    invoke-static {v8}, Ll/sjm0;->i(Ll/sjm0;)Ll/fjm0;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    if-eqz v8, :cond_2

    .line 121
    .line 122
    invoke-virtual {v8}, Ll/fjm0;->m0()Z

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    if-ne v8, v0, :cond_2

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_2
    move v0, v4

    .line 130
    :goto_0
    iget-object p0, p0, Ll/sjm0$a;->j:Ll/sjm0;

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/sjm0;->k()Lcom/p1/mobile/putong/core/ui/visitor/VisitorsAct;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    if-nez v4, :cond_3

    .line 149
    .line 150
    invoke-virtual {v5, v3, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    invoke-virtual {v5, v2, v7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 154
    .line 155
    .line 156
    const-string v2, "hasPermission"

    .line 157
    .line 158
    invoke-virtual {v5, v2, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v5, v1, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1, v5}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 165
    .line 166
    .line 167
    return-object p1
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method
