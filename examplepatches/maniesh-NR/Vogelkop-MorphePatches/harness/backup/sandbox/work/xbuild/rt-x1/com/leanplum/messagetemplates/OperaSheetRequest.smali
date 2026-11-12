.class public final Lcom/leanplum/messagetemplates/OperaSheetRequest;
.super Lcej;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;,
        Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;,
        Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;,
        Lcom/leanplum/messagetemplates/OperaSheetRequest$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\t\u0008\u0001\u0018\u00002\u00020\u0001:\u0003\u001c\u001d\u001eB\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ!\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0011H\u0014\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0019\u0010\u0017\u001a\u00020\u00162\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\u0019R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010\u001aR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010\u001b\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaSheetRequest;",
        "Lcej;",
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;",
        "model",
        "Lorm;",
        "usageReporter",
        "Lskm;",
        "unfilteredUsageReporter",
        "<init>",
        "(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lorm;Lskm;)V",
        "Lmej;",
        "sheetHost",
        "Lb2l;",
        "tab",
        "Ldej;",
        "createSheet",
        "(Lmej;Lb2l;)Ldej;",
        "Landroid/content/Context;",
        "context",
        "createSheetHost",
        "(Landroid/content/Context;)Lmej;",
        "activeTab",
        "",
        "isAllowed",
        "(Lb2l;)Z",
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;",
        "Lorm;",
        "Lskm;",
        "SheetType",
        "Model",
        "Button",
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


# static fields
.field public static final $stable:I = 0x8


# instance fields
.field private final model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final unfilteredUsageReporter:Lskm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final usageReporter:Lorm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lorm;Lskm;)V
    .registers 4
    .param p1    # Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lorm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lskm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->usageReporter:Lorm;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->unfilteredUsageReporter:Lskm;

    return-void
.end method

