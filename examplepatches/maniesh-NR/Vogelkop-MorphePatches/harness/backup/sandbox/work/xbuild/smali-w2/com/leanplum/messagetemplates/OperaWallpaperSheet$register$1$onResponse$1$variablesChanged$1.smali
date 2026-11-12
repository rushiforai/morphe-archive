.class public final Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1;
.super Lcom/leanplum/callbacks/PostponableAction;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1;->variablesChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "com/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1",
        "Lcom/leanplum/callbacks/PostponableAction;",
        "run",
        "",
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

.field final synthetic $taskExecutor:Ltcl;

.field final synthetic $usageReporter:Lorm;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1;->$actionContext:Lcom/leanplum/ActionContext;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1;->$taskExecutor:Ltcl;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1;->$usageReporter:Lorm;

    invoke-direct {p0}, Lcom/leanplum/callbacks/PostponableAction;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    sget-object v0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaWallpaperSheet;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1;->$actionContext:Lcom/leanplum/ActionContext;

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1;->$taskExecutor:Ltcl;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1$onResponse$1$variablesChanged$1;->$usageReporter:Lorm;

    # invokes: Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
    invoke-static {v0, v1, v2, p0}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->access$initializeSheetRequest(Lcom/leanplum/messagetemplates/OperaWallpaperSheet;Lcom/leanplum/ActionContext;Ltcl;Lorm;)V

    return-void
.end method
