.class public final Lwr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lacl;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I

.field public final synthetic e:Lyr8;


# direct methods
.method public constructor <init>(Lyr8;ZZLjava/lang/String;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lwr8;->a:Z

    iput-boolean p3, p0, Lwr8;->b:Z

    iput-object p4, p0, Lwr8;->c:Ljava/lang/String;

    iput p5, p0, Lwr8;->d:I

    iput-object p1, p0, Lwr8;->e:Lyr8;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    iget-object p1, p0, Lwr8;->e:Lyr8;

    iget-object p2, p1, Lyr8;->b:Lxr8;

    iget-boolean v0, p0, Lwr8;->a:Z

    if-eqz v0, :cond_1f

    invoke-interface {p2}, Lxr8;->c()Z

    move-result v0

    iget-boolean v1, p0, Lwr8;->b:Z

    if-eqz v0, :cond_13

    invoke-virtual {p1, v1}, Lyr8;->g(Z)V

    :cond_13
    invoke-interface {p2}, Lxr8;->h()V

    iget p2, p0, Lwr8;->d:I

    const/4 v0, 0x0

    iget-object p0, p0, Lwr8;->c:Ljava/lang/String;

    invoke-virtual {p1, p2, p0, v1, v0}, Lyr8;->b(ILjava/lang/String;ZZ)V

    return-void

    :cond_1f
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lyr8;->d(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method public final c(Landroid/graphics/Bitmap;I)V
    .registers 3

    iget-object p0, p0, Lwr8;->e:Lyr8;

    invoke-virtual {p0, p1}, Lyr8;->d(Landroid/graphics/Bitmap;)V

    return-void
.end method
