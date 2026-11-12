.class public Lcom/leanplum/messagetemplates/actions/WebInterstitialMessage;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/messagetemplates/MessageTemplate;


# static fields
.field private static final WEB_INTERSTITIAL:Ljava/lang/String; = "Web Interstitial"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createActionArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-static {}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->toArgs()Lcom/leanplum/ActionArgs;

    move-result-object p0

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-string p0, "Web Interstitial"

    return-object p0
.end method

.method public handleAction(Lcom/leanplum/ActionContext;)V
    .registers 3

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    if-eqz p0, :cond_19

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_19

    new-instance v0, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;

    invoke-direct {v0, p1}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;-><init>(Lcom/leanplum/ActionContext;)V

    new-instance p1, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;

    invoke-direct {p1, p0, v0}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;-><init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    :cond_19
    return-void
.end method
