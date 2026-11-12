.class public final synthetic Livo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lpxo;


# direct methods
.method public synthetic constructor <init>(ZLpxo;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Livo;->a:Z

    iput-object p2, p0, Livo;->b:Lpxo;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 6

    iget-boolean v0, p0, Livo;->a:Z

    iget-object p0, p0, Livo;->b:Lpxo;

    check-cast p1, Lt0i;

    if-eqz v0, :cond_30

    iget-object v0, p0, Lpxo;->b:Lr22;

    iget-object v0, v0, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Lvdp;

    iget-object v1, v0, Lejo;->a:Ljava/lang/Object;

    check-cast v1, Lw9p;

    invoke-virtual {v1}, Lw9p;->C()V

    iget-object v1, p1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_1f

    const/4 v1, 0x0

    goto :goto_2d

    :cond_1f
    instance-of v2, v1, Lvjo;

    if-eqz v2, :cond_26

    check-cast v1, Lvjo;

    goto :goto_27

    :cond_26
    const/4 v1, 0x0

    :goto_27
    if-eqz v1, :cond_2c

    iget v1, v1, Lvjo;->a:I

    goto :goto_2d

    :cond_2c
    const/4 v1, -0x1

    :goto_2d
    invoke-virtual {v0, v1}, Lvdp;->h(I)V

    :cond_30
    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v0, p1, Lq0i;

    if-nez v0, :cond_64

    move-object v0, p1

    check-cast v0, Lvoo;

    iget-object v1, p0, Lpxo;->b:Lr22;

    iget-object v2, p0, Lpxo;->j:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v1, v1, Lr22;->c:Ljava/lang/Object;

    check-cast v1, Lwjh;

    new-instance v3, Ljava/io/File;

    iget-object v1, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v1, Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-direct {v3, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v3, v0, Lvoo;->x:Ljava/io/File;

    iput-object v0, p0, Lpxo;->d:Lvoo;

    new-instance v1, Lp7p;

    invoke-direct {v1, v0}, Lp7p;-><init>(Lvoo;)V

    iput-object v1, p0, Lpxo;->i:Lp7p;

    invoke-virtual {p0, v0}, Lpxo;->b(Lvoo;)V

    :cond_64
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_80

    iget-object v0, p0, Lpxo;->e:Lbap;

    invoke-virtual {v0}, Lbap;->a()Ln9p;

    move-result-object v0

    iput-object v0, p0, Lpxo;->e:Lbap;

    iget-object p0, p0, Lpxo;->c:Luuj;

    if-eqz p0, :cond_7d

    invoke-static {p1}, Lb8h;->a(Ljava/lang/Throwable;)Lcm;

    move-result-object v0

    invoke-virtual {p0, v0}, Luuj;->g(Lcm;)V

    :cond_7d
    invoke-static {p1}, Lb8h;->a(Ljava/lang/Throwable;)Lcm;

    :cond_80
    return-void
.end method
