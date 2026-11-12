.class public final Lu6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lhx5;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lu6j;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu6j;->c:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lu6j;->b:Z

    return-void
.end method

.method public constructor <init>(Lr9l;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lu6j;->a:B

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lu6j;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lu6j;->a:B

    iget-object v1, p0, Lu6j;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_56

    check-cast p1, Lqyi;

    check-cast v1, Lr9l;

    iget-object v0, v1, Lr9l;->w:Ls9i;

    iget-object v1, v1, Lr9l;->D:Lg4l;

    invoke-virtual {v0}, Ls9i;->Y()Z

    move-result v0

    iget-boolean v2, p0, Lu6j;->b:Z

    if-eq v2, v0, :cond_35

    if-eqz v0, :cond_30

    sget-object v2, Loyi;->a:Loyi;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2a

    check-cast p1, Lpyi;

    iget-boolean p1, p1, Lpyi;->c:Z

    if-eqz p1, :cond_2a

    sget-object p1, Luz3;->e:Luz3;

    goto :goto_2b

    :cond_2a
    const/4 p1, 0x0

    :goto_2b
    const/4 v2, 0x1

    invoke-static {v1, p1, v2}, Lg4l;->a(Lg4l;Luz3;I)V

    goto :goto_33

    :cond_30
    invoke-static {v1}, Lg4l;->e(Lg4l;)V

    :goto_33
    iput-boolean v0, p0, Lu6j;->b:Z

    :cond_35
    return-void

    :pswitch_36
    check-cast v1, Lhx5;

    iget-object v0, v1, Lhx5;->o:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_54

    iget-boolean v2, p0, Lu6j;->b:Z

    if-nez v2, :cond_4e

    if-eqz p1, :cond_4e

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_54

    :cond_4e
    const/4 p1, 0x0

    iput-boolean p1, p0, Lu6j;->b:Z

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_54
    return-void

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method
