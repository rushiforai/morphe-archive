.class public final Ls8n;
.super Ldkf;
.source "SourceFile"


# instance fields
.field public final b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-static {p2, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Ldkf;-><init>(Landroid/content/Context;I)V

    iput p2, p0, Ls8n;->b:I

    return-void
.end method
