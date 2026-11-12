.class public Lq59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;
.implements Lhh4;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lekc;Lcom/opera/api/Callback;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lq59;->a:B

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lq59;->c:Ljava/lang/Object;

    .line 29
    iput-object p2, p0, Lq59;->d:Ljava/lang/Object;

    .line 30
    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 26
    iput-byte p3, p0, Lq59;->a:B

    iput-object p1, p0, Lq59;->c:Ljava/lang/Object;

    iput-object p2, p0, Lq59;->d:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lq59;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lwsc;Lysc;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lq59;->a:B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Lq59;->b:Z

    .line 33
    iput-object p1, p0, Lq59;->c:Ljava/lang/Object;

    .line 34
    iput-object p2, p0, Lq59;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lydn;Lslk;Lgmk;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Lq59;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq59;->c:Ljava/lang/Object;

    iget-object p1, p2, Lslk;->i:Lkze;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    iget-object p1, p3, Lgmk;->a:Lkze;

    new-instance p2, Lqzg;

    const/16 p3, 0x17

    invoke-direct {p2, p0, p3}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final cancel()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lq59;->b:Z

    iget-object v0, p0, Lq59;->c:Ljava/lang/Object;

    check-cast v0, Lekc;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 13

    iget-byte v0, p0, Lq59;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, Lq59;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_d6

    check-cast p1, Lwvg;

    iget v0, p1, Lwvg;->e:I

    if-eqz v0, :cond_4a

    iget-object p1, p1, Lwvg;->g:Lck8;

    move-object v4, v3

    check-cast v4, Lydn;

    if-eqz p1, :cond_24

    iget-object v9, p1, Lck8;->a:Ljava/lang/String;

    iget-object v10, p1, Lck8;->b:Ljava/lang/String;

    iget-wide v5, p1, Lck8;->c:J

    iget-wide v7, p1, Lck8;->d:J

    invoke-virtual/range {v4 .. v10}, Lydn;->K(JJLjava/lang/String;Ljava/lang/String;)V

    iput-boolean v1, p0, Lq59;->b:Z

    goto :goto_31

    :cond_24
    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-string v9, ""

    const-string v10, ""

    invoke-virtual/range {v4 .. v10}, Lydn;->K(JJLjava/lang/String;Ljava/lang/String;)V

    iput-boolean v2, p0, Lq59;->b:Z

    :goto_31
    check-cast v3, Lydn;

    iget-object p1, p0, Lq59;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    if-eqz p1, :cond_4a

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_47

    iget-boolean p0, p0, Lq59;->b:Z

    if-eqz p0, :cond_4a

    invoke-virtual {v3, v1}, Lydn;->E(Z)V

    goto :goto_4a

    :cond_47
    invoke-virtual {v3, v2}, Lydn;->E(Z)V

    :cond_4a
    :goto_4a
    return-void

    :pswitch_4b
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    iget-boolean v0, p0, Lq59;->b:Z

    if-eqz v0, :cond_66

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float p1, p1, v0

    if-nez p1, :cond_66

    iput-boolean v2, p0, Lq59;->b:Z

    check-cast v3, Lo9k;

    iget-object p0, p0, Lq59;->d:Ljava/lang/Object;

    check-cast p0, Ld0n;

    invoke-virtual {v3, p0, v1}, Lo9k;->f0(Ld0n;Z)V

    :cond_66
    return-void

    :pswitch_67
    invoke-virtual {p0, p1}, Lq59;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    check-cast v3, Lekc;

    invoke-virtual {v3, p0}, Lekc;->p(Lf7f;)V

    iget-boolean v0, p0, Lq59;->b:Z

    if-nez v0, :cond_7d

    iget-object p0, p0, Lq59;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_7d
    return-void

    :pswitch_7e
    check-cast v3, Lwsc;

    const/4 v0, 0x2

    invoke-static {v0}, Lctc;->c(I)Z

    move-result v0

    if-eqz v0, :cond_8d

    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {v3, p1}, Lwsc;->dataToString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_8d
    iput-boolean v1, p0, Lq59;->b:Z

    iget-object p0, p0, Lq59;->d:Ljava/lang/Object;

    check-cast p0, Lysc;

    invoke-interface {p0, v3, p1}, Lysc;->onLoadFinished(Lwsc;Ljava/lang/Object;)V

    return-void

    :pswitch_97
    iget-object v0, p0, Lq59;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    check-cast v3, Lf7f;

    iget-boolean v1, p0, Lq59;->b:Z

    if-nez v1, :cond_a5

    invoke-interface {v3, p1}, Lf7f;->d0(Ljava/lang/Object;)V

    goto :goto_d4

    :cond_a5
    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_ab
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_bb

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lp59;

    invoke-interface {v4}, Lp59;->a()V

    goto :goto_ab

    :cond_bb
    invoke-interface {v3, p1}, Lf7f;->d0(Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lp59;

    invoke-interface {v1, p1}, Lp59;->b(Ljava/lang/Object;)V

    goto :goto_c2

    :cond_d2
    iput-boolean v2, p0, Lq59;->b:Z

    :goto_d4
    return-void

    nop

    :pswitch_data_d6
    .packed-switch 0x0
        :pswitch_97
        :pswitch_7e
        :pswitch_67
        :pswitch_4b
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lq59;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lq59;->d:Ljava/lang/Object;

    check-cast p0, Lysc;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
