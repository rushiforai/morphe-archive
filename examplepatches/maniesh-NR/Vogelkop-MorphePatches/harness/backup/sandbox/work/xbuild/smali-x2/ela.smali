.class public final Lela;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Litm;

.field public final b:Lx1g;

.field public final c:Le2g;

.field public final d:Lvla;

.field public final e:Ll8b;

.field public final f:Lila;

.field public final g:Lezj;


# direct methods
.method public constructor <init>(Litm;Lx1g;Le2g;Lvla;Ll8b;Lila;Lezj;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lela;->a:Litm;

    iput-object p2, p0, Lela;->b:Lx1g;

    iput-object p3, p0, Lela;->c:Le2g;

    iput-object p4, p0, Lela;->d:Lvla;

    iput-object p5, p0, Lela;->e:Ll8b;

    iput-object p6, p0, Lela;->f:Lila;

    iput-object p7, p0, Lela;->g:Lezj;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 9

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const/4 v1, 0x0

    iget-object v2, p0, Lela;->a:Litm;

    if-eqz v2, :cond_f

    invoke-interface {v2}, Litm;->a()Lorb;

    move-result-object v2

    goto :goto_10

    :cond_f
    move-object v2, v1

    :goto_10
    const-string v3, "user"

    invoke-virtual {v0, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v4, "nativeColorTheme"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "nativeTopBar"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "nativeInputBox"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, p0, Lela;->b:Lx1g;

    iget-object v4, v4, Lx1g;->a:Ljava/lang/Boolean;

    const-string v5, "supportsLoginWithGoogle"

    invoke-virtual {v2, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsMessageAnimationAPI"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsStartSpeechOutput"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsImageActions"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsImageMenuAction"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsLoginWithContext"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsLoggedInAccounts"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsSandboxedAccounts"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "supportsInputBoxAction"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v5, "supportsNativeContextMenu"

    invoke-virtual {v2, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "supportsInputBoxFloat"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "supportsFileAPI"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "supportsHideInputBox"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "supportsOpenSourcesInTabGroup"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "supportsChatHistory"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "supportsStartSpeechOutputV2"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "capabilities"

    invoke-virtual {v0, v2, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    const-string v5, "sia"

    invoke-virtual {v2, v4, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, p0, Lela;->c:Le2g;

    iget-object v6, v5, Le2g;->a:Ljava/lang/Boolean;

    const-string v7, "privateMode"

    invoke-virtual {v2, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, v5, Le2g;->b:Ljava/lang/Boolean;

    const-string v7, "conversationChips"

    invoke-virtual {v2, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, v5, Le2g;->c:Ljava/lang/Boolean;

    const-string v7, "trackUserGeoData"

    invoke-virtual {v2, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, v5, Le2g;->d:Ljava/lang/Boolean;

    const-string v7, "trackUserResponse"

    invoke-virtual {v2, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, v5, Le2g;->e:Ljava/lang/Boolean;

    const-string v6, "initilizeWithSearchChat"

    invoke-virtual {v2, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "alwaysShowImageSuggestions"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "isShowInputBoxGradientEnabled"

    invoke-virtual {v2, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "enableOneAIBackend"

    invoke-virtual {v2, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "enableOneAIRenderer"

    invoke-virtual {v2, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "settings"

    invoke-virtual {v0, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object v3, p0, Lela;->d:Lvla;

    iget-object v3, v3, Lvla;->a:Ljava/lang/Boolean;

    const-string v4, "hasConsentedToAriaTermsAndConditions"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "statuses"

    invoke-virtual {v0, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object v3, p0, Lela;->e:Ll8b;

    iget-wide v4, v3, Ll8b;->a:J

    const-string v6, "height"

    invoke-virtual {v2, v4, v5, v6}, Lorb;->o(JLjava/lang/String;)V

    iget-object v3, v3, Ll8b;->b:Lnla;

    sget-object v4, Lnla;->b:Lnla;

    if-eq v3, v4, :cond_146

    iget-object v3, v3, Lnla;->a:Ljava/lang/String;

    const-string v4, "status"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v3, Lmla;->a:Lmla;

    const-string v3, "text"

    const-string v5, "mode"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "inputBoxState"

    invoke-virtual {v0, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    sget-object v3, Lkla;->a:Lkla;

    const-string v3, "ofa"

    const-string v5, "product"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "host"

    invoke-virtual {v0, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lela;->g:Lezj;

    if-eqz p0, :cond_140

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object p0, p0, Lezj;->a:Ltla;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object p0, p0, Ltla;->a:Ljava/lang/String;

    const-string v3, "streamId"

    invoke-virtual {v2, p0, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p0, Lula;->a:Lula;

    const-string p0, "playing"

    invoke-virtual {v2, p0, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "activeStream"

    invoke-virtual {v1, v2, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_140
    const-string p0, "speechState"

    invoke-virtual {v0, v1, p0}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :cond_146
    const-string p0, "Undefined"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_50

    instance-of v0, p1, Lela;

    if-eqz v0, :cond_4e

    check-cast p1, Lela;

    iget-object v0, p0, Lela;->a:Litm;

    iget-object v1, p1, Lela;->a:Litm;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lela;->b:Lx1g;

    iget-object v1, p1, Lela;->b:Lx1g;

    invoke-virtual {v0, v1}, Lx1g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lela;->c:Le2g;

    iget-object v1, p1, Lela;->c:Le2g;

    invoke-virtual {v0, v1}, Le2g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lela;->d:Lvla;

    iget-object v1, p1, Lela;->d:Lvla;

    invoke-virtual {v0, v1}, Lvla;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lela;->e:Ll8b;

    iget-object v1, p1, Lela;->e:Ll8b;

    invoke-virtual {v0, v1}, Ll8b;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lela;->f:Lila;

    iget-object v1, p1, Lela;->f:Lila;

    invoke-virtual {v0, v1}, Lila;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object p0, p0, Lela;->g:Lezj;

    iget-object p1, p1, Lela;->g:Lezj;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_50

    :cond_4e
    const/4 p0, 0x0

    return p0

    :cond_50
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Lela;->a:Litm;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_b
    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lela;->b:Lx1g;

    invoke-virtual {v2}, Lx1g;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lela;->c:Le2g;

    invoke-virtual {v1}, Le2g;->hashCode()I

    move-result v1

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lela;->d:Lvla;

    iget-object v2, v2, Lvla;->a:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lela;->e:Ll8b;

    invoke-virtual {v1}, Ll8b;->hashCode()I

    move-result v1

    add-int/2addr v1, v2

    mul-int/lit16 v1, v1, 0x3c1

    sget-object v2, Lkla;->a:Lkla;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object p0, p0, Lela;->g:Lezj;

    if-eqz p0, :cond_46

    iget-object p0, p0, Lezj;->a:Ltla;

    invoke-virtual {p0}, Ltla;->hashCode()I

    move-result v0

    :cond_46
    add-int/2addr v2, v0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HostState(user="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lela;->a:Litm;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", capabilities="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lela;->b:Lx1g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", settings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lela;->c:Le2g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", statuses="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lela;->d:Lvla;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", inputBoxState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lela;->e:Ll8b;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", uiInsets=null, host="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lela;->f:Lila;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", speechState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lela;->g:Lezj;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
