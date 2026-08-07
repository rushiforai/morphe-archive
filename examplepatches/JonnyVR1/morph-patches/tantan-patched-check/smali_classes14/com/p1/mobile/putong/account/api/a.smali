.class public Lcom/p1/mobile/putong/account/api/a;
.super Lcom/p1/mobile/putong/account/api/b;
.source "SourceFile"


# static fields
.field public static p:Z

.field public static final q:[C


# instance fields
.field public g:Ll/gu;

.field public h:Lcom/p1/mobile/putong/data/SignUpData;

.field public i:Ll/wyd0;

.field public j:Ll/byd0;

.field public k:Ll/byd0;

.field public l:Ll/gxd0;

.field public m:Ll/jxd0;

.field public n:Z

.field public o:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "0123456789abcdef"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/p1/mobile/putong/account/api/a;->q:[C

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/api/b;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gu;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/gu;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->g:Ll/gu;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 17
    .line 18
    new-instance v0, Ll/wyd0;

    .line 19
    .line 20
    const-string v1, "pref_key_last_signup_source"

    .line 21
    .line 22
    const-string v2, ""

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->i:Ll/wyd0;

    .line 28
    .line 29
    new-instance v0, Ll/byd0;

    .line 30
    .line 31
    const-wide v1, 0x415cb8179L

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "pref_key_total_match_count"

    .line 41
    .line 42
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->j:Ll/byd0;

    .line 46
    .line 47
    new-instance v0, Ll/byd0;

    .line 48
    .line 49
    const-wide/16 v1, 0x0

    .line 50
    .line 51
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "pref_key_cur_signin_timestamp"

    .line 56
    .line 57
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->k:Ll/byd0;

    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 65
    .line 66
    new-instance v0, Ll/jxd0;

    .line 67
    .line 68
    const-string v1, "is_show_migrate_guide"

    .line 69
    .line 70
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->m:Ll/jxd0;

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/api/a;->n:Z

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 82
    .line 83
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/account/api/a;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->p1()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->d:Ll/ejk0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->k1(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B0(Ljava/lang/Runnable;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/tcn;->d()V

    .line 5
    .line 6
    .line 7
    return-object p1
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->y1(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lcom/p1/mobile/account_core/reponse_data/RiskVerification;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->I1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->w1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/account/api/a;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->n1()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E0(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/ze;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ze;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic F()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/qd;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qd;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/account/data/MatchCounterEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->x1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/account/api/a;Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->L1(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I(Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic J(Lcom/p1/mobile/account_facebook/data/FacebookSignupData;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/thirdparty/info"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic K()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/profile/names"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/account/api/a;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->C1(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/account_core/reponse_data/H5Token;)Lcom/p1/mobile/putong/data/AuthData;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/pw;->x(Lcom/p1/mobile/account_core/reponse_data/H5Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)Ll/uxj0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 8
    .line 9
    const-string v1, "male"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    new-instance v2, Lcom/p1/mobile/putong/data/Studies;

    .line 30
    .line 31
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Studies;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/data/SignUpData;->qualificationType:Lcom/p1/mobile/putong/data/QualificationType;

    .line 41
    .line 42
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/data/SignUpData;->school:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 47
    .line 48
    sget-object v1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->f:Ll/wyd0;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->toJson()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    new-instance v0, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 69
    .line 70
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    new-instance p0, Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v1, Lcom/p1/mobile/putong/data/Profile;

    .line 79
    .line 80
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 84
    .line 85
    new-instance v2, Lcom/p1/mobile/putong/data/Extensions;

    .line 86
    .line 87
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 95
    .line 96
    new-instance v2, Lcom/p1/mobile/putong/data/Physical;

    .line 97
    .line 98
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Physical;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 108
    .line 109
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 110
    .line 111
    sget-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->g:Ll/wyd0;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->toJson()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_1
    return-object p1
.end method

.method public static synthetic O()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-class v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v2, v0, v1, v2, v2}, Ll/uqb0;->Y0(ZLjava/lang/Class;ZZZ)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->F2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/account/api/a;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->s1()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/data/FacebookEnvelope;)Lcom/p1/mobile/putong/data/SignUpData;
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FacebookEnvelope;->data:Lcom/p1/mobile/putong/data/FacebookData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FacebookData;->user:Lcom/p1/mobile/putong/data/FacebookUserInfo;

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->name:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->gender:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "male"

    .line 29
    .line 30
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-static {v2}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->gender:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "female"

    .line 46
    .line 47
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-static {v2}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 v1, 0x0

    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 62
    .line 63
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->birthdate:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 72
    .line 73
    const-string v2, "yyyy-MM-dd"

    .line 74
    .line 75
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 80
    .line 81
    .line 82
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->birthdate:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    .line 89
    .line 90
    .line 91
    move-result-wide v1

    .line 92
    long-to-double v1, v1

    .line 93
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :catch_0
    move-exception v1

    .line 101
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    :cond_2
    :goto_1
    new-instance v1, Lcom/p1/mobile/putong/data/FBSignupData;

    .line 105
    .line 106
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/FBSignupData;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/data/FBPage;->new_()Lcom/p1/mobile/putong/data/FBPage;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->hometown:Lcom/p1/mobile/putong/data/FacebookInfoIdWithName;

    .line 114
    .line 115
    iget-object v4, v3, Lcom/p1/mobile/putong/data/FacebookInfoIdWithName;->id:Ljava/lang/String;

    .line 116
    .line 117
    iput-object v4, v2, Lcom/p1/mobile/putong/data/FBPage;->id:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, v3, Lcom/p1/mobile/putong/data/FacebookInfoIdWithName;->name:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v3, v2, Lcom/p1/mobile/putong/data/FBPage;->name:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v2, v1, Lcom/p1/mobile/putong/data/FBSignupData;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/data/FBPage;->new_()Lcom/p1/mobile/putong/data/FBPage;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iget-object v3, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->location:Lcom/p1/mobile/putong/data/FacebookInfoIdWithName;

    .line 130
    .line 131
    iget-object v4, v3, Lcom/p1/mobile/putong/data/FacebookInfoIdWithName;->id:Ljava/lang/String;

    .line 132
    .line 133
    iput-object v4, v2, Lcom/p1/mobile/putong/data/FBPage;->id:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v3, v3, Lcom/p1/mobile/putong/data/FacebookInfoIdWithName;->name:Ljava/lang/String;

    .line 136
    .line 137
    iput-object v3, v2, Lcom/p1/mobile/putong/data/FBPage;->name:Ljava/lang/String;

    .line 138
    .line 139
    iput-object v2, v1, Lcom/p1/mobile/putong/data/FBSignupData;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 140
    .line 141
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->fbSignupData:Lcom/p1/mobile/putong/data/FBSignupData;

    .line 142
    .line 143
    const-string v1, "image/jpeg"

    .line 144
    .line 145
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 148
    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 150
    .line 151
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FacebookUserInfo;->picture:Lcom/p1/mobile/putong/data/FacebookPicture;

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FacebookPicture;->data:Lcom/p1/mobile/putong/data/FacebookPictureInfo;

    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FacebookPictureInfo;->url:Ljava/lang/String;

    .line 156
    .line 157
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 158
    .line 159
    return-object v0
.end method

.method public static synthetic R(Lorg/json/JSONObject;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    const-string p1, "AccountApi/thirdparty-unbind"

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p0}, Ll/qw;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic S(Lorg/json/JSONObject;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    const-string p1, "AccountApi/thirdparty-bind"

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p0}, Ll/qw;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/account/api/a;->T0(Lcom/p1/mobile/account_core/request_data/RequestData;ZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->B1(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static T0(Lcom/p1/mobile/account_core/request_data/RequestData;ZLjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    :try_start_0
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/r8f0;->g()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {}, Ll/v3q0;->K3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    const-string v2, "mmuid"

    .line 27
    .line 28
    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    const-string p1, "inviteCode"

    .line 38
    .line 39
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    :cond_1
    const-string p1, "browserUA"

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 45
    .line 46
    invoke-static {v1}, Ll/gsp0;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    const-string p1, "thirdPartyEmail"

    .line 60
    .line 61
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :catch_0
    :cond_2
    const-string p1, "extra"

    .line 65
    .line 66
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static synthetic U(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/uqb0;->g0(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static U0(Lcom/p1/mobile/putong/data/ForgetPasswordData;Ljava/lang/Runnable;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/ForgetPasswordData;",
            "Ljava/lang/Runnable;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->I:Ll/xi5;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 4
    .line 5
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/account/api/a;->T1(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v1, Ll/df;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ll/df;-><init>(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/ef;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/ef;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->F1(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X(Lcom/p1/mobile/account_facebook/data/FacebookSignupData;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/we;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/we;-><init>(Lcom/p1/mobile/account_facebook/data/FacebookSignupData;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/data/FacebookEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic Y()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/users/me/skip-info"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    return-object v0
.end method

.method public static synthetic Z(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Ll/uqb0;->f0()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static Z1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/p1/mobile/putong/account/api/a;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->D1(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->m1(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->r1(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d0(Ljava/lang/Runnable;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method public static synthetic e0()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Client-State"

    .line 8
    .line 9
    const-string v2, "background"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "/void"

    .line 16
    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    return-object v0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->E1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->l1(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/cp;->d(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sput-boolean p0, Lcom/p1/mobile/putong/account/api/a;->p:Z

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/account/data/AccountCommonData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "account"

    .line 8
    .line 9
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 10
    .line 11
    invoke-static {p0, v0, v1}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/StepSignupStage;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "verified"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, v0, p0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 25
    .line 26
    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/account/api/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->u1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static i1()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/account/api/a;->p:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/account/api/a;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->q1()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/data/VerifyData;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/confirmation-code/send"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/data/VerifyDataV2;->v1ConvertV2(Lcom/p1/mobile/putong/data/VerifyData;)Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerifyDataV2;->toJson()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->o1(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->t1(Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic l(Lorg/json/JSONObject;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/me?method=patch"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->t(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic l0(Ll/pcj;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/data/ConfirmCodeResponse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 2
    .line 3
    const-string v0, "finished"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/uqb0;->f0()Lrx/c;

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 15
    .line 16
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic m0()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/jf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jf;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->d:Ll/ejk0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/data/VerifyData;Z)Ll/x1d0;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "signup_signin"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "/confirmation-code/verify"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 26
    .line 27
    const-string v2, "change-phone"

    .line 28
    .line 29
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const-string p1, "/change-phone"

    .line 36
    .line 37
    invoke-static {p1}, Lcom/p1/mobile/putong/account/api/b;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 49
    .line 50
    const-string v2, "bind_mobile"

    .line 51
    .line 52
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    const-string p1, "&forceLogin=true"

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const-string p1, ""

    .line 64
    .line 65
    :goto_0
    const-string v0, "/bind-phone"

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/account/api/b;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    goto :goto_1

    .line 82
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 83
    .line 84
    const-string v0, "ban-appeal"

    .line 85
    .line 86
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 107
    .line 108
    invoke-static {p0}, Lcom/p1/mobile/putong/data/VerifyDataV2;->v1ConvertV2(Lcom/p1/mobile/putong/data/VerifyData;)Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerifyDataV2;->toJson()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {v0, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0

    .line 129
    :cond_4
    const-string p1, "/verify-confirmation-code"

    .line 130
    .line 131
    invoke-static {p1}, Lcom/p1/mobile/putong/account/api/b;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    :goto_1
    invoke-virtual {v0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerifyData;->toJson()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {v0, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->K1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic p(Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/StepSignupStage;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/bd;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bd;-><init>(Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/dd;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/dd;-><init>(Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic p0(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/account/api/a;->V1(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ll/gd;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/gd;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    new-instance v0, Ll/hd;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/hd;-><init>(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p2, Ll/id;

    .line 34
    .line 35
    invoke-direct {p2}, Ll/id;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance p2, Ll/jd;

    .line 43
    .line 44
    invoke-direct {p2, p1}, Ll/jd;-><init>(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/putong/data/VerifyResult;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyResult;->action:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "signup"

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyResult;->action:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "signin"

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 32
    .line 33
    :cond_1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    return-object p0
.end method

.method public static synthetic q0(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "name"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p0, "clientId"

    .line 12
    .line 13
    const-string v1, "100032"

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :catch_0
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "/event/report"

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 35
    .line 36
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public static q2(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            "Ljava/lang/Runnable;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cpi;->c()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/ff;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ff;-><init>(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Ll/uqb0;->I:Ll/xi5;

    .line 24
    .line 25
    new-instance v2, Ll/pf;

    .line 26
    .line 27
    invoke-direct {v2, p1, p0}, Ll/pf;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->A1(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Boolean;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/data/VerifyData;)Ll/x1d0;
    .locals 2

    .line 1
    const-string v0, "/confirmation-code/verify"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/account/api/b;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerifyData;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic s(Lorg/json/JSONObject;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/captcha/generate"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/AuthData;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->J1(Lcom/p1/mobile/putong/data/AuthData;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/account/data/CaptchaData;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/account/data/AccountCommonData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/account/data/AccountCommonData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountCommonData;->captchaData:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->v1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/data/SignUpData;Lrx/Notification;)Lcom/p1/mobile/putong/data/SignUpData;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->firebaseId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->z1(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v0(Ljava/lang/Runnable;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 4

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/ike;->o(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 9
    .line 10
    const-string v1, "gender-saved"

    .line 11
    .line 12
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/api/a;->f2(Lcom/p1/mobile/putong/data/Gender;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 30
    .line 31
    const-string v1, "birth-saved"

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const-string v1, "account"

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 46
    .line 47
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/account/api/a;->e2(D)V

    .line 66
    .line 67
    .line 68
    invoke-static {p0}, Ll/tcn;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 72
    .line 73
    const-string v2, "finished"

    .line 74
    .line 75
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 82
    .line 83
    const-string v3, "unknown_"

    .line 84
    .line 85
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 92
    .line 93
    sget-object v3, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 94
    .line 95
    invoke-static {v0, v1, v3}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 106
    .line 107
    iget-object v3, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 108
    .line 109
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 110
    .line 111
    invoke-virtual {v0, v3, v1}, Lcom/p1/mobile/putong/account/api/a;->g2(Ljava/lang/String;I)V

    .line 112
    .line 113
    .line 114
    :cond_2
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/x95;->k(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 122
    .line 123
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_3

    .line 128
    .line 129
    const/4 v0, 0x1

    .line 130
    invoke-static {v0}, Ll/uqb0;->g0(Z)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/ae;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/ae;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0

    .line 152
    :cond_3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    return-object p0
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/data/User;Ll/uxj0;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic x(Lorg/json/JSONObject;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/captcha/verify"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic x0()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/total-counters"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/account/api/b;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->H1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/account/data/AccountTestGroup;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/a;->G1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z0(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/data/VerifyResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/ad;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ll/ad;-><init>(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method


# virtual methods
.method public final synthetic A1(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->a2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Ll/x95;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 11
    .line 12
    return-object p0
.end method

.method public A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "bind_mobile_force_login"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "bind_mobile"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 23
    .line 24
    const-string v3, "ban-appeal"

    .line 25
    .line 26
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_3

    .line 31
    .line 32
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 33
    .line 34
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->forceLogin:Z

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ll/pw;->s(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/nd;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/nd;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 67
    .line 68
    const-string v1, "change-phone"

    .line 69
    .line 70
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ll/pw;->t(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/yd;

    .line 83
    .line 84
    invoke-direct {v1, p0, p1}, Ll/yd;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ll/pw;->R(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :cond_3
    new-instance v1, Ll/je;

    .line 116
    .line 117
    invoke-direct {v1, p1, v0}, Ll/je;-><init>(Lcom/p1/mobile/putong/data/VerifyData;Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/account/api/a;->G2(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method public final synthetic B1(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/account_core/reponse_data/Token;->value:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    const-string v0, "signup_source"

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->Z0(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const-string v2, ""

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    move-object v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 43
    .line 44
    :goto_0
    const-string v3, "phone_num"

    .line 45
    .line 46
    invoke-static {v3, v1}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v3, "user_id"

    .line 51
    .line 52
    iget-object p2, p2, Lcom/p1/mobile/account_core/reponse_data/Token;->userId:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v3, p2}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    filled-new-array {v0, v1, p2}, [Ll/rfj0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const-string v0, "e_early_signup_success"

    .line 63
    .line 64
    invoke-static {v0, v2, p2}, Ll/rfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/rfj0$a;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->a2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 71
    .line 72
    return-object p0
.end method

.method public B2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/pw;->s(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/of;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/of;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic C1(Ll/uxj0;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/ike;->n(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/bp;->f()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const-string v0, "verified"

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 33
    .line 34
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ll/me;

    .line 45
    .line 46
    invoke-direct {p1}, Ll/me;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 63
    .line 64
    const-string v1, "finished"

    .line 65
    .line 66
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 81
    .line 82
    const-string v1, "unknown_"

    .line 83
    .line 84
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 100
    .line 101
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_2

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 108
    .line 109
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 116
    .line 117
    const-string v0, "picture-saved"

    .line 118
    .line 119
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_2

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance p1, Ll/ne;

    .line 134
    .line 135
    invoke-direct {p1}, Ll/ne;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0

    .line 143
    :cond_2
    sget-object p0, Ll/uqb0;->Q:Ll/l2;

    .line 144
    .line 145
    invoke-virtual {p0}, Ll/l2;->U()V

    .line 146
    .line 147
    .line 148
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 149
    .line 150
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    return-object p0

    .line 155
    :cond_3
    :goto_0
    invoke-static {}, Ll/uqb0;->f0()Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    return-object p0
.end method

.method public C2(Lcom/p1/mobile/putong/account/data/ThirdPartyData;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/ThirdPartyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pw;->b:Ll/gvf;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/gvf;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic D1(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 17
    .line 18
    return-object p0
.end method

.method public D2(Lcom/p1/mobile/putong/account/data/ThirdPartyData;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/ThirdPartyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pw;->e:Ll/f6k;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/f6k;->c(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic E1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/account_core/reponse_data/Token;->value:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ll/ike;->n(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 36
    .line 37
    return-object p0
.end method

.method public E2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AccountErrorResponse;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pw;->T(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public F0()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AuthData;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pw;->C()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/rc;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/rc;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic F1(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 17
    .line 18
    return-object p0
.end method

.method public F2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/ConfirmCodeResponse;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/oe;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/oe;-><init>(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/pe;

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/pe;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "verifyNumberFixHack"

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v0, v1, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public G0()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic G1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {v0, p2}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->y2(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    return-object p0
.end method

.method public final G2(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "change-phone"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 13
    .line 14
    const-string v2, "bind_mobile"

    .line 15
    .line 16
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 23
    .line 24
    const-string v2, "bind_mobile_oneclick"

    .line 25
    .line 26
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 34
    .line 35
    const-string v2, "signup_signin"

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    new-instance v0, Ll/xc;

    .line 44
    .line 45
    invoke-direct {v0, p1, p2}, Ll/xc;-><init>(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v2, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_1
    new-instance p2, Ll/si20;

    .line 54
    .line 55
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->UNIT_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    .line 57
    invoke-direct {p2, p1, v0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p2, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_2
    :goto_0
    new-instance v0, Ll/wc;

    .line 74
    .line 75
    invoke-direct {v0, p0, p1, p2}, Ll/wc;-><init>(Lcom/p1/mobile/putong/account/api/a;Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 76
    .line 77
    .line 78
    const-string p1, "verifyPhone"

    .line 79
    .line 80
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public H0(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/account/data/AccountCommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v0, "clientID"

    .line 17
    .line 18
    const-string v1, "100032"

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string v0, "type"

    .line 24
    .line 25
    const-string v1, "chars"

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    const-string v0, "token"

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const-string p1, "value"

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception p1

    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    sget-object p1, Ll/uqb0;->I:Ll/xi5;

    .line 46
    .line 47
    new-instance p2, Ll/lf;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Ll/lf;-><init>(Lorg/json/JSONObject;)V

    .line 50
    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 53
    .line 54
    invoke-static {p2, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance p2, Ll/mf;

    .line 59
    .line 60
    invoke-direct {p2}, Ll/mf;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p2, "captcha_verify"

    .line 68
    .line 69
    invoke-virtual {p1, p2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public final synthetic H1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {v0, p2}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->y2(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    return-object p0
.end method

.method public H2()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/ed;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ed;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/fd;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/fd;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x0

    .line 31
    const-string v2, "void_request"

    .line 32
    .line 33
    invoke-virtual {p0, v2, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;Z)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public I0()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/DownloadDataCheck;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pw;->y()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic I1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 13
    .line 14
    return-object p0
.end method

.method public I2()Ll/wyd0;
    .locals 3

    .line 1
    new-instance p0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "wechat_nickname_saved_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {p0, v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public J0()V
    .locals 0

    .line 1
    new-instance p0, Ll/cd;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cd;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic J1(Lcom/p1/mobile/putong/data/AuthData;)Ll/uxj0;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/Exception;

    .line 4
    .line 5
    const-string v1, "auth == null in AccountApi on line 542"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 19
    .line 20
    return-object p0
.end method

.method public K0(Lcom/p1/mobile/putong/data/EmailVerifyData;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/EmailVerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AccountErrorResponse;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/EmailVerifyData;->email:Ljava/lang/String;

    .line 4
    .line 5
    sget v0, Ll/uqb0;->f0:I

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    sget v2, Ll/uqb0;->f0:I

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :goto_0
    invoke-virtual {p0, p1, v1}, Ll/pw;->z(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final synthetic K1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v0, "change-phone"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    const-string v0, "bind_mobile"

    .line 14
    .line 15
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->y2(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public L0(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/af;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/af;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic L1(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/data/AuthData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/vd;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/vd;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/wd;

    .line 18
    .line 19
    invoke-direct {v0, p0, p2}, Ll/wd;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public M0(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyDataV2;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "bind-email"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 12
    .line 13
    iget-object v0, v0, Ll/pw;->f:Ll/hue;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/hue;->x(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/bf;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/bf;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyDataV2;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 38
    .line 39
    const-string v1, "change-email"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 48
    .line 49
    iget-object v0, v0, Ll/pw;->f:Ll/hue;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ll/hue;->y(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/cf;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1}, Ll/cf;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyDataV2;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ll/pw;->S(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public M1()Ll/fu;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->g:Ll/gu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gu;->a()Ll/fu;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public N0(Lcom/p1/mobile/putong/data/SignUpData;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->basic:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    if-eq p0, p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->nameInfoSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 8
    .line 9
    if-eq p0, p1, :cond_1

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->genderInfoSave:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 12
    .line 13
    if-eq p0, p1, :cond_1

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->birthInfoSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 16
    .line 17
    if-eq p0, p1, :cond_1

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->intlFriendPurposeSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 20
    .line 21
    if-eq p0, p1, :cond_1

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->ethnicitySaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 24
    .line 25
    if-eq p0, p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->languageSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 28
    .line 29
    if-ne p0, p1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public N1()Ll/wyd0;
    .locals 3

    .line 1
    new-instance p0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "more_gender_saved_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {p0, v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public O0()Ll/mxd0;
    .locals 4

    .line 1
    new-instance p0, Ll/mxd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "facebook_birthdate_saved_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-direct {p0, v0, v1, v2, v3}, Ll/mxd0;-><init>(Ljava/lang/String;DZ)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public O1()Ll/jxd0;
    .locals 3

    .line 1
    new-instance p0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "more_gender_show_profile_saved_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {p0, v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public P0()Ll/wyd0;
    .locals 3

    .line 1
    new-instance p0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "facebook_gender_saved_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {p0, v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public P1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "bind_mobile_oneclick"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 19
    .line 20
    iget-object v1, v1, Ll/pw;->a:Ll/hp50;

    .line 21
    .line 22
    invoke-virtual {v1, p1, p2, p3, p4}, Ll/hp50;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance p2, Ll/ue;

    .line 27
    .line 28
    invoke-direct {p2, p0, v0}, Ll/ue;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public Q0()Ll/wyd0;
    .locals 3

    .line 1
    new-instance p0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "facebook_nickname_saved_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {p0, v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public Q1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "bind_mobile_oneclick"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 19
    .line 20
    iget-object v0, v0, Ll/pw;->a:Ll/hp50;

    .line 21
    .line 22
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/hp50;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance p2, Ll/nf;

    .line 27
    .line 28
    invoke-direct {p2, p0}, Ll/nf;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public R0()Ll/wyd0;
    .locals 3

    .line 1
    new-instance p0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "facebook_profile_saved_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {p0, v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public R1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;->b2(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T1(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/ForgetPasswordData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/pw;->G(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/xd;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/xd;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public U1(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/RememberUserInfo;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Lcom/p1/mobile/putong/data/RememberUserInfo;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 2
    .line 3
    const-string v1, "unknown_"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object p2, p1

    .line 27
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 34
    .line 35
    iget-object p1, p2, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 41
    .line 42
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 48
    .line 49
    const-string p1, "No remembered login found"

    .line 50
    .line 51
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_2
    const/4 p2, 0x0

    .line 60
    invoke-static {p2}, Ll/awi0;->k(Lcom/p1/mobile/account_core/reponse_data/Data;)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 64
    .line 65
    const-string v0, "cosmos"

    .line 66
    .line 67
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 74
    .line 75
    iget-object p2, p2, Ll/pw;->a:Ll/hp50;

    .line 76
    .line 77
    invoke-virtual {p2, p1, p3}, Ll/hp50;->e(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    goto/16 :goto_1

    .line 82
    .line 83
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 84
    .line 85
    const-string v0, "wechat"

    .line 86
    .line 87
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-eqz p2, :cond_4

    .line 92
    .line 93
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 94
    .line 95
    iget-object p2, p2, Ll/pw;->c:Ll/awi0;

    .line 96
    .line 97
    const/4 v0, 0x0

    .line 98
    invoke-virtual {p2, p1, p3, v0}, Ll/awi0;->h(Lcom/p1/mobile/putong/data/SignInData;ZZ)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    goto :goto_1

    .line 103
    :cond_4
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 104
    .line 105
    const-string v0, "qq"

    .line 106
    .line 107
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_5

    .line 112
    .line 113
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 114
    .line 115
    iget-object p2, p2, Ll/pw;->c:Ll/awi0;

    .line 116
    .line 117
    const/4 v0, 0x1

    .line 118
    invoke-virtual {p2, p1, p3, v0}, Ll/awi0;->h(Lcom/p1/mobile/putong/data/SignInData;ZZ)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    goto :goto_1

    .line 123
    :cond_5
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 124
    .line 125
    const-string v0, "facebook"

    .line 126
    .line 127
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    if-eqz p2, :cond_6

    .line 132
    .line 133
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 134
    .line 135
    iget-object p2, p2, Ll/pw;->b:Ll/gvf;

    .line 136
    .line 137
    invoke-virtual {p2, p1, p3}, Ll/gvf;->b(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    goto :goto_1

    .line 142
    :cond_6
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 143
    .line 144
    const-string v0, "google"

    .line 145
    .line 146
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-eqz p2, :cond_7

    .line 151
    .line 152
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 153
    .line 154
    iget-object p2, p2, Ll/pw;->e:Ll/f6k;

    .line 155
    .line 156
    invoke-virtual {p2, p1, p3}, Ll/f6k;->b(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    goto :goto_1

    .line 161
    :cond_7
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 162
    .line 163
    const-string v0, "email"

    .line 164
    .line 165
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    if-eqz p2, :cond_8

    .line 170
    .line 171
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 172
    .line 173
    iget-object p2, p2, Ll/pw;->f:Ll/hue;

    .line 174
    .line 175
    invoke-virtual {p2, p1, p3}, Ll/hue;->B(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    goto :goto_1

    .line 180
    :cond_8
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 181
    .line 182
    const-string v0, "tantan-token"

    .line 183
    .line 184
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    if-eqz p2, :cond_9

    .line 189
    .line 190
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 191
    .line 192
    iget-object p2, p2, Ll/pw;->g:Ll/h9i0;

    .line 193
    .line 194
    invoke-virtual {p2, p1}, Ll/h9i0;->c(Lcom/p1/mobile/putong/data/SignInData;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    goto :goto_1

    .line 199
    :cond_9
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 200
    .line 201
    invoke-virtual {p2, p1, p3}, Ll/pw;->N(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    :goto_1
    new-instance p3, Ll/zd;

    .line 206
    .line 207
    invoke-direct {p3, p0, p1}, Ll/zd;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignInData;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    return-object p0
.end method

.method public V0()Ll/gxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public V1(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v2}, Ll/awi0;->k(Lcom/p1/mobile/account_core/reponse_data/Data;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 21
    .line 22
    iget-object v0, v0, Ll/pw;->a:Ll/hp50;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/hp50;->f(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->wechat:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 34
    .line 35
    iget-object v0, v0, Ll/pw;->c:Ll/awi0;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/awi0;->i(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 43
    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 47
    .line 48
    iget-object v0, v0, Ll/pw;->b:Ll/gvf;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ll/gvf;->c(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ll/pw;->J(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    :goto_0
    new-instance v1, Ll/he;

    .line 62
    .line 63
    invoke-direct {v1, p0, p1}, Ll/he;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public W0()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/CaptchaData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/account/data/AccountCommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v0, "clientID"

    .line 17
    .line 18
    const-string v1, "100032"

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string v0, "type"

    .line 24
    .line 25
    const-string v1, "chars"

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception v0

    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    sget-object v0, Ll/uqb0;->I:Ll/xi5;

    .line 36
    .line 37
    new-instance v1, Ll/ie;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/ie;-><init>(Lorg/json/JSONObject;)V

    .line 40
    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance v1, Ll/ke;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/ke;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v1, Ll/le;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/le;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v1, "get_captcha"

    .line 67
    .line 68
    invoke-virtual {v0, v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public W1(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/awi0;->k(Lcom/p1/mobile/account_core/reponse_data/Data;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 12
    .line 13
    iget-object v0, v0, Ll/pw;->a:Ll/hp50;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, Ll/hp50;->g(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->wechat:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-ne v0, p2, :cond_1

    .line 25
    .line 26
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 27
    .line 28
    iget-object p2, p2, Ll/pw;->c:Ll/awi0;

    .line 29
    .line 30
    invoke-virtual {p2, p1, v1}, Ll/awi0;->j(Lcom/p1/mobile/putong/data/SignUpData;Z)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->qq:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 36
    .line 37
    if-ne v0, p2, :cond_2

    .line 38
    .line 39
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 40
    .line 41
    iget-object p2, p2, Ll/pw;->c:Ll/awi0;

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p2, p1, v0}, Ll/awi0;->j(Lcom/p1/mobile/putong/data/SignUpData;Z)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 50
    .line 51
    if-ne v0, p2, :cond_3

    .line 52
    .line 53
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 54
    .line 55
    iget-object p2, p2, Ll/pw;->c:Ll/awi0;

    .line 56
    .line 57
    invoke-virtual {p2, p1, v1}, Ll/awi0;->j(Lcom/p1/mobile/putong/data/SignUpData;Z)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    goto :goto_0

    .line 62
    :cond_3
    sget-object p2, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->google:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 63
    .line 64
    if-ne v0, p2, :cond_4

    .line 65
    .line 66
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 67
    .line 68
    iget-object p2, p2, Ll/pw;->c:Ll/awi0;

    .line 69
    .line 70
    invoke-virtual {p2, p1, v1}, Ll/awi0;->j(Lcom/p1/mobile/putong/data/SignUpData;Z)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    goto :goto_0

    .line 75
    :cond_4
    sget-object p2, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->email:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 76
    .line 77
    const-string v1, "ttt-signup"

    .line 78
    .line 79
    if-ne v0, p2, :cond_5

    .line 80
    .line 81
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->action:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-nez p2, :cond_5

    .line 88
    .line 89
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 90
    .line 91
    iget-object p2, p2, Ll/pw;->f:Ll/hue;

    .line 92
    .line 93
    invoke-virtual {p2, p1}, Ll/hue;->C(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    goto :goto_0

    .line 98
    :cond_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->N0(Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-nez p2, :cond_8

    .line 103
    .line 104
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->media:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 107
    .line 108
    if-ne p2, v0, :cond_6

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_6
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->action:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_7

    .line 118
    .line 119
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 120
    .line 121
    invoke-virtual {p2, p1}, Ll/pw;->M(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    goto :goto_0

    .line 126
    :cond_7
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 127
    .line 128
    invoke-virtual {p2, p1}, Ll/pw;->L(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    :goto_0
    new-instance v0, Ll/hf;

    .line 133
    .line 134
    invoke-direct {v0, p0, p1}, Ll/hf;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :cond_8
    :goto_1
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 143
    .line 144
    invoke-virtual {p2, p1}, Ll/pw;->K(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    new-instance v0, Ll/gf;

    .line 149
    .line 150
    invoke-direct {v0, p0, p1}, Ll/gf;-><init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    return-object p0
.end method

.method public X0()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/MatchCounterEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/yc;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yc;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "get_match_counter"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public X1(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pw;->F(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Y0()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "users/"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/rf;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/rf;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 32
    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {p0, v0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public Y1(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_facebook/data/FacebookSignupData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_facebook/data/FacebookSignupData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyToken:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyId:Ljava/lang/String;

    .line 9
    .line 10
    new-instance p1, Ll/ee;

    .line 11
    .line 12
    invoke-direct {p1, v0}, Ll/ee;-><init>(Lcom/p1/mobile/account_facebook/data/FacebookSignupData;)V

    .line 13
    .line 14
    .line 15
    const-string p2, "facebook_userinfo"

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p2, v0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/fe;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/fe;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public Z0(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->wechat:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const-string p0, "wechat"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->qq:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 11
    .line 12
    if-ne p0, p1, :cond_1

    .line 13
    .line 14
    const-string p0, "qq"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->nopassword:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 18
    .line 19
    if-eq p0, p1, :cond_5

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 22
    .line 23
    if-ne p0, p1, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 27
    .line 28
    if-ne p0, p1, :cond_3

    .line 29
    .line 30
    const-string p0, "facebook"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 34
    .line 35
    if-ne p0, p1, :cond_4

    .line 36
    .line 37
    const-string p0, "phone_oneclick"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_4
    const-string p0, ""

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_5
    :goto_0
    const-string p0, "phone_code"

    .line 44
    .line 45
    return-object p0
.end method

.method public a1()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/se;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/se;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "get_register_name"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final a2(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/api/a$a;->a:[I

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    aget p1, v0, p1

    .line 10
    .line 11
    const-string v0, "name-saved"

    .line 12
    .line 13
    const-string v1, "gender-saved"

    .line 14
    .line 15
    const-string v2, "birth-saved"

    .line 16
    .line 17
    const-string v3, "verified"

    .line 18
    .line 19
    packed-switch p1, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "language-saved"

    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :pswitch_1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v0, "ethnicity-saved"

    .line 54
    .line 55
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :pswitch_2
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string v0, "intlFriendPurpose-saved"

    .line 76
    .line 77
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :pswitch_3
    const-string p1, "signup_source"

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 102
    .line 103
    const-string v0, ""

    .line 104
    .line 105
    if-nez p0, :cond_0

    .line 106
    .line 107
    move-object p0, v0

    .line 108
    :cond_0
    const-string v1, "phone_num"

    .line 109
    .line 110
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const-string p1, "e_signup_success"

    .line 119
    .line 120
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const-string p1, "finished"

    .line 128
    .line 129
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    const-string v0, "picture-saved"

    .line 134
    .line 135
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :pswitch_4
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-static {v2}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :pswitch_5
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :pswitch_6
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :pswitch_7
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-static {v2}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    filled-new-array {v2, v0, v1}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :pswitch_8
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    const/4 v0, 0x0

    .line 244
    new-array v0, v0, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 245
    .line 246
    invoke-virtual {p0, p1, v0}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    nop

    .line 251
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b1(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/be;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/be;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "sign_in_report"

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/RiskVerification;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 7
    .line 8
    const-string v1, "ban-appeal"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/pw;->H(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    new-instance v0, Ll/uc;

    .line 32
    .line 33
    invoke-direct {v0, p1}, Ll/uc;-><init>(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Ll/si20;

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/data/VerifyDataV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    .line 40
    invoke-direct {p1, v0, v1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance p1, Ll/vc;

    .line 56
    .line 57
    invoke-direct {p1}, Ll/vc;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public c1()Lcom/p1/mobile/putong/data/SignUpData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    return-object p0
.end method

.method public c2(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->age:I

    .line 4
    .line 5
    return-void
.end method

.method public d1()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/api/a;->e1(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->i:Ll/wyd0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    return-object v0
.end method

.method public d2(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e1(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->wechat:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const-string p1, "wechat"

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->qq:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    const-string p1, "qq"

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->nopassword:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 18
    .line 19
    if-eq p1, v0, :cond_6

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 22
    .line 23
    if-ne p1, v0, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 27
    .line 28
    if-ne p1, v0, :cond_3

    .line 29
    .line 30
    const-string p1, "facebook"

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 34
    .line 35
    if-ne p1, v0, :cond_4

    .line 36
    .line 37
    const-string p1, "phone_oneclick"

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->email:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 41
    .line 42
    if-ne p1, v0, :cond_5

    .line 43
    .line 44
    const-string p1, "mail"

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_5
    const-string p1, ""

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_6
    :goto_0
    const-string p1, "phone_code"

    .line 51
    .line 52
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_7

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->i:Ll/wyd0;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_7
    return-object p1
.end method

.method public e2(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 8
    .line 9
    return-void
.end method

.method public f1()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "users/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ge;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/ge;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {p0, v0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public f2(Lcom/p1/mobile/putong/data/Gender;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    return-void
.end method

.method public g1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ixd0;->c()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/xe;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/xe;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/ye;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/ye;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public g2(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 4
    .line 5
    iput p2, p0, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 6
    .line 7
    return-void
.end method

.method public h1(Lcom/p1/mobile/putong/data/Profile;Lcom/p1/mobile/putong/data/StepSignupStage;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Profile;",
            "Lcom/p1/mobile/putong/data/StepSignupStage;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Profile;->toJson()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "onlyShowAboutMeInside"

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string p1, "profile"

    .line 21
    .line 22
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    new-instance p1, Ll/qf;

    .line 26
    .line 27
    invoke-direct {p1, v0, p2}, Ll/qf;-><init>(Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 28
    .line 29
    .line 30
    const-string p2, "intl_patch_profile"

    .line 31
    .line 32
    const/4 v0, -0x1

    .line 33
    invoke-virtual {p0, p2, v0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public h2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public i2(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    return-void
.end method

.method public j1()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->k:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public j2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k1(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 2
    .line 3
    const-string v1, "finished"

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
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 12
    .line 13
    const-string v1, "unknown_"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 22
    .line 23
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 35
    .line 36
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 39
    .line 40
    iput-object p0, p2, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-static {p2, p0, p1}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-object p0, p0, Ll/ike;->a:Ll/wyd0;

    .line 54
    .line 55
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 65
    .line 66
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public k2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic l1(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {v0, p2}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->x2(Lcom/p1/mobile/putong/data/VerifyDataV2;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    return-object p0
.end method

.method public l2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m1(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {v0, p2}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->x2(Lcom/p1/mobile/putong/data/VerifyDataV2;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    return-object p0
.end method

.method public m2(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic n1()Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/xi5;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public n2(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/RememberUserInfo;ZLjava/lang/Runnable;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Lcom/p1/mobile/putong/data/RememberUserInfo;",
            "Z",
            "Ljava/lang/Runnable;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/account/api/a;->U1(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/RememberUserInfo;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/kd;

    .line 14
    .line 15
    invoke-direct {p2}, Ll/kd;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/ld;

    .line 23
    .line 24
    invoke-direct {p2, p4}, Ll/ld;-><init>(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p2, Ll/md;

    .line 32
    .line 33
    invoke-direct {p2, p0}, Ll/md;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final synthetic o1(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/User;
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    const-string v0, "account"

    .line 10
    .line 11
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 12
    .line 13
    invoke-static {p1, v0, v1}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-ge v0, v2, :cond_3

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    return-object v1
.end method

.method public o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Z",
            "Ljava/lang/Runnable;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/p1/mobile/putong/account/api/a;->n2(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/RememberUserInfo;ZLjava/lang/Runnable;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final synthetic p1()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/rd;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/rd;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/sd;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/sd;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/td;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/td;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/ud;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/ud;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public p2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/wiw;->l()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/eyd0;->i()Z

    .line 7
    .line 8
    .line 9
    const-string p0, "[api]"

    .line 10
    .line 11
    const-string v0, "signout clear data"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic q1()Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/xi5;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic r1(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/User;
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    const-string v0, "account"

    .line 10
    .line 11
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 12
    .line 13
    invoke-static {p1, v0, v1}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-ge v0, v2, :cond_3

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->z2()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    return-object v1
.end method

.method public r2(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/account/ui/account/SignInAct;

    .line 2
    .line 3
    invoke-virtual {p2, p1, p0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic s1()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/qe;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qe;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/re;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/re;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public s2()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->I:Ll/xi5;

    .line 2
    .line 3
    new-instance v0, Ll/ce;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/ce;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/de;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/de;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "submit_jump_status"

    .line 24
    .line 25
    invoke-virtual {p0, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic t1(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->k:Ll/byd0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/nsb0;->x()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v2, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/account/api/a;->k:Ll/byd0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/Long;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    cmp-long v0, v2, v0

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->k:Ll/byd0;

    .line 42
    .line 43
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 57
    .line 58
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_2

    .line 63
    .line 64
    const/4 p0, 0x2

    .line 65
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->y(I)Z

    .line 66
    .line 67
    .line 68
    :cond_2
    const-string p0, "uid"

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p0, p1}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public t2(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/AccountTestFactor;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/AccountTestGroup;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 4
    .line 5
    sget v0, Ll/uqb0;->f0:I

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    sget v2, Ll/uqb0;->f0:I

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :goto_0
    invoke-virtual {p0, p1, v1}, Ll/pw;->O(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final synthetic u1(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->k:Ll/byd0;

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/nsb0;->x()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public u2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "clientId"

    .line 7
    .line 8
    const-string v2, "100032"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "thirdPartyId"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    const-string p2, "thirdPartyToken"

    .line 19
    .line 20
    invoke-virtual {v0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string p2, "thirdPartyType"

    .line 24
    .line 25
    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    new-instance p1, Lorg/json/JSONObject;

    .line 35
    .line 36
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string p2, "thirdPartyEmail"

    .line 40
    .line 41
    invoke-virtual {p1, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string p2, "extra"

    .line 45
    .line 46
    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    :catch_0
    :cond_0
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string p2, "/thirdparty/bind"

    .line 54
    .line 55
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p1, p2, p3}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance p2, Ll/sc;

    .line 64
    .line 65
    invoke-direct {p2, v0}, Ll/sc;-><init>(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ll/tc;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Ll/tc;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public final synthetic v1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {v0, p2}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->y2(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    return-object p0
.end method

.method public v2(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ll/pw;->P(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance p2, Ll/od;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/od;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/pd;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/pd;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic w1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 13
    .line 14
    return-object p0
.end method

.method public w2(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "clientId"

    .line 7
    .line 8
    const-string v2, "100032"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "type"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :catch_0
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v1, "/account/unbind"

    .line 23
    .line 24
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {p1, v1, v2}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v1, Ll/te;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ll/te;-><init>(Lorg/json/JSONObject;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/ve;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/ve;-><init>(Lcom/p1/mobile/putong/account/api/a;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final synthetic x1(Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 13
    .line 14
    return-object p0
.end method

.method public final x2(Lcom/p1/mobile/putong/data/VerifyDataV2;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->queryMe()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "account"

    .line 10
    .line 11
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 12
    .line 13
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v1, Ll/kf;

    .line 34
    .line 35
    invoke-direct {v1, v0}, Ll/kf;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->refreshUser(Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic y1(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {v0, p2}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 13
    .line 14
    const-string v0, "cosmos"

    .line 15
    .line 16
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const-string v0, ""

    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    const-string p2, "phone_oneclick"

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 29
    .line 30
    const-string v1, "wechat"

    .line 31
    .line 32
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    :goto_0
    move-object p2, v1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 41
    .line 42
    const-string v1, "qq"

    .line 43
    .line 44
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 52
    .line 53
    const-string v1, "confirmation_code"

    .line 54
    .line 55
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_3

    .line 60
    .line 61
    const-string p2, "phone_code"

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 65
    .line 66
    const-string v1, "facebook"

    .line 67
    .line 68
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-eqz p2, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 76
    .line 77
    const-string v1, "password"

    .line 78
    .line 79
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_6

    .line 84
    .line 85
    iget-boolean p2, p1, Lcom/p1/mobile/putong/data/SignInData;->isSmartlock:Z

    .line 86
    .line 87
    if-eqz p2, :cond_5

    .line 88
    .line 89
    const-string p2, "smartlock"

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_5
    const-string p2, "phone_password"

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_6
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 96
    .line 97
    const-string v1, "google"

    .line 98
    .line 99
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_7

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_7
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 107
    .line 108
    const-string v1, "tantan-token"

    .line 109
    .line 110
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_8

    .line 115
    .line 116
    const-string p2, "old_tantan"

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_8
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 120
    .line 121
    const-string v1, "email"

    .line 122
    .line 123
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_9

    .line 128
    .line 129
    const-string p2, "mail"

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_9
    move-object p2, v0

    .line 133
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 134
    .line 135
    invoke-virtual {v1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_a

    .line 144
    .line 145
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 150
    .line 151
    invoke-virtual {v2}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Lcom/p1/mobile/putong/data/AuthData;

    .line 156
    .line 157
    invoke-virtual {v1, v2}, Ll/ike;->n(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 158
    .line 159
    .line 160
    :cond_a
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 161
    .line 162
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 169
    .line 170
    const-string v1, "finished"

    .line 171
    .line 172
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_b

    .line 177
    .line 178
    const-string p0, "signin_type"

    .line 179
    .line 180
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    const-string p2, "phone_num"

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    const-string p1, "e_signin_success"

    .line 197
    .line 198
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 199
    .line 200
    .line 201
    :cond_b
    const/4 p0, 0x0

    .line 202
    new-array p0, p0, [Ljava/lang/Object;

    .line 203
    .line 204
    const-string p1, "signin"

    .line 205
    .line 206
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 210
    .line 211
    return-object p0
.end method

.method public final y2(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->queryMe()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "account"

    .line 10
    .line 11
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 12
    .line 13
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v2, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 30
    .line 31
    iget p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 32
    .line 33
    iput p1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 34
    .line 35
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v1, Ll/zc;

    .line 40
    .line 41
    invoke-direct {v1, v0}, Ll/zc;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 52
    .line 53
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->refreshUser(Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/account_core/reponse_data/Token;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->l:Ll/gxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 4
    .line 5
    invoke-virtual {v1, p2}, Ll/pw;->v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {v0, p2}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    const-string p2, "signup_source"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->e1(Lcom/p1/mobile/putong/data/SignUpData;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, ""

    .line 27
    .line 28
    if-nez p2, :cond_0

    .line 29
    .line 30
    move-object p2, v0

    .line 31
    :cond_0
    const-string v1, "phone_num"

    .line 32
    .line 33
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string p2, "e_signup_success"

    .line 42
    .line 43
    invoke-static {p2, v0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    const-string p1, "af_complete_registration"

    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    new-array v0, p2, [Ljava/lang/Object;

    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v0, "af_complete_registration_"

    .line 57
    .line 58
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 64
    .line 65
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->h:Lcom/p1/mobile/putong/data/SignUpData;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    const-string p0, "unknown_"

    .line 81
    .line 82
    :goto_0
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-array p1, p2, [Ljava/lang/Object;

    .line 90
    .line 91
    invoke-static {p0, p1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 95
    .line 96
    return-object p0
.end method

.method public z2()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->o:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    const-string p0, ""

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 36
    .line 37
    return-object p0
.end method
