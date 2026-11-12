.class public final Lnya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lacl;


# instance fields
.field public final a:Lmya;

.field public b:Z

.field public c:Z


# direct methods
.method public constructor <init>(Lmya;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnya;->a:Lmya;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    const/4 p2, 0x1

    iput-boolean p2, p0, Lnya;->c:Z

    sget-object v0, Loya;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    instance-of v0, p1, Looe;

    const/4 v1, 0x2

    iget-object p0, p0, Lnya;->a:Lmya;

    if-eqz v0, :cond_1f

    check-cast p1, Looe;

    iget p1, p1, Looe;->a:I

    const/16 v0, 0x1f4

    if-lt p1, v0, :cond_1b

    invoke-interface {p0, v1}, Lmya;->u(I)V

    return-void

    :cond_1b
    invoke-interface {p0, p2}, Lmya;->u(I)V

    return-void

    :cond_1f
    instance-of p1, p1, Ljava/io/IOException;

    if-eqz p1, :cond_27

    invoke-interface {p0, v1}, Lmya;->u(I)V

    return-void

    :cond_27
    invoke-interface {p0, p2}, Lmya;->u(I)V

    return-void
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method public final c(Landroid/graphics/Bitmap;I)V
    .registers 4

    const/4 p2, 0x1

    iput-boolean p2, p0, Lnya;->c:Z

    sget-object v0, Loya;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-boolean v0, p0, Lnya;->b:Z

    xor-int/2addr v0, p2

    iget-object p0, p0, Lnya;->a:Lmya;

    invoke-interface {p0, p1, v0}, Lmya;->m(Landroid/graphics/Bitmap;Z)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 2

    if-ne p1, p0, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
