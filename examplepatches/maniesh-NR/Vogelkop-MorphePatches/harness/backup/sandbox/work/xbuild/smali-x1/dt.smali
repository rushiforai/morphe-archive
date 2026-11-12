.class public final Ldt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lacl;


# instance fields
.field public final synthetic a:Let;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I


# direct methods
.method public constructor <init>(Let;ZLjava/lang/String;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldt;->a:Let;

    iput-boolean p2, p0, Ldt;->b:Z

    iput-object p3, p0, Ldt;->c:Ljava/lang/String;

    iput p4, p0, Ldt;->d:I

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 4

    iget-boolean p1, p0, Ldt;->b:Z

    iget-object p2, p0, Ldt;->a:Let;

    if-eqz p1, :cond_15

    invoke-virtual {p2}, Let;->w()V

    invoke-virtual {p2}, Lfr8;->l()V

    iget p1, p0, Ldt;->d:I

    const/4 v0, 0x0

    iget-object p0, p0, Ldt;->c:Ljava/lang/String;

    invoke-virtual {p2, p1, p0, v0}, Let;->t(ILjava/lang/String;Z)V

    return-void

    :cond_15
    const/4 p0, 0x0

    invoke-virtual {p2, p0}, Let;->u(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method public final c(Landroid/graphics/Bitmap;I)V
    .registers 3

    iget-object p0, p0, Ldt;->a:Let;

    invoke-virtual {p0, p1}, Let;->u(Landroid/graphics/Bitmap;)V

    return-void
.end method