.method public static synthetic b(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaSheetRequest;->createSheet$lambda$4(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V

    return-void
.end method

.method private static final createSheet$lambda$1(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V
    .registers 12

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->usageReporter:Lorm;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v1, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->getAggroType()Lgg0;

    move-result-object v3

    iget-wide v5, p1, Loqh;->a:J

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v7, v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object v8, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    move-object v2, v0

    check-cast v2, Lx5f;

    sget-object v4, Lvb0;->b:Lvb0;

    invoke-virtual/range {v2 .. v8}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v0, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object v0, v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    if-eqz v0, :cond_31

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->unfilteredUsageReporter:Lskm;

    iget-object p1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    check-cast v1, Lx5f;

    sget-object v2, Lsj0;->c:Lsj0;

    sget-object v3, Lxn0;->b:Lxn0;

    invoke-virtual {v1, p1, v0, v2, v3}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_31
    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p2}, Ldej;->b()V

    return-void
.end method

.method private static final createSheet$lambda$3(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V
    .registers 12

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->usageReporter:Lorm;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v1, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->getAggroType()Lgg0;

    move-result-object v3

    iget-wide v5, p1, Loqh;->a:J

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v7, v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object v8, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    move-object v2, v0

    check-cast v2, Lx5f;

    sget-object v4, Lvb0;->c:Lvb0;

    invoke-virtual/range {v2 .. v8}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v0, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object v0, v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    if-eqz v0, :cond_31

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->unfilteredUsageReporter:Lskm;

    iget-object p1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    check-cast v1, Lx5f;

    sget-object v2, Lsj0;->c:Lsj0;

    sget-object v3, Lxn0;->b:Lxn0;

    invoke-virtual {v1, p1, v0, v2, v3}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_31
    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p2}, Ldej;->b()V

    return-void
.end method

.method private static final createSheet$lambda$4(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V
    .registers 12

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->usageReporter:Lorm;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v1, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->getAggroType()Lgg0;

    move-result-object v3

    iget-wide v5, p1, Loqh;->a:J

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v7, v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object v8, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    move-object v2, v0

    check-cast v2, Lx5f;

    sget-object v4, Lvb0;->c:Lvb0;

    invoke-virtual/range {v2 .. v8}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p2}, Ldej;->b()V

    return-void
.end method

.method private static final createSheet$lambda$5(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lhjm;)V
    .registers 11

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p2, v0, :cond_20

    iget-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->usageReporter:Lorm;

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v0, v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-virtual {v0}, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->getAggroType()Lgg0;

    move-result-object v2

    iget-wide v4, p1, Loqh;->a:J

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v6, p1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object v7, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    move-object v1, p2

    check-cast v1, Lx5f;

    sget-object v3, Lvb0;->d:Lvb0;

    invoke-virtual/range {v1 .. v7}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    :cond_20
    return-void
.end method

.method public static synthetic d(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaSheetRequest;->createSheet$lambda$3(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V

    return-void
.end method

.method public static synthetic e(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lhjm;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaSheetRequest;->createSheet$lambda$5(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lhjm;)V

    return-void
.end method

.method public static synthetic f(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaSheetRequest;->createSheet$lambda$1(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V

    return-void
.end method


# virtual methods
.method public createSheet(Lmej;Lb2l;)Ldej;
    .registers 10
    .param p1    # Lmej;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p2, Ltah;

    const/4 v0, 0x6

    invoke-direct {p2, v0}, Ltah;-><init>(B)V

    new-instance v0, Loqh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v2, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    const-wide/16 v3, 0x1

    if-eqz v2, :cond_18

    iget-wide v5, v0, Loqh;->a:J

    add-long/2addr v5, v3

    iput-wide v5, v0, Loqh;->a:J

    :cond_18
    iget-object v5, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    if-eqz v5, :cond_21

    iget-wide v5, v0, Loqh;->a:J

    add-long/2addr v5, v3

    iput-wide v5, v0, Loqh;->a:J

    :cond_21
    iget-object v5, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    if-eqz v5, :cond_2a

    iget-wide v5, v0, Loqh;->a:J

    add-long/2addr v5, v3

    iput-wide v5, v0, Loqh;->a:J

    :cond_2a
    iget-object v3, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    iput-object v3, p2, Ltah;->b:Ljava/lang/Object;

    iget-object v3, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    iput-object v3, p2, Ltah;->e:Ljava/lang/Object;

    iget-object v3, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v4, v3, Lcom/leanplum/messagetemplates/ResourceWrapper;->lottieComposition:Lp2d;

    if-eqz v4, :cond_3b

    iput-object v4, p2, Ltah;->d:Ljava/lang/Object;

    goto :goto_3f

    :cond_3b
    iget-object v3, v3, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    iput-object v3, p2, Ltah;->c:Ljava/lang/Object;

    :goto_3f
    sget-object v3, Lxn0;->f:Lxn0;

    sget-object v4, Lsj0;->c:Lsj0;

    if-eqz v2, :cond_62

    iget-object v2, v2, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    if-eqz v2, :cond_52

    iget-object v5, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->unfilteredUsageReporter:Lskm;

    iget-object v1, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    check-cast v5, Lx5f;

    invoke-virtual {v5, v1, v2, v4, v3}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_52
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v2, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object v2, v2, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    new-instance v5, Lxnf;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v0, v6}, Lxnf;-><init>(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;B)V

    iput-object v2, p2, Ltah;->h:Ljava/lang/Object;

    iput-object v5, p2, Ltah;->i:Ljava/lang/Object;

    :cond_62
    iget-object v2, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    if-eqz v2, :cond_83

    iget-object v2, v2, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    if-eqz v2, :cond_73

    iget-object v5, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->unfilteredUsageReporter:Lskm;

    iget-object v1, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    check-cast v5, Lx5f;

    invoke-virtual {v5, v1, v2, v4, v3}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_73
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v2, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object v2, v2, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    new-instance v3, Lxnf;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v0, v4}, Lxnf;-><init>(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;B)V

    iput-object v2, p2, Ltah;->f:Ljava/lang/Object;

    iput-object v3, p2, Ltah;->g:Ljava/lang/Object;

    :cond_83
    iget-object v1, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    if-eqz v1, :cond_8f

    new-instance v1, Lxnf;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v0, v2}, Lxnf;-><init>(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;B)V

    iput-object v1, p2, Ltah;->k:Ljava/lang/Object;

    :cond_8f
    new-instance v1, Lynf;

    invoke-direct {v1, p0, v0}, Lynf;-><init>(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;)V

    iput-object v1, p2, Ltah;->j:Ljava/lang/Object;

    new-instance p0, Lk9c;

    invoke-direct {p0, p1, p2}, Lk9c;-><init>(Lmej;Ltah;)V

    return-object p0
.end method

.method public createSheetHost(Landroid/content/Context;)Lmej;
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v0, v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    sget-object v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_21

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1c

    new-instance v0, Ls8n;

    const v2, 0x7f0407e2

    invoke-direct {v0, p1, v2}, Ls8n;-><init>(Landroid/content/Context;I)V

    move-object p1, v0

    goto :goto_21

    :cond_1c
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_21
    :goto_21
    new-instance v0, Lvq3;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest;->model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-boolean p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->fullWidthButtons:Z

    if-eqz p0, :cond_2d

    const p0, 0x7f15019c

    goto :goto_2e

    :cond_2d
    const/4 p0, 0x0

    :goto_2e
    invoke-direct {v0, p1, p0, v1}, Lvq3;-><init>(Landroid/content/Context;IZ)V

    return-object v0
.end method

.method public bridge synthetic getDefaultPriority()Lijm;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object p0, Lijm;->b:Lijm;

    return-object p0
.end method

.method public isAllowed(Lb2l;)Z
    .registers 2

    if-eqz p1, :cond_e

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method
