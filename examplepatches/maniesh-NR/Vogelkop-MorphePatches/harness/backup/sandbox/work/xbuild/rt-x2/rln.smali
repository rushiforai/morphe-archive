.class public final Lrln;
.super Lm73;
.source "SourceFile"


# instance fields
.field public final b:Lqln;


# direct methods
.method public constructor <init>(Lqln;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrln;->b:Lqln;

    return-void
.end method


# virtual methods
.method public final l(I)V
    .registers 3

    iget-boolean v0, p0, Lm73;->a:Z

    if-nez v0, :cond_28

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lj7c;->a(II)Z

    move-result p1

    if-eqz p1, :cond_28

    iget-object p0, p0, Lrln;->b:Lqln;

    iget-object p0, p0, Lqln;->h:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqjn;

    iget-boolean p1, p0, Lqjn;->i:Z

    if-eqz p1, :cond_28

    iget-object p1, p0, Lqjn;->g:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_28

    const/4 p1, 0x0

    iput-object p1, p0, Lqjn;->h:Ldnn;

    iput-object p1, p0, Lqjn;->g:Landroid/graphics/Bitmap;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqjn;->k:Z

    invoke-virtual {p0}, Lqjn;->d()V

    :cond_28
    return-void
.end method
