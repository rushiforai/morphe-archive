.class public final Letc;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# instance fields
.field public final a:Lnrl;

.field public final b:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    filled-new-array {v0}, [Landroid/graphics/drawable/ColorDrawable;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Letc;->a:Lnrl;

    iget-boolean v0, v0, Lnrl;->a:Z

    iput-boolean v0, p0, Letc;->b:Z

    return-void
.end method
