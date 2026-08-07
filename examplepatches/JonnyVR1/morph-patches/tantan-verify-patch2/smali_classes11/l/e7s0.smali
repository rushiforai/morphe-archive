.class public final Ll/e7s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s7s0;


# instance fields
.field public final synthetic a:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Ll/t7s0;Landroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/e7s0;->a:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7s0;->a:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityResumed(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
