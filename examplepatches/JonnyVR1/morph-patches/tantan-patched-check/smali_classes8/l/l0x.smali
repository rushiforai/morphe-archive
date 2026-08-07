.class public Ll/l0x;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/i0x;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VFrame;

.field public g:Lv/VEditText;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Lcom/p1/mobile/putong/core/ui/view/AboutMeNewCaseLayout;

.field public k:Lv/VLinear;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:I

.field public o:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hzw;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/l0x;->n:I

    .line 6
    .line 7
    iput p1, p0, Ll/l0x;->o:I

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic j(Ll/l0x;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/l0x;->s(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic k(Ll/l0x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l0x;->u()V

    return-void
.end method

.method public static bridge synthetic l(Ll/l0x;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/l0x;->n:I

    return p0
.end method

.method public static bridge synthetic m(Ll/l0x;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l0x;->v(ILjava/lang/String;)V

    return-void
.end method

.method private synthetic u()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/l0x;->g:Lv/VEditText;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-lez v0, :cond_0

    .line 38
    .line 39
    iget-object p0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void

    .line 53
    :catch_0
    move-exception p0

    .line 54
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    iget-object p2, p0, Ll/l0x;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iget-object p2, p0, Ll/l0x;->g:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    iget p0, p0, Ll/l0x;->o:I

    .line 32
    .line 33
    if-ge p2, p0, :cond_1

    .line 34
    .line 35
    sget-object p2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_ABOUT_ME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 36
    .line 37
    if-ne p1, p2, :cond_0

    .line 38
    .line 39
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "\u8bf7\u81f3\u5c11\u7528%d\u4e2a\u5b57\u4ecb\u7ecd\u4e00\u4e0b\u4f60\u81ea\u5df1"

    .line 48
    .line 49
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "\u8bf7\u81f3\u5c11\u586b\u5199%d\u4e2a\u5b57\uff0c\u8bf7\u52ff\u51d1\u5b57\u6570\u6216\u586b\u5199\u65e0\u5173\u5185\u5bb9"

    .line 66
    .line 67
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    const/4 p0, 0x0

    .line 75
    return p0

    .line 76
    :cond_1
    const/4 p0, 0x1

    .line 77
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/l0x;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->NICK_NAME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    invoke-super {p0, p1}, Ll/hzw;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p0, ""

    .line 45
    .line 46
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->nullCheck()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Profile;->nullCheck()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Extensions;->nullCheck()V

    .line 59
    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->DECLARATION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 62
    .line 63
    if-ne p1, v0, :cond_1

    .line 64
    .line 65
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->nullCheck()V

    .line 72
    .line 73
    .line 74
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 79
    .line 80
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->declaration:Ljava/util/List;

    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->FAMILY_BACKGROUND:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 88
    .line 89
    if-ne p1, v0, :cond_2

    .line 90
    .line 91
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->nullCheck()V

    .line 98
    .line 99
    .line 100
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 105
    .line 106
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->BRIDE_PRICE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 114
    .line 115
    if-ne p1, v0, :cond_3

    .line 116
    .line 117
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->nullCheck()V

    .line 124
    .line 125
    .line 126
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 129
    .line 130
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 131
    .line 132
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->NICK_NAME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 140
    .line 141
    if-ne p1, v0, :cond_4

    .line 142
    .line 143
    iput-object p0, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 144
    .line 145
    return-void

    .line 146
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROLOGUE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 147
    .line 148
    if-ne p1, v0, :cond_5

    .line 149
    .line 150
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->nullCheck()V

    .line 157
    .line 158
    .line 159
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 164
    .line 165
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->prologue:Ljava/util/List;

    .line 170
    .line 171
    return-void

    .line 172
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_ABOUT_ME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 173
    .line 174
    if-ne p1, v0, :cond_6

    .line 175
    .line 176
    iput-object p0, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 177
    .line 178
    :cond_6
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l0x;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/l0x;->d:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x3

    .line 10
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/l0x;->d:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getTitleName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 28
    .line 29
    new-instance v2, Ll/l0x$a;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/l0x$a;-><init>(Ll/l0x;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 38
    .line 39
    new-instance v2, Ll/j0x;

    .line 40
    .line 41
    invoke-direct {v2, p0, p1}, Ll/j0x;-><init>(Ll/l0x;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v4, "\u6dfb\u52a0"

    .line 52
    .line 53
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getTitleName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->DECLARATION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 71
    .line 72
    const/16 v2, 0x14

    .line 73
    .line 74
    const/16 v4, 0x12c

    .line 75
    .line 76
    if-ne p1, v0, :cond_0

    .line 77
    .line 78
    iget-object p1, p0, Ll/l0x;->e:Lv/VText;

    .line 79
    .line 80
    const-string v0, "\u4ecb\u7ecd\u4e00\u4e0b\u4f60\u7684\u5de5\u4f5c&\u751f\u6d3b\u72b6\u6001\u3001\u5904\u4e8b\u98ce\u683c\u3001\u4f18\u7f3a\u70b9\u3001\u6210\u957f\u3001\u6c42\u5b66\u7ecf\u5386\u7b49\u2026"

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/l0x;->m:Landroid/widget/TextView;

    .line 86
    .line 87
    const-string v0, "ENTP\u76f4\u5973\u4e00\u679a\uff0c\u7236\u6bcd\u5747\u4e3a\u516c\u52a1\u5458\u8fd8\u672a\u9000\u4f11\uff0c\u5728\u5317\u4eac\u5de5\u4f5c7\u5e74\u6709\u4f59\uff0c\u662f\u4e2a\u6709\u4e8b\u4e1a\u5fc3\u7684\u604b\u7231\u8111\uff0c\u5982\u679c\u6709\u5171\u540c\u76ee\u6807\u4e5f\u671f\u5f85\u548c\u53e6\u4e00\u534a\u4e00\u8d77\u521b\u4e1a\uff0c\u559c\u6b22\u5c0f\u5b69\u4f46\u4e5f\u53ef\u4ee5\u63a5\u53d7\u4e01\u514b"

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/l0x;->g:Lv/VEditText;

    .line 93
    .line 94
    const-string v0, "\u8ba4\u771f\u4ecb\u7ecd\u4e00\u4e0b\u81ea\u5df1\uff0c\u8ba9\u5fc3\u4eea\u7684\u4eba\u66f4\u4e86\u89e3\u4f60"

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getMarriageDeclaration()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput v4, p0, Ll/l0x;->n:I

    .line 104
    .line 105
    iput v2, p0, Ll/l0x;->o:I

    .line 106
    .line 107
    goto/16 :goto_2

    .line 108
    .line 109
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->FAMILY_BACKGROUND:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 110
    .line 111
    if-ne p1, v0, :cond_1

    .line 112
    .line 113
    iget-object p1, p0, Ll/l0x;->e:Lv/VText;

    .line 114
    .line 115
    const-string v0, "\u4ecb\u7ecd\u4e00\u4e0b\u4f60\u7684\u7236\u6bcd\u804c\u4e1a\u3001\u5144\u5f1f\u59d0\u59b9\u60c5\u51b5\uff0c\u5e2e\u4f60\u627e\u5230\u95e8\u5f53\u6237\u5bf9\u7684\u53e6\u4e00\u534a"

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Ll/l0x;->m:Landroid/widget/TextView;

    .line 121
    .line 122
    const-string v0, "\u72ec\u751f\u5b50\u5973\uff0c\u751f\u957f\u5728\u5c0f\u5eb7\u5bb6\u5ead\uff0c\u7236\u4eb2\u662f\u8001\u5e08\uff0c\u5988\u5988\u662f\u5bb6\u5ead\u4e3b\u5987\uff0c\u4e24\u4f4d\u8001\u4eba\u6027\u683c\u90fd\u6bd4\u8f83\u6e29\u548c\uff0c\u5c0f\u6709\u5b58\u6b3e\u53ef\u652f\u6301\u5728\u5a5a\u524d\u8d2d\u623f"

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ll/l0x;->g:Lv/VEditText;

    .line 128
    .line 129
    const-string v0, "\u8ba4\u771f\u4ecb\u7ecd\u4e00\u4e0b\u4f60\u7684\u5bb6\u5ead\u80cc\u666f\uff0c\u8ba9\u5fc3\u4eea\u7684\u4eba\u66f4\u4e86\u89e3\u4f60"

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getMarriageFamilyBackground()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    iput v4, p0, Ll/l0x;->n:I

    .line 139
    .line 140
    iput v2, p0, Ll/l0x;->o:I

    .line 141
    .line 142
    goto/16 :goto_2

    .line 143
    .line 144
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->BRIDE_PRICE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 145
    .line 146
    if-ne p1, v0, :cond_2

    .line 147
    .line 148
    iget-object p1, p0, Ll/l0x;->e:Lv/VText;

    .line 149
    .line 150
    const-string v0, "\u5173\u4e8e\u5a5a\u793c\u548c\u5f69\u793c\uff0c\u4f60\u6709\u4ec0\u4e48\u6837\u7684\u4e3b\u5f20\uff1f"

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Ll/l0x;->m:Landroid/widget/TextView;

    .line 156
    .line 157
    const-string v0, "\u5982\u679c\u662f\u771f\u5fc3\u60f3\u8981\u8fc7\u4e00\u8f88\u5b50\u7684\u4eba\uff0c\u5f69\u793c\u4e0d\u4f1a\u662f\u6211\u4eec\u5728\u4e00\u8d77\u7684\u963b\u788d\uff0c\u5230\u65f6\u5019\u53ef\u4ee5\u53cc\u65b9\u5546\u91cf\u3002\u5f69\u793c\u4e5f\u662f\u4e3a\u6211\u4eec\u7684\u5c0f\u5bb6\u7684\u79ef\u7d2f\u5efa\u8bbe\u57fa\u91d1\u3002\u672c\u4eba\u5bf9\u5a5a\u793c\u5f62\u5f0f\u6ca1\u6709\u592a\u591a\u8981\u6c42\uff0c\u53ea\u8981\u662f\u548c\u5bf9\u7684\u4eba\u4e00\u8d77\u7528\u5fc3\u5e03\u7f6e\u5c31\u53ef\u4ee5\u3002"

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Ll/l0x;->g:Lv/VEditText;

    .line 163
    .line 164
    const-string v0, "\u8bf4\u8bf4\u4f60\u5bf9\u5a5a\u793c/\u5f69\u793c\u7684\u60f3\u6cd5"

    .line 165
    .line 166
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getMarriageFamilyBridePrice()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    iput v4, p0, Ll/l0x;->n:I

    .line 174
    .line 175
    goto/16 :goto_2

    .line 176
    .line 177
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->NICK_NAME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 178
    .line 179
    if-ne p1, v0, :cond_3

    .line 180
    .line 181
    iget-object p1, p0, Ll/l0x;->e:Lv/VText;

    .line 182
    .line 183
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/l0x;->k:Lv/VLinear;

    .line 187
    .line 188
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 192
    .line 193
    const/16 p2, 0x32

    .line 194
    .line 195
    iput p2, p0, Ll/l0x;->n:I

    .line 196
    .line 197
    iput v3, p0, Ll/l0x;->o:I

    .line 198
    .line 199
    goto/16 :goto_2

    .line 200
    .line 201
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROLOGUE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 202
    .line 203
    if-ne p1, v0, :cond_5

    .line 204
    .line 205
    iget-object p1, p0, Ll/l0x;->e:Lv/VText;

    .line 206
    .line 207
    const-string v0, "\u8bbe\u7f6e\u4e00\u6bb5\u4e13\u5c5e\u7684\u5f00\u573a\u767d\uff0c\u8ba9\u5bf9\u65b9\u66f4\u52a0\u4e86\u89e3\u4f60"

    .line 208
    .line 209
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Ll/l0x;->k:Lv/VLinear;

    .line 213
    .line 214
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getMarriagePrologue()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_4

    .line 226
    .line 227
    invoke-static {p2}, Ll/f2x;->a(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    :cond_4
    iput v4, p0, Ll/l0x;->n:I

    .line 232
    .line 233
    iput v2, p0, Ll/l0x;->o:I

    .line 234
    .line 235
    goto/16 :goto_2

    .line 236
    .line 237
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_ABOUT_ME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 238
    .line 239
    if-ne p1, v0, :cond_9

    .line 240
    .line 241
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 242
    .line 243
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 244
    .line 245
    invoke-virtual {p1}, Ll/ura;->n3()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 250
    .line 251
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    if-nez v0, :cond_6

    .line 256
    .line 257
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_6

    .line 262
    .line 263
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->am()Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-nez v0, :cond_6

    .line 276
    .line 277
    iget-object v0, p0, Ll/l0x;->i:Landroid/widget/TextView;

    .line 278
    .line 279
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    iget-object v0, p0, Ll/l0x;->i:Landroid/widget/TextView;

    .line 283
    .line 284
    new-instance v1, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    const-string p1, " \uff0c\u8bf7\u4fee\u6539"

    .line 293
    .line 294
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 302
    .line 303
    .line 304
    :cond_6
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->c2()Z

    .line 309
    .line 310
    .line 311
    move-result p1

    .line 312
    iget-object v0, p0, Ll/l0x;->e:Lv/VText;

    .line 313
    .line 314
    if-eqz p1, :cond_7

    .line 315
    .line 316
    const-string p1, "\u8bf7\u81f3\u5c11\u752815\u4e2a\u5b57\u4ecb\u7ecd\u4e00\u4e0b\u4f60\u7684\u6027\u683c\u7279\u70b9\u3001\u5174\u8da3\u7231\u597d\u7b49"

    .line 317
    .line 318
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    .line 320
    .line 321
    goto :goto_0

    .line 322
    :cond_7
    const-string p1, "\u4ecb\u7ecd\u4e00\u4e0b\u4f60\u7684\u6027\u683c\u7279\u70b9\u3001\u5174\u8da3\u7231\u597d\u3001\u7406\u60f3\u578b\u7b49\uff0c\u8ba9\u5bf9\u65b9\u66f4\u4e86\u89e3\u4f60"

    .line 323
    .line 324
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 325
    .line 326
    .line 327
    :goto_0
    iget-object p1, p0, Ll/l0x;->l:Landroid/widget/TextView;

    .line 328
    .line 329
    const-string v0, "\u8fd9\u6837\u5199\u66f4\u53d7\u6b22\u8fce\uff1a"

    .line 330
    .line 331
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    iget-object v0, p0, Ll/l0x;->m:Landroid/widget/TextView;

    .line 339
    .line 340
    if-eqz p1, :cond_8

    .line 341
    .line 342
    const-string p1, "enfp\uff0c\u6027\u683c\u5f00\u6717\u3001\u559c\u6b22\u7ed3\u4ea4\u65b0\u670b\u53cb\u3002\n\u559c\u6b22\u8df3\u821e\u3001\u7f8e\u98df\u3001\u5ba0\u7269\uff0c\u70ed\u7231\u81ea\u7531\u3002\n\u60f3\u8981\u8ba4\u8bc6\u4e00\u4f4d\u771f\u8bda\u604b\u7231\u7684\u7537\u6027\uff0c\u5e0c\u671b\u4f60\u6e29\u67d4\u7a33\u91cd\u3001\u8ba4\u771f\u5bf9\u5f85\u611f\u60c5\u3002"

    .line 343
    .line 344
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 345
    .line 346
    .line 347
    goto :goto_1

    .line 348
    :cond_8
    const-string p1, "enfp\uff0c\u76f4\u7387\u3001\u771f\u8bda\u3001\u9760\u8c31\u3002\n\u559c\u6b22\u6ed1\u96ea\u3001\u5f92\u6b65\uff0c\u4e00\u76f4\u575a\u6301\u953b\u70bc\u3002\n\u5e0c\u671b\u8ba4\u8bc6\u4e00\u4e2a\u8ba4\u771f\u604b\u7231\u7684\u5973\u5b69\u513f\uff0c\u4e00\u8d77\u5206\u4eab\u7f8e\u597d\u3002"

    .line 349
    .line 350
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 351
    .line 352
    .line 353
    :goto_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 354
    .line 355
    iput v4, p0, Ll/l0x;->n:I

    .line 356
    .line 357
    const/16 p2, 0xf

    .line 358
    .line 359
    iput p2, p0, Ll/l0x;->o:I

    .line 360
    .line 361
    goto :goto_2

    .line 362
    :cond_9
    const-string p1, ""

    .line 363
    .line 364
    :goto_2
    iget-object p2, p0, Ll/l0x;->g:Lv/VEditText;

    .line 365
    .line 366
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    .line 368
    .line 369
    iget p2, p0, Ll/l0x;->n:I

    .line 370
    .line 371
    if-lez p2, :cond_a

    .line 372
    .line 373
    iget-object v0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 374
    .line 375
    invoke-virtual {v0, p2}, Lv/VEditText;->setMaxLength(I)V

    .line 376
    .line 377
    .line 378
    iget p2, p0, Ll/l0x;->n:I

    .line 379
    .line 380
    invoke-virtual {p0, p2, p1}, Ll/l0x;->v(ILjava/lang/String;)V

    .line 381
    .line 382
    .line 383
    :cond_a
    invoke-virtual {p0}, Ll/hzw;->f()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->P4()Z

    .line 388
    .line 389
    .line 390
    move-result p1

    .line 391
    if-eqz p1, :cond_b

    .line 392
    .line 393
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    new-instance p2, Ll/k0x;

    .line 398
    .line 399
    invoke-direct {p2, p0}, Ll/k0x;-><init>(Ll/l0x;)V

    .line 400
    .line 401
    .line 402
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 403
    .line 404
    .line 405
    :cond_b
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i0x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l0x;->p(Ll/i0x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l0x;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/m0x;->b(Ll/l0x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/i0x;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l0x;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    sget-object p2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_ABOUT_ME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 4
    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/l0x;->i:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final v(ILjava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    move-object p2, v0

    .line 6
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lez v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Ll/l0x;->g:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/l0x;->g:Lv/VEditText;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p0, Ll/l0x;->h:Landroid/widget/TextView;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    sub-int/2addr p1, p2

    .line 49
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
