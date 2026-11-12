.class public Ldo4;
.super Lomd;
.source "SourceFile"

# interfaces
.implements Lucl;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lomd;-><init>()V

    return-void
.end method


# virtual methods
.method public final h0(Landroid/content/Context;)Lnmd;
    .registers 5

    new-instance v0, Lco4;

    invoke-virtual {p0}, Landroidx/fragment/app/i;->getTheme()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v1, v2}, Lco4;-><init>(Lomd;Landroid/content/Context;IB)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-object v0
.end method
