.class public final synthetic Landroidx/lifecycle/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# instance fields
.field public final synthetic a:Ll/el90;


# direct methods
.method public synthetic constructor <init>(Ll/el90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/h;->a:Ll/el90;

    return-void
.end method


# virtual methods
.method public final onStateChanged(Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/lifecycle/h;->a:Ll/el90;

    invoke-static {p0, p1, p2}, Landroidx/lifecycle/LifecycleKt$eventFlow$1;->j(Ll/el90;Ll/ker;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void
.end method
