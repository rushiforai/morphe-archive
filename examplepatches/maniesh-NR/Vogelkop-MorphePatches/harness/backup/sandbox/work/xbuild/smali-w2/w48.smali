.class public Lw48;
.super Luim;
.source "SourceFile"


# instance fields
.field public d:Lvs;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Luim;-><init>()V

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4

    new-instance p1, Lv48;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, v1}, Lv48;-><init>(Luim;Landroid/content/Context;B)V

    return-object p1
.end method
