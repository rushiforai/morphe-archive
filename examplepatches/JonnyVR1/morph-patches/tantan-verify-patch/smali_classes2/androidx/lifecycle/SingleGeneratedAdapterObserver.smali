.class public final Landroidx/lifecycle/SingleGeneratedAdapterObserver;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001f\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Landroidx/lifecycle/SingleGeneratedAdapterObserver;",
        "Landroidx/lifecycle/LifecycleEventObserver;",
        "Landroidx/lifecycle/d;",
        "generatedAdapter",
        "<init>",
        "(Landroidx/lifecycle/d;)V",
        "Ll/ker;",
        "source",
        "Landroidx/lifecycle/Lifecycle$Event;",
        "event",
        "",
        "onStateChanged",
        "(Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V",
        "Landroidx/lifecycle/d;",
        "lifecycle-common"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final generatedAdapter:Landroidx/lifecycle/d;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/lifecycle/d;)V
    .locals 0
    .param p1    # Landroidx/lifecycle/d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Landroidx/lifecycle/SingleGeneratedAdapterObserver;->generatedAdapter:Landroidx/lifecycle/d;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onStateChanged(Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 3
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/lifecycle/Lifecycle$Event;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Landroidx/lifecycle/SingleGeneratedAdapterObserver;->generatedAdapter:Landroidx/lifecycle/d;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-interface {v0, p1, p2, v1, v2}, Landroidx/lifecycle/d;->a(Ll/ker;Landroidx/lifecycle/Lifecycle$Event;ZLl/oa00;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Landroidx/lifecycle/SingleGeneratedAdapterObserver;->generatedAdapter:Landroidx/lifecycle/d;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-interface {p0, p1, p2, v0, v2}, Landroidx/lifecycle/d;->a(Ll/ker;Landroidx/lifecycle/Lifecycle$Event;ZLl/oa00;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
