.class public Lcom/leanplum/messagetemplates/options/InterstitialOptions;
.super Lcom/leanplum/messagetemplates/options/BaseMessageOptions;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;-><init>(Lcom/leanplum/ActionContext;)V

    return-void
.end method

.method public static toArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;
    .registers 3

    invoke-static {p0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->toArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Message.Text"

    const-string v1, "Interstitial message goes here."

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    return-object p0
.end method
