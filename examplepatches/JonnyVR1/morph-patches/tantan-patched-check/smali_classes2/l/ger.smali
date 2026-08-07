.class public final synthetic Ll/ger;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# instance fields
.field public final synthetic a:Landroidx/lifecycle/f;

.field public final synthetic b:Lkotlinx/coroutines/o;


# direct methods
.method public synthetic constructor <init>(Landroidx/lifecycle/f;Lkotlinx/coroutines/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ger;->a:Landroidx/lifecycle/f;

    iput-object p2, p0, Ll/ger;->b:Lkotlinx/coroutines/o;

    return-void
.end method


# virtual methods
.method public final onStateChanged(Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ger;->a:Landroidx/lifecycle/f;

    iget-object p0, p0, Ll/ger;->b:Lkotlinx/coroutines/o;

    invoke-static {v0, p0, p1, p2}, Landroidx/lifecycle/f;->a(Landroidx/lifecycle/f;Lkotlinx/coroutines/o;Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void
.end method
