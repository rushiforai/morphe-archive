.class public final Lfnn;
.super Lphi;
.source "SourceFile"


# instance fields
.field public final d:Lpjn;


# direct methods
.method public constructor <init>(Lpjn;)V
    .registers 4

    new-instance v0, Ltu;

    const/16 v1, 0xc

    invoke-direct {v0, p1, v1}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, v0}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    iput-object p1, p0, Lfnn;->d:Lpjn;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    sget-object p2, Lphi;->c:Ljava/util/HashSet;

    invoke-virtual {p2, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    instance-of p2, p1, Looe;

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object p0, p0, Lfnn;->d:Lpjn;

    if-eqz p2, :cond_26

    check-cast p1, Looe;

    iget p1, p1, Looe;->a:I

    const/16 p2, 0x194

    if-ne p1, p2, :cond_26

    iget-object p1, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p1, Lqjn;

    iput-object v1, p1, Lqjn;->g:Landroid/graphics/Bitmap;

    new-instance p2, Lzmn;

    invoke-direct {p2, v0}, Lzmn;-><init>(B)V

    iput-object p2, p1, Lqjn;->h:Ldnn;

    invoke-virtual {p0}, Lpjn;->n()V

    return-void

    :cond_26
    iget-object p1, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p1, Lqjn;

    iput-object v1, p1, Lqjn;->g:Landroid/graphics/Bitmap;

    new-instance p2, Lbnn;

    invoke-direct {p2, p1}, Lbnn;-><init>(Lqjn;)V

    iput-object p2, p1, Lqjn;->h:Ldnn;

    invoke-virtual {p0}, Lpjn;->n()V

    iget-boolean p2, p1, Lqjn;->i:Z

    if-eqz p2, :cond_4c

    iget-boolean p2, p1, Lqjn;->j:Z

    if-nez p2, :cond_4c

    iput-boolean v0, p1, Lqjn;->j:Z

    new-instance p1, Ly1n;

    const/16 p2, 0x15

    invoke-direct {p1, p0, p2}, Ly1n;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v0, 0x1388

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_4c
    return-void
.end method
