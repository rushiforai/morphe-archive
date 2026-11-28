.class public Landroidx/multidex/MultiDexApplication;
.super Landroid/app/Application;
.source ""


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public attachBaseContext(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    invoke-static {p0}, Ld/q/a;->b(Landroid/content/Context;)V

    return-void
.end method

.method public onCreate()V
    .registers 1

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    invoke-static {p0}, Lnicoid/network238/NetworkInit;->init(Landroid/content/Context;)V

    return-void
.end method
