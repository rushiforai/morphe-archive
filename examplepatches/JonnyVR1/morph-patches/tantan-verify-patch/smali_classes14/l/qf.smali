.class public final synthetic Ll/qf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Lcom/p1/mobile/putong/data/StepSignupStage;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/StepSignupStage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qf;->a:Lorg/json/JSONObject;

    iput-object p2, p0, Ll/qf;->b:Lcom/p1/mobile/putong/data/StepSignupStage;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qf;->a:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/qf;->b:Lcom/p1/mobile/putong/data/StepSignupStage;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/account/api/a;->p(Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/StepSignupStage;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
