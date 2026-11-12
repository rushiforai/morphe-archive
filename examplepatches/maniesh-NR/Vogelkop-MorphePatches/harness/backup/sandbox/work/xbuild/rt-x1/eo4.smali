.class public Leo4;
.super Lymd;
.source "SourceFile"

# interfaces
.implements Lucl;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lymd;-><init>()V

    return-void
.end method


# virtual methods
.method public final g0(Landroid/content/Context;)Landroidx/mediarouter/app/d;
    .registers 2

    new-instance p0, Landroidx/mediarouter/app/d;

    invoke-direct {p0, p1}, Landroidx/mediarouter/app/d;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-object p0
.end method
