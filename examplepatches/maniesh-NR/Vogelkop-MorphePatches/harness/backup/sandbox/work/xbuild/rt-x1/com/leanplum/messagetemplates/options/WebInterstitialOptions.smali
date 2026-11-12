.class public Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private actionContext:Lcom/leanplum/ActionContext;

.field private closeUrl:Ljava/lang/String;

.field private hasDismissButton:Z

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "URL"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->setUrl(Ljava/lang/String;)V

    const-string v0, "Has dismiss button"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->booleanNamed(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->setHasDismissButton(Z)V

    const-string v0, "Close URL"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->setCloseUrl(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->actionContext:Lcom/leanplum/ActionContext;

    return-void
.end method

.method private setCloseUrl(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->closeUrl:Ljava/lang/String;

    return-void
.end method

.method private setHasDismissButton(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->hasDismissButton:Z

    return-void
.end method

.method private setUrl(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->url:Ljava/lang/String;

    return-void
.end method

.method public static toArgs()Lcom/leanplum/ActionArgs;
    .registers 3

    new-instance v0, Lcom/leanplum/ActionArgs;

    invoke-direct {v0}, Lcom/leanplum/ActionArgs;-><init>()V

    const-string v1, "URL"

    const-string v2, "http://www.example.com"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Close URL"

    const-string v2, "http://leanplum/close"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Has dismiss button"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public dismiss()V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->actionContext:Lcom/leanplum/ActionContext;

    const-string v0, "Dismiss action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runActionNamed(Ljava/lang/String;)V

    return-void
.end method

.method public getCloseUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->closeUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->url:Ljava/lang/String;

    return-object p0
.end method

.method public hasDismissButton()Z
    .registers 1

    iget-boolean p0, p0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->hasDismissButton:Z

    return p0
.end method
