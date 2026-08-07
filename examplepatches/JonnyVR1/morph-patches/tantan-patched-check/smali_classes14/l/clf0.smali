.class public final Ll/clf0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/clf0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/flf0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 %2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u001eB\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u00072\u0008\u0010\u000b\u001a\u0004\u0018\u00010\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\tJ%\u0010\u0014\u001a\u00020\u00072\u000e\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u000f2\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0015\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\tJ\u000f\u0010\u0019\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\tJ\'\u0010\u001b\u001a\u00020\u001a2\u000e\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u000f2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cR\u0018\u0010 \u001a\u0004\u0018\u00010\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001fR\"\u0010\u0013\u001a\u00020\u00128\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008!\u0010\"\u001a\u0004\u0008\u0013\u0010#\"\u0004\u0008$\u0010\u0017\u00a8\u0006&"
    }
    d2 = {
        "Ll/clf0;",
        "Ll/ar2;",
        "Ll/flf0;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "a0",
        "()V",
        "Landroid/os/Bundle;",
        "sis",
        "m0",
        "(Landroid/os/Bundle;)V",
        "destroy",
        "",
        "",
        "selectedList",
        "",
        "isLanguage",
        "o0",
        "(Ljava/util/List;Z)V",
        "p0",
        "(Z)V",
        "n0",
        "q0",
        "Lcom/p1/mobile/putong/data/Profile;",
        "l0",
        "(Ljava/util/List;Z)Lcom/p1/mobile/putong/data/Profile;",
        "Lcom/p1/mobile/putong/data/SignUpData;",
        "a",
        "Lcom/p1/mobile/putong/data/SignUpData;",
        "data",
        "b",
        "Z",
        "()Z",
        "setLanguage",
        "Companion",
        "b_account_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Ll/clf0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:Lcom/p1/mobile/putong/data/SignUpData;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/clf0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/clf0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/clf0;->Companion:Ll/clf0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
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
    return-void
.end method

.method public static e0(Ll/clf0;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/flf0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/flf0;->s(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static f0(Ll/clf0;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move-object v2, v1

    .line 23
    :goto_0
    iput-object v2, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_3
    move-object v0, v1

    .line 39
    :goto_1
    const/4 v2, 0x0

    .line 40
    if-eqz v0, :cond_6

    .line 41
    .line 42
    iget-object v0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 43
    .line 44
    if-eqz v0, :cond_5

    .line 45
    .line 46
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 47
    .line 48
    if-eqz v3, :cond_4

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    if-eqz v3, :cond_4

    .line 55
    .line 56
    iget-object v3, v3, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 57
    .line 58
    if-eqz v3, :cond_4

    .line 59
    .line 60
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IntlMoreGender;->showOnProfile:Ljava/lang/Boolean;

    .line 61
    .line 62
    if-eqz v3, :cond_4

    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    goto :goto_2

    .line 69
    :cond_4
    move v3, v2

    .line 70
    :goto_2
    iput-boolean v3, v0, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 71
    .line 72
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_6
    move-object v0, v1

    .line 87
    :goto_3
    iget-object v3, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 88
    .line 89
    if-eqz v3, :cond_7

    .line 90
    .line 91
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 92
    .line 93
    iput-object v4, v3, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 94
    .line 95
    :cond_7
    if-eqz v3, :cond_8

    .line 96
    .line 97
    iput-object v0, v3, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 98
    .line 99
    :cond_8
    if-eqz v3, :cond_a

    .line 100
    .line 101
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 102
    .line 103
    if-eqz v0, :cond_9

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 106
    .line 107
    if-eqz v0, :cond_9

    .line 108
    .line 109
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 110
    .line 111
    :cond_9
    iput-object v1, v3, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 112
    .line 113
    :cond_a
    if-eqz v3, :cond_c

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 116
    .line 117
    if-eqz p1, :cond_b

    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 120
    .line 121
    if-eqz p1, :cond_b

    .line 122
    .line 123
    iget v2, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 124
    .line 125
    :cond_b
    iput v2, v3, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 126
    .line 127
    :cond_c
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->R0()Ll/wyd0;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_e

    .line 144
    .line 145
    iget-object v0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 146
    .line 147
    if-eqz v0, :cond_d

    .line 148
    .line 149
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 150
    .line 151
    :cond_d
    if-eqz v0, :cond_e

    .line 152
    .line 153
    const-string p1, "image/jpeg"

    .line 154
    .line 155
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 156
    .line 157
    :cond_e
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 158
    .line 159
    iget-object p0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 160
    .line 161
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public static g0(Ll/clf0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j0(Ll/clf0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/flf0;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/clf0;->b:Z

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/flf0;->n(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static k0(Ll/clf0;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/flf0;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/cp;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/zkf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zkf0;-><init>(Ll/clf0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final l0(Ljava/util/List;Z)Lcom/p1/mobile/putong/data/Profile;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/p1/mobile/putong/data/Profile;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/data/Extensions;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 25
    .line 26
    iput-object p1, p2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 30
    .line 31
    iput-object p1, p2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 32
    .line 33
    return-object p0
.end method

.method public final m0(Landroid/os/Bundle;)V
    .locals 6
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "signup_language"

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const-string v3, "signup_data"

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    instance-of v5, v4, Lcom/p1/mobile/putong/data/SignUpData;

    .line 14
    .line 15
    if-eqz v5, :cond_0

    .line 16
    .line 17
    check-cast v4, Lcom/p1/mobile/putong/data/SignUpData;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object v4, v2

    .line 21
    :goto_0
    iput-object v4, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 22
    .line 23
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput-boolean p1, p0, Ll/clf0;->b:Z

    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 30
    .line 31
    if-nez p1, :cond_3

    .line 32
    .line 33
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/flf0;

    .line 36
    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/flf0;->f()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    instance-of v4, v3, Lcom/p1/mobile/putong/data/SignUpData;

    .line 56
    .line 57
    if-eqz v4, :cond_2

    .line 58
    .line 59
    move-object v2, v3

    .line 60
    check-cast v2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 61
    .line 62
    :cond_2
    iput-object v2, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 63
    .line 64
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput-boolean p1, p0, Ll/clf0;->b:Z

    .line 69
    .line 70
    :cond_3
    iget-boolean p1, p0, Ll/clf0;->b:Z

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    sget-object p1, Ll/mdp;->INSTANCE:Ll/mdp;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/mdp;->h()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_4

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/clf0;->q0()V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object p1, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 90
    .line 91
    if-nez p1, :cond_5

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/clf0;->n0()V

    .line 94
    .line 95
    .line 96
    :cond_5
    return-void
.end method

.method public final n0()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 7
    .line 8
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/ike;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Ll/flf0;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    new-instance v1, Ll/xkf0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/xkf0;-><init>(Ll/clf0;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/ykf0;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/ykf0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public final o0(Ljava/util/List;Z)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clf0;->n0()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    if-eqz v0, :cond_3

    .line 10
    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->language:Ljava/util/List;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->ethnicity:Ljava/util/List;

    .line 17
    .line 18
    :goto_0
    if-eqz p2, :cond_2

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->languageSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->ethnicitySaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 24
    .line 25
    :goto_1
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 26
    .line 27
    :cond_3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_4

    .line 32
    .line 33
    iget-object p2, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-static {p2, v0}, Ll/ike;->q(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    new-instance p2, Ll/alf0;

    .line 47
    .line 48
    invoke-direct {p2, p0}, Ll/alf0;-><init>(Ll/clf0;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/blf0;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/blf0;-><init>(Ll/clf0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    :cond_4
    return-void
.end method

.method public final p0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "verified"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "language-saved"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, "ethnicity-saved"

    .line 17
    .line 18
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, v1, p1}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Ll/clf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 36
    .line 37
    invoke-static {p1, p0}, Ll/cp;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public final q0()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/clf0;->l0(Ljava/util/List;Z)Lcom/p1/mobile/putong/data/Profile;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v2, v0, v3}, Lcom/p1/mobile/putong/account/api/a;->h1(Lcom/p1/mobile/putong/data/Profile;Lcom/p1/mobile/putong/data/StepSignupStage;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    new-instance v1, Ll/vkf0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/vkf0;-><init>(Ll/clf0;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Ll/wkf0;

    .line 36
    .line 37
    invoke-direct {p0}, Ll/wkf0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
