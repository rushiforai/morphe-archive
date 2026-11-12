.class public final Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmk5;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;Lqln;Lok5;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "com/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1",
        "Lmk5;",
        "Lhjm;",
        "reason",
        "",
        "onFinished",
        "(Lhjm;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $actionContext:Lcom/leanplum/ActionContext;

.field final synthetic $avatarResourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

.field final synthetic $usageReporter:Lorm;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;->$actionContext:Lcom/leanplum/ActionContext;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;->$usageReporter:Lorm;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;->$avatarResourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinished(Lhjm;)V
    .registers 11

    sget-object v0, Lhjm;->a:Lhjm;

    if-ne p1, v0, :cond_f

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;->$actionContext:Lcom/leanplum/ActionContext;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v2, "Primary Action"

    const-wide/16 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/leanplum/ActionContext;->trackMessageEvent(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    :cond_f
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;->$usageReporter:Lorm;

    if-ne p1, v0, :cond_17

    sget-object p1, Lvb0;->b:Lvb0;

    :goto_15
    move-object v4, p1

    goto :goto_1a

    :cond_17
    sget-object p1, Lvb0;->d:Lvb0;

    goto :goto_15

    :goto_1a
    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;->$avatarResourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v7, p1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;->$actionContext:Lcom/leanplum/ActionContext;

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v8

    move-object v2, v1

    check-cast v2, Lx5f;

    sget-object v3, Lgg0;->f:Lgg0;

    const-wide/16 v5, 0x1

    invoke-virtual/range {v2 .. v8}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    return-void
.end method
