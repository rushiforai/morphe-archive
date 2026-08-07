.class final Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/molive/apm/ApmPlugin;-><init>(Ll/hr60;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Landroid/os/Handler$Callback;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Landroid/os/Handler$Callback;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/molive/apm/ApmPlugin;


# direct methods
.method public constructor <init>(Lcom/immomo/molive/apm/ApmPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Landroid/os/Handler$Callback;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;-><init>(Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->invoke()Landroid/os/Handler$Callback;

    move-result-object p0

    return-object p0
.end method
