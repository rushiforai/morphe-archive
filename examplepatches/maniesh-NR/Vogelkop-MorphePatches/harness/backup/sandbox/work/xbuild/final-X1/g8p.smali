.class public final Lg8p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Looo;


# instance fields
.field public a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lt8p;


# direct methods
.method public constructor <init>(Lt8p;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg8p;->c:Lt8p;

    iput-object p2, p0, Lg8p;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lg8p;->c:Lt8p;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lt8p;->G:Z

    return-void
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lg8p;->a:Landroid/view/View;

    iget-object v1, p0, Lg8p;->b:Landroid/view/View;

    if-ne v1, v0, :cond_d

    iget-object p0, p0, Lg8p;->c:Lt8p;

    iget-object p0, p0, Laoo;->c:Lami;

    invoke-virtual {p0, v1}, Lami;->a(Landroid/view/View;)V

    :cond_d
    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d()Ljava/lang/Integer;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final f()Z
    .registers 1

    iget-object p0, p0, Lg8p;->c:Lt8p;

    iget-boolean p0, p0, Lt8p;->G:Z

    return p0
.end method

.method public final g()I
    .registers 1

    const/16 p0, 0x7d0

    return p0
.end method

.method public final h()I
    .registers 1

    const/16 p0, 0x32

    return p0
.end method

.method public final i(Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x2

    iget-object v1, p0, Lg8p;->c:Lt8p;

    invoke-virtual {v1, v0}, Laoo;->u(I)V

    iput-object p1, p0, Lg8p;->a:Landroid/view/View;

    iget-object p0, v1, Laoo;->o:Lsc;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Lsc;->h()V

    :cond_f
    return-void
.end method
