.class public final Lg18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxng;


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Lig;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lg18;->a:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final d()V
    .registers 1

    iget-object p0, p0, Lg18;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    if-eqz p0, :cond_d

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_d
    return-void
.end method
