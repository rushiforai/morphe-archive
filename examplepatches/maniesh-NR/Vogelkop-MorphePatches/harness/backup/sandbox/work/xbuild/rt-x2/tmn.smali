.class public final Ltmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# instance fields
.field public final a:Lqjn;

.field public b:Z

.field public final synthetic c:Lks3;


# direct methods
.method public constructor <init>(Lks3;Lqjn;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltmn;->c:Lks3;

    iput-object p2, p0, Ltmn;->a:Lqjn;

    invoke-virtual {p2}, Lqjn;->b()Z

    move-result p1

    iput-boolean p1, p0, Ltmn;->b:Z

    return-void
.end method


# virtual methods
.method public final invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-boolean p1, p0, Ltmn;->b:Z

    iget-object v0, p0, Ltmn;->a:Lqjn;

    if-nez p1, :cond_e

    invoke-virtual {v0}, Lqjn;->b()Z

    move-result p1

    if-eqz p1, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    invoke-virtual {v0}, Lqjn;->b()Z

    move-result v0

    iput-boolean v0, p0, Ltmn;->b:Z

    if-eqz p1, :cond_1c

    iget-object p0, p0, Ltmn;->c:Lks3;

    invoke-virtual {p0}, Lks3;->r()V

    :cond_1c
    return-void
.end method

.method public final scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5

    return-void
.end method

.method public final unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3

    return-void
.end method
