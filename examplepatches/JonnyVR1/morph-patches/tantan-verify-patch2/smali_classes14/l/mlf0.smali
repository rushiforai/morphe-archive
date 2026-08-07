.class public final Ll/mlf0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mlf0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/plf0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u00192\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0016B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\tJ\u0017\u0010\r\u001a\u00020\u00072\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\tJ\u001b\u0010\u0013\u001a\u00020\u00072\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0010\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/mlf0;",
        "Ll/ar2;",
        "Ll/plf0;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "k0",
        "()V",
        "a0",
        "Landroid/os/Bundle;",
        "sis",
        "j0",
        "(Landroid/os/Bundle;)V",
        "destroy",
        "",
        "",
        "selectList",
        "l0",
        "(Ljava/util/List;)V",
        "Lcom/p1/mobile/putong/data/SignUpData;",
        "a",
        "Lcom/p1/mobile/putong/data/SignUpData;",
        "data",
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
.field public static final Companion:Ll/mlf0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:Lcom/p1/mobile/putong/data/SignUpData;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/mlf0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/mlf0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/mlf0;->Companion:Ll/mlf0$a;

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

.method public static e0(Ll/mlf0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/plf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/plf0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f0(Ll/mlf0;Ljava/lang/Throwable;)V
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

.method public static g0(Ll/mlf0;Ll/uxj0;)V
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
    check-cast v0, Ll/plf0;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

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

.method public static h0(Ll/mlf0;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

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
    if-eqz v0, :cond_3

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_3
    move-object v0, v1

    .line 43
    :goto_1
    iget-object v2, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    if-eqz v2, :cond_5

    .line 47
    .line 48
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    if-eqz v4, :cond_4

    .line 51
    .line 52
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    if-eqz v4, :cond_4

    .line 57
    .line 58
    iget-object v4, v4, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 59
    .line 60
    if-eqz v4, :cond_4

    .line 61
    .line 62
    iget-object v4, v4, Lcom/p1/mobile/putong/data/IntlMoreGender;->showOnProfile:Ljava/lang/Boolean;

    .line 63
    .line 64
    if-eqz v4, :cond_4

    .line 65
    .line 66
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    move v4, v3

    .line 72
    :goto_2
    iput-boolean v4, v2, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 73
    .line 74
    :cond_5
    iget-object v2, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 75
    .line 76
    if-eqz v2, :cond_6

    .line 77
    .line 78
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 79
    .line 80
    iput-object v4, v2, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 81
    .line 82
    :cond_6
    if-eqz v2, :cond_7

    .line 83
    .line 84
    iput-object v0, v2, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 85
    .line 86
    :cond_7
    if-eqz v2, :cond_9

    .line 87
    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 89
    .line 90
    if-eqz v0, :cond_8

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 93
    .line 94
    if-eqz v0, :cond_8

    .line 95
    .line 96
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 97
    .line 98
    :cond_8
    iput-object v1, v2, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 99
    .line 100
    :cond_9
    if-eqz v2, :cond_b

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 103
    .line 104
    if-eqz p1, :cond_a

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 107
    .line 108
    if-eqz p1, :cond_a

    .line 109
    .line 110
    iget v3, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 111
    .line 112
    :cond_a
    iput v3, v2, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 113
    .line 114
    :cond_b
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->R0()Ll/wyd0;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    check-cast p1, Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_d

    .line 131
    .line 132
    iget-object v0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 133
    .line 134
    if-eqz v0, :cond_c

    .line 135
    .line 136
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 137
    .line 138
    :cond_c
    if-eqz v0, :cond_d

    .line 139
    .line 140
    const-string p1, "image/jpeg"

    .line 141
    .line 142
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 143
    .line 144
    :cond_d
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 145
    .line 146
    iget-object p0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 147
    .line 148
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 149
    .line 150
    .line 151
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

.method private final k0()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

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
    check-cast v0, Ll/plf0;

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
    new-instance v1, Ll/hlf0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/hlf0;-><init>(Ll/mlf0;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/ilf0;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/ilf0;-><init>()V

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


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/jlf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jlf0;-><init>(Ll/mlf0;)V

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

.method public final j0(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "signup_data"

    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    instance-of v2, p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object p1, v0

    .line 18
    :goto_0
    iput-object p1, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 19
    .line 20
    :cond_1
    iget-object p1, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 21
    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p1, Ll/plf0;

    .line 27
    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/plf0;->e()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    instance-of v1, p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 47
    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    move-object v0, p1

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 52
    .line 53
    :cond_2
    iput-object v0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 56
    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    invoke-direct {p0}, Ll/mlf0;->k0()V

    .line 60
    .line 61
    .line 62
    :cond_4
    return-void
.end method

.method public final l0(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-direct {p0}, Ll/mlf0;->k0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->intlFriendPurpose:Ljava/util/List;

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->intlFriendPurposeSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 26
    .line 27
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 28
    .line 29
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Ll/mlf0;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-static {v0, v1}, Ll/ike;->q(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    new-instance v0, Ll/klf0;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/klf0;-><init>(Ll/mlf0;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ll/llf0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/llf0;-><init>(Ll/mlf0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    :cond_3
    return-void
.end method
