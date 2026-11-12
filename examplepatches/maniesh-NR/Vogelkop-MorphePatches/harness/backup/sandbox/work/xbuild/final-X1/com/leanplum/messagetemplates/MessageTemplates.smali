.class public Lcom/leanplum/messagetemplates/MessageTemplates;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static customizer:Lcom/leanplum/messagetemplates/DialogCustomizer;

.field private static registered:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createCallback(Lcom/leanplum/messagetemplates/MessageTemplate;)Lcom/leanplum/callbacks/ActionCallback;
    .registers 2
    .param p0    # Lcom/leanplum/messagetemplates/MessageTemplate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/messagetemplates/MessageTemplates$1;

    invoke-direct {v0, p0}, Lcom/leanplum/messagetemplates/MessageTemplates$1;-><init>(Lcom/leanplum/messagetemplates/MessageTemplate;)V

    return-object v0
.end method

.method private static createCallbackWaitVarsAndFiles(Lcom/leanplum/messagetemplates/MessageTemplate;)Lcom/leanplum/callbacks/ActionCallback;
    .registers 2
    .param p0    # Lcom/leanplum/messagetemplates/MessageTemplate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/messagetemplates/MessageTemplates$2;

    invoke-direct {v0, p0}, Lcom/leanplum/messagetemplates/MessageTemplates$2;-><init>(Lcom/leanplum/messagetemplates/MessageTemplate;)V

    return-object v0
.end method

.method public static getCustomizer()Lcom/leanplum/messagetemplates/DialogCustomizer;
    .registers 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/leanplum/messagetemplates/MessageTemplates;->customizer:Lcom/leanplum/messagetemplates/DialogCustomizer;

    return-object v0
.end method

.method public static declared-synchronized register(Landroid/content/Context;)V
    .registers 3

    const-class v0, Lcom/leanplum/messagetemplates/MessageTemplates;

    monitor-enter v0

    :try_start_3
    sget-boolean v1, Lcom/leanplum/messagetemplates/MessageTemplates;->registered:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_40

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    const/4 v1, 0x1

    :try_start_a
    sput-boolean v1, Lcom/leanplum/messagetemplates/MessageTemplates;->registered:Z

    new-instance v1, Lcom/leanplum/messagetemplates/actions/OpenUrlAction;

    invoke-direct {v1}, Lcom/leanplum/messagetemplates/actions/OpenUrlAction;-><init>()V

    invoke-static {v1, p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->registerAction(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V

    new-instance v1, Lcom/leanplum/messagetemplates/actions/AlertMessage;

    invoke-direct {v1}, Lcom/leanplum/messagetemplates/actions/AlertMessage;-><init>()V

    invoke-static {v1, p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->registerTemplate(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V

    new-instance v1, Lcom/leanplum/messagetemplates/actions/ConfirmMessage;

    invoke-direct {v1}, Lcom/leanplum/messagetemplates/actions/ConfirmMessage;-><init>()V

    invoke-static {v1, p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->registerTemplate(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V

    new-instance v1, Lcom/leanplum/messagetemplates/actions/CenterPopupMessage;

    invoke-direct {v1}, Lcom/leanplum/messagetemplates/actions/CenterPopupMessage;-><init>()V

    invoke-static {v1, p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->registerTemplate(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V

    new-instance v1, Lcom/leanplum/messagetemplates/actions/InterstitialMessage;

    invoke-direct {v1}, Lcom/leanplum/messagetemplates/actions/InterstitialMessage;-><init>()V

    invoke-static {v1, p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->registerTemplate(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V

    new-instance v1, Lcom/leanplum/messagetemplates/actions/WebInterstitialMessage;

    invoke-direct {v1}, Lcom/leanplum/messagetemplates/actions/WebInterstitialMessage;-><init>()V

    invoke-static {v1, p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->registerTemplate(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V
    :try_end_3c
    .catchall {:try_start_a .. :try_end_3c} :catchall_40

    monitor-exit v0

    return-void

    :goto_3e
    :try_start_3e
    monitor-exit v0
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_40

    throw p0

    :catchall_40
    move-exception p0

    goto :goto_3e
.end method

.method private static register(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;I)V
    .registers 5
    .param p0    # Lcom/leanplum/messagetemplates/MessageTemplate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 66
    invoke-interface {p0}, Lcom/leanplum/messagetemplates/MessageTemplate;->getName()Ljava/lang/String;

    move-result-object v0

    .line 67
    invoke-interface {p0, p1}, Lcom/leanplum/messagetemplates/MessageTemplate;->createActionArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;

    move-result-object p1

    .line 68
    invoke-interface {p0}, Lcom/leanplum/messagetemplates/MessageTemplate;->waitFilesAndVariables()Z

    move-result v1

    if-nez v1, :cond_19

    invoke-virtual {p1}, Lcom/leanplum/ActionArgs;->containsFile()Z

    move-result v1

    if-nez v1, :cond_19

    .line 69
    invoke-static {p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->createCallback(Lcom/leanplum/messagetemplates/MessageTemplate;)Lcom/leanplum/callbacks/ActionCallback;

    move-result-object p0

    goto :goto_1d

    .line 70
    :cond_19
    invoke-static {p0}, Lcom/leanplum/messagetemplates/MessageTemplates;->createCallbackWaitVarsAndFiles(Lcom/leanplum/messagetemplates/MessageTemplate;)Lcom/leanplum/callbacks/ActionCallback;

    move-result-object p0

    .line 71
    :goto_1d
    invoke-static {v0, p2, p1, p0}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method

.method public static registerAction(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V
    .registers 3
    .param p0    # Lcom/leanplum/messagetemplates/MessageTemplate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x2

    invoke-static {p0, p1, v0}, Lcom/leanplum/messagetemplates/MessageTemplates;->register(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;I)V

    return-void
.end method

.method public static registerTemplate(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;)V
    .registers 3
    .param p0    # Lcom/leanplum/messagetemplates/MessageTemplate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x3

    invoke-static {p0, p1, v0}, Lcom/leanplum/messagetemplates/MessageTemplates;->register(Lcom/leanplum/messagetemplates/MessageTemplate;Landroid/content/Context;I)V

    return-void
.end method

.method public static setCustomizer(Lcom/leanplum/messagetemplates/DialogCustomizer;)V
    .registers 1

    sput-object p0, Lcom/leanplum/messagetemplates/MessageTemplates;->customizer:Lcom/leanplum/messagetemplates/DialogCustomizer;

    return-void
.end method
