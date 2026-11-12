.class public abstract Lesc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lacl;


# instance fields
.field public final a:Lfnn;


# direct methods
.method public constructor <init>(Lfnn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lesc;->a:Lfnn;

    sget-object p1, Lfsc;->a:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 4

    iget-object v0, p0, Lesc;->a:Lfnn;

    invoke-virtual {v0, p1, p2}, Lfnn;->a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V

    sget-object p1, Lfsc;->a:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iget-object p0, p0, Lesc;->a:Lfnn;

    invoke-virtual {p0, p1}, Lphi;->b(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final c(Landroid/graphics/Bitmap;I)V
    .registers 4

    iget-object v0, p0, Lesc;->a:Lfnn;

    invoke-virtual {v0, p1, p2}, Lphi;->c(Landroid/graphics/Bitmap;I)V

    sget-object p1, Lfsc;->a:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Lesc;

    if-eqz v0, :cond_e

    check-cast p1, Lesc;

    iget-object p1, p1, Lesc;->a:Lfnn;

    iget-object p0, p0, Lesc;->a:Lfnn;

    if-ne p1, p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lesc;->a:Lfnn;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method
