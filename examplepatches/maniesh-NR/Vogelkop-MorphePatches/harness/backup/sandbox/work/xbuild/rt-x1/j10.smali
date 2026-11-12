.class public final Lj10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljhb;


# instance fields
.field public final a:Lyl;


# direct methods
.method public constructor <init>(Lyl;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj10;->a:Lyl;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/BrowserActivity;Lyz;)Z
    .registers 6

    instance-of v0, p2, Lh10;

    if-eqz v0, :cond_8

    move-object v0, p2

    check-cast v0, Lh10;

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    if-eqz v0, :cond_36

    iget-object v1, v0, Lh10;->u:Lchb;

    new-instance v2, Lqb7;

    invoke-direct {v2, v0, p0, p2}, Lqb7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v2, v1, Lchb;->p:Lqb7;

    iget-object p0, v1, Lchb;->o:Lioo;

    if-eqz p0, :cond_1b

    invoke-interface {p0, v2}, Lioo;->p(Lqb7;)V

    :cond_1b
    iget-object p0, v1, Lchb;->o:Lioo;

    if-eqz p0, :cond_36

    invoke-interface {p0}, Lioo;->a()Z

    move-result p0

    if-eqz p0, :cond_36

    iget-object p0, v1, Lchb;->o:Lioo;

    if-eqz p0, :cond_34

    invoke-interface {p0}, Lioo;->b()Lbm;

    move-result-object p0

    if-nez p0, :cond_34

    iget-object p0, v1, Lchb;->o:Lioo;

    invoke-interface {p0, p1}, Lioo;->v(Lcom/opera/android/BrowserActivity;)V

    :cond_34
    const/4 p0, 0x1

    return p0

    :cond_36
    const/4 p0, 0x0

    return p0
.end method
