.class public final Le8l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb2l;

.field public b:I

.field public final c:Lpde;

.field public d:Z

.field public final e:Lq6l;

.field public final f:Lqlk;

.field public final synthetic g:Lj8l;


# direct methods
.method public constructor <init>(Lj8l;Lb2l;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le8l;->g:Lj8l;

    iput-object p2, p0, Le8l;->a:Lb2l;

    iput p3, p0, Le8l;->b:I

    new-instance p3, Lpde;

    sget-object v0, Lf8l;->c:Lf8l;

    invoke-direct {p3, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Le8l;->c:Lpde;

    new-instance p3, Lq6l;

    const/4 v0, 0x1

    invoke-direct {p3, p0, v0}, Lq6l;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Le8l;->e:Lq6l;

    new-instance v0, Lqlk;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Le8l;->f:Lqlk;

    iget-object p1, p1, Lj8l;->c:Ljava/util/LinkedHashMap;

    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p2, Ld7l;

    invoke-virtual {p2, p3}, Ld7l;->e0(La2l;)V

    invoke-virtual {p0}, Le8l;->c()V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-object v0, p0, Le8l;->a:Lb2l;

    check-cast v0, Ld7l;

    iget-boolean v0, v0, Ld7l;->m:Z

    if-nez v0, :cond_1c

    iget v0, p0, Le8l;->b:I

    if-lez v0, :cond_1c

    iget-object p0, p0, Le8l;->c:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Lg8l;->c:Lg8l;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Le8l;->g:Lj8l;

    iget-object v0, v0, Lj8l;->c:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Le8l;->a:Lb2l;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le8l;->e:Lq6l;

    check-cast v1, Ld7l;

    invoke-virtual {v1, v0}, Ld7l;->s0(La2l;)V

    iget-object v0, p0, Le8l;->f:Lqlk;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p0, p0, Le8l;->c:Lpde;

    sget-object v0, Lg8l;->c:Lg8l;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final c()V
    .registers 4

    iget-boolean v0, p0, Le8l;->d:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Le8l;->a()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0}, Le8l;->b()V

    return-void

    :cond_f
    iget-object v0, p0, Le8l;->f:Lqlk;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget v0, p0, Le8l;->b:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Le8l;->b:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Le8l;->d:Z

    iget-object v1, p0, Le8l;->g:Lj8l;

    iget-object v1, v1, Lj8l;->a:Lc8l;

    new-instance v2, Lqv3;

    invoke-direct {v2, p0, v0}, Lqv3;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Le8l;->a:Lb2l;

    invoke-virtual {v1, p0, v2}, Lc8l;->b(Lb2l;Lw7l;)V

    return-void
.end method
