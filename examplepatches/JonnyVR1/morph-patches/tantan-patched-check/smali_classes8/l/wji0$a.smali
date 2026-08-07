.class public Ll/wji0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wji0;->d0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/wji0;


# direct methods
.method public constructor <init>(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wji0$a;->d:Ll/wji0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wji0$a;->a:Lorg/json/JSONObject;

    .line 4
    .line 5
    iput-object p3, p0, Ll/wji0$a;->b:Ll/xc00;

    .line 6
    .line 7
    iput-object p4, p0, Ll/wji0$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;)V
    .locals 4

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;->prepareResult:Ll/jxf;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/wji0$a;->b:Ll/xc00;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p2, Ll/jxf;->c:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v1, p0, Ll/wji0$a;->c:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-static {p1, v0, v1, v2}, Ll/hxf;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/wji0$a;->b:Ll/xc00;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object p1, p2, Ll/jxf;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/q5l0;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    .line 39
    .line 40
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 41
    .line 42
    .line 43
    :try_start_0
    const-string v1, "code"

    .line 44
    .line 45
    const-string v2, "-1"

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    :catch_0
    const-string v1, "sdk_name"

    .line 51
    .line 52
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "verification_result_code"

    .line 59
    .line 60
    iget-object p2, p2, Ll/jxf;->c:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v2, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 67
    .line 68
    const-string v2, "identity"

    .line 69
    .line 70
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    const-string p1, "id_ability"

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const-string p1, "avatar_ability"

    .line 80
    .line 81
    :goto_0
    const-string v2, "verification_type"

    .line 82
    .line 83
    invoke-static {v2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v2, "verification_scene"

    .line 88
    .line 89
    const-string v3, "change_bind_new_phone"

    .line 90
    .line 91
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    filled-new-array {v1, p2, p1, v2}, [Ll/sfj0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const-string p2, "e_verification_scanface_sdk"

    .line 100
    .line 101
    const-string v1, "p_profile_picture_verification_pageShow"

    .line 102
    .line 103
    invoke-static {p2, v1, p1}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/wji0$a;->d:Ll/wji0;

    .line 107
    .line 108
    iget-object p0, p0, Ll/wji0$a;->a:Lorg/json/JSONObject;

    .line 109
    .line 110
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-static {p1, p0, p2}, Ll/wji0;->a0(Ll/wji0;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 3

    .line 1
    const-string p0, "sdk_name"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "verification_result_code"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "identity"

    .line 19
    .line 20
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-string p1, "id_ability"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p1, "avatar_ability"

    .line 30
    .line 31
    :goto_0
    const-string v1, "verification_type"

    .line 32
    .line 33
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v1, "verification_scene"

    .line 38
    .line 39
    const-string v2, "change_bind_new_phone"

    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    filled-new-array {p0, v0, p1, v1}, [Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "e_verification_scanface_token"

    .line 50
    .line 51
    const-string v0, "p_profile_picture_verification_pageShow"

    .line 52
    .line 53
    invoke-static {p1, v0, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)V
    .locals 2

    .line 1
    const-string p0, "sdk_name"

    .line 2
    .line 3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p2, "verification_result_code"

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p2, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "identity"

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-string p1, "id_ability"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p1, "avatar_ability"

    .line 30
    .line 31
    :goto_0
    const-string v0, "verification_type"

    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "verification_scene"

    .line 38
    .line 39
    const-string v1, "change_bind_new_phone"

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {p0, p2, p1, v0}, [Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "e_verification_scanface_sdk"

    .line 50
    .line 51
    const-string p2, "p_profile_picture_verification_pageShow"

    .line 52
    .line 53
    invoke-static {p1, p2, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public d(Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "sdk_name"

    .line 7
    .line 8
    const-string v2, ""

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 15
    .line 16
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v3, "verification_result_code"

    .line 23
    .line 24
    invoke-static {v3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v3, "verification_type"

    .line 29
    .line 30
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "verification_scene"

    .line 35
    .line 36
    const-string v4, "change_bind_new_phone"

    .line 37
    .line 38
    invoke-static {v3, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    filled-new-array {v1, p1, v2, v3}, [Ll/sfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v1, "e_verification_scanface_token"

    .line 47
    .line 48
    const-string v2, "p_profile_picture_verification_pageShow"

    .line 49
    .line 50
    invoke-static {v1, v2, p1}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 51
    .line 52
    .line 53
    :try_start_0
    const-string p1, "code"

    .line 54
    .line 55
    const-string v1, "300003"

    .line 56
    .line 57
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    :catch_0
    iget-object p1, p0, Ll/wji0$a;->d:Ll/wji0;

    .line 61
    .line 62
    iget-object p0, p0, Ll/wji0$a;->a:Lorg/json/JSONObject;

    .line 63
    .line 64
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {p1, p0, v0}, Ll/wji0;->Z(Ll/wji0;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/wji0$a;->b:Ll/xc00;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, -0x1

    .line 8
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/wji0$a;->b:Ll/xc00;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
