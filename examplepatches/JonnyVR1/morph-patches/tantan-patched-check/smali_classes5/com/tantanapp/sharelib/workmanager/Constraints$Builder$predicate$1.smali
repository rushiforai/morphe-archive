.class final Lcom/tantanapp/sharelib/workmanager/Constraints$Builder$predicate$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/sharelib/workmanager/Constraints$Builder;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "invoke",
        "(Lcom/tantanapp/sharelib/workmanager/Constraints;)Ljava/lang/Boolean;"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantanapp/sharelib/workmanager/Constraints$Builder$predicate$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Constraints$Builder$predicate$1;

    invoke-direct {v0}, Lcom/tantanapp/sharelib/workmanager/Constraints$Builder$predicate$1;-><init>()V

    sput-object v0, Lcom/tantanapp/sharelib/workmanager/Constraints$Builder$predicate$1;->INSTANCE:Lcom/tantanapp/sharelib/workmanager/Constraints$Builder$predicate$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/tantanapp/sharelib/workmanager/Constraints;)Ljava/lang/Boolean;
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Constraints;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Constraints$Builder$predicate$1;->invoke(Lcom/tantanapp/sharelib/workmanager/Constraints;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
