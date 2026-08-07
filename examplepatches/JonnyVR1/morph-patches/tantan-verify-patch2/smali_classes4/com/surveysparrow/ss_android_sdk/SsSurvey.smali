.class public final Lcom/surveysparrow/ss_android_sdk/SsSurvey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;
    }
.end annotation


# instance fields
.field private baseUrl:Ljava/lang/String;

.field public transient customParamsValue:[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;

.field private customVariableString:Ljava/lang/String;

.field private isThankYouRedirect:Z

.field private properties:Ljava/util/HashMap;

.field private surveyDomain:Ljava/lang/String;

.field private surveyToken:Ljava/lang/String;

.field private surveyType:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-string v0, "?"

    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customVariableString:Ljava/lang/String;

    const/4 v0, 0x1

    .line 65
    iput v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyType:I

    .line 66
    iput-boolean v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->isThankYouRedirect:Z

    .line 67
    invoke-direct {p0, p1, p2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->generateBaseUrl(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->baseUrl:Ljava/lang/String;

    .line 68
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyToken:Ljava/lang/String;

    .line 69
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyDomain:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;)V
    .locals 1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const-string v0, "?"

    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customVariableString:Ljava/lang/String;

    const/4 v0, 0x1

    .line 56
    iput v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyType:I

    .line 57
    iput-boolean v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->isThankYouRedirect:Z

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->generateBaseUrl(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->baseUrl:Ljava/lang/String;

    .line 59
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyToken:Ljava/lang/String;

    .line 60
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyDomain:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customParamsValue:[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;

    .line 62
    invoke-virtual {p0, p3}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParams([Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;Ljava/util/HashMap;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "?"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customVariableString:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyType:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->isThankYouRedirect:Z

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->generateBaseUrl(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->baseUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyToken:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyDomain:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p3, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customParamsValue:[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;

    .line 32
    .line 33
    iput-object p4, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->properties:Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {p0, p3}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParams([Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 36
    .line 37
    .line 38
    const-string p1, "langCode"

    .line 39
    .line 40
    invoke-virtual {p4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p2, "sparrowLang"

    .line 49
    .line 50
    invoke-virtual {p0, p2, p1}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private generateBaseUrl(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "https://"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, "/"

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyType:I

    .line 17
    .line 18
    const/4 p1, 0x3

    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    const/16 p0, 0x6e

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 p0, 0x73

    .line 25
    .line 26
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, "/android/"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method


# virtual methods
.method public addCustomParam(Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;
    .locals 0

    const/4 p0, 0x0

    .line 49
    throw p0
.end method

.method public addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;
    .locals 2

    .line 1
    :try_start_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "UTF-8"

    .line 6
    .line 7
    invoke-static {p2, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customVariableString:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, "="

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p1, "&"

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customVariableString:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    return-object p0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    return-object p0
.end method

.method public addCustomParams([Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;
    .locals 3

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 9
    .line 10
    .line 11
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-object p0
.end method

.method public getCustomParams()[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customParamsValue:[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyDomain:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProperties()Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->properties:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSsUrl()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->baseUrl:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->customVariableString:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getSurveyToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThankYouRedirect()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->isThankYouRedirect:Z

    .line 2
    .line 3
    return p0
.end method

.method public setSurveyType(I)Lcom/surveysparrow/ss_android_sdk/SsSurvey;
    .locals 0
    .param p1    # I
        .annotation build Lcom/surveysparrow/ss_android_sdk/SsSurvey$SurveyType;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->surveyType:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setThankYouRedirect(Z)Lcom/surveysparrow/ss_android_sdk/SsSurvey;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->isThankYouRedirect:Z

    .line 2
    .line 3
    return-object p0
.end method
