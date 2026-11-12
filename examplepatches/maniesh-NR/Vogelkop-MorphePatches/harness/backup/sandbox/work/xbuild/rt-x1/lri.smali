.class public final synthetic Llri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:Lmri;

.field public final synthetic b:Leri;

.field public final synthetic c:I

.field public final synthetic d:Landroid/view/MenuItem;


# direct methods
.method public synthetic constructor <init>(Lmri;Leri;ILandroid/view/MenuItem;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llri;->a:Lmri;

    iput-object p2, p0, Llri;->b:Leri;

    iput p3, p0, Llri;->c:I

    iput-object p4, p0, Llri;->d:Landroid/view/MenuItem;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-object p1, p0, Llri;->a:Lmri;

    iget-object p1, p1, Lo73;->a:Ldkf;

    iget-object v0, p0, Llri;->b:Leri;

    iget v1, p0, Llri;->c:I

    invoke-static {v0, p1, v1}, Leti;->d(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p1

    iget-object p0, p0, Llri;->d:Landroid/view/MenuItem;

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-void
.end method
