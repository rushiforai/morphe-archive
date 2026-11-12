.class public final Lcom/leanplum/messagetemplates/OperaOpenUrlAction;
.super Lcom/leanplum/messagetemplates/actions/OpenUrlAction;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001B\u0015\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0016R\u0014\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00ca\u0001\u000c\u0008\u000c\u0012\u0008\u0008\r\u0012\u0004\u0008\u0003\u0010\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaOpenUrlAction;",
        "Lcom/leanplum/messagetemplates/actions/OpenUrlAction;",
        "actionCallbacks",
        "",
        "Lcom/leanplum/callbacks/ActionCallback;",
        "<init>",
        "(Ljava/util/List;)V",
        "handleAction",
        "",
        "actionContext",
        "Lcom/leanplum/ActionContext;",
        "app",
        "Landroidx/compose/runtime/internal/StabilityInferred;",
        "parameters"
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
.field private final actionCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/leanplum/callbacks/ActionCallback;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/leanplum/callbacks/ActionCallback;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/leanplum/messagetemplates/actions/OpenUrlAction;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaOpenUrlAction;->actionCallbacks:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public handleAction(Lcom/leanplum/ActionContext;)V
    .registers 4
    .param p1    # Lcom/leanplum/ActionContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaOpenUrlAction;->actionCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/leanplum/callbacks/ActionCallback;

    invoke-virtual {v1, p1}, Lcom/leanplum/callbacks/ActionCallback;->onResponse(Lcom/leanplum/ActionContext;)Z

    move-result v1

    if-eqz v1, :cond_6

    return-void

    :cond_19
    invoke-super {p0, p1}, Lcom/leanplum/messagetemplates/actions/OpenUrlAction;->handleAction(Lcom/leanplum/ActionContext;)V

    return-void
.end method
