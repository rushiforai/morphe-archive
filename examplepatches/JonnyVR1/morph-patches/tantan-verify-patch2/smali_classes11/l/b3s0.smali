.class public final Ll/b3s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/i3s0;


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Ll/j3s0;Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/b3s0;->a:Landroid/app/Activity;

    .line 2
    .line 3
    iput-object p3, p0, Ll/b3s0;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b3s0;->a:Landroid/app/Activity;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b3s0;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-interface {p1, v0, p0}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
