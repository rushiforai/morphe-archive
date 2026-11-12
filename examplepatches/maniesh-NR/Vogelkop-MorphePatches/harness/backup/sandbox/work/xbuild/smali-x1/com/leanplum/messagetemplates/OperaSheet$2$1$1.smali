.class Lcom/leanplum/messagetemplates/OperaSheet$2$1$1;
.super Lcom/leanplum/callbacks/PostponableAction;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaSheet$2$1;->variablesChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;

.field final synthetic val$currentContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/OperaSheet$2$1;Landroid/content/Context;Lcom/leanplum/ActionContext;)V
    .registers 4

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1$1;->val$currentContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/leanplum/callbacks/PostponableAction;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1$1;->val$currentContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-static {v0, p0}, Lcom/leanplum/messagetemplates/OperaSheet;->i(Landroid/content/Context;Lcom/leanplum/ActionContext;)V

    return-void
.end method
