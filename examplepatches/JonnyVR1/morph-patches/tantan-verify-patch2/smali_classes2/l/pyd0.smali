.class public final synthetic Ll/pyd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# instance fields
.field public final synthetic a:Ll/qyd0;


# direct methods
.method public synthetic constructor <init>(Ll/qyd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pyd0;->a:Ll/qyd0;

    return-void
.end method


# virtual methods
.method public final onStateChanged(Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pyd0;->a:Ll/qyd0;

    invoke-static {p0, p1, p2}, Ll/qyd0;->a(Ll/qyd0;Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void
.end method
