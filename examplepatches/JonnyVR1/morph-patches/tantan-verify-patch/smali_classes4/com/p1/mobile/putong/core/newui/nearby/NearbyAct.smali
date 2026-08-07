.class public final Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001bB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J%\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0014\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\u001a\u0010\u0015\u001a\u00020\u00108\u0006X\u0086D\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014R\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "<init>",
        "()V",
        "Landroid/view/MenuItem;",
        "item",
        "",
        "onOptionsItemSelected",
        "(Landroid/view/MenuItem;)Z",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "inflateView",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "",
        "c",
        "Ljava/lang/String;",
        "getFRAG_TAG",
        "()Ljava/lang/String;",
        "FRAG_TAG",
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "d",
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "frag",
        "Companion",
        "a",
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


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/app/PutongFrag;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->Companion:Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "nearby_frag_root"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->c:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static final X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->Companion:Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct$a;

    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct$a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p2, Ll/ddc0;->t:I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/view/View;->setId(I)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->c:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Ll/rs9;->Companion:Ll/rs9$a;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/rs9$a;->c()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const-string v2, "from"

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/supreme/hometab/SupremePartnerTabFrag;

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    check-cast v0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 43
    .line 44
    return-object p1

    .line 45
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/newui/supreme/hometab/SupremePartnerTabFrag;

    .line 46
    .line 47
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/supreme/hometab/SupremePartnerTabFrag;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v1, Landroid/os/Bundle;

    .line 51
    .line 52
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v3, "from_nearby_act"

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    sget v1, Ll/ddc0;->t:I

    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->c:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p2, v1, v0, v2}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Landroidx/fragment/app/k;->j()I

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 88
    .line 89
    return-object p1

    .line 90
    :cond_1
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    .line 91
    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    check-cast v0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 97
    .line 98
    return-object p1

    .line 99
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;->Companion:Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag$a;

    .line 100
    .line 101
    const/4 v1, 0x1

    .line 102
    const/4 v3, 0x0

    .line 103
    invoke-static {v0, v3, v1, v3}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag$a;->b(Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag$a;Ljava/lang/String;ILjava/lang/Object;)Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Landroid/os/Bundle;

    .line 108
    .line 109
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 110
    .line 111
    .line 112
    const-string v3, "hideNavigation"

    .line 113
    .line 114
    const/4 v4, 0x0

    .line 115
    invoke-virtual {v1, v3, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    invoke-virtual {v5, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-virtual {v1, v2, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    sget v1, Ll/ddc0;->t:I

    .line 147
    .line 148
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->c:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p2, v1, v0, v2}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2}, Landroidx/fragment/app/k;->j()I

    .line 154
    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/nearby/NearbyAct;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 157
    .line 158
    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1    # Landroid/view/MenuItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const v1, 0x102002c

    .line 9
    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method
