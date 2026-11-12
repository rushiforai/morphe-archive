.class public final Lt6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr6l;


# instance fields
.field public final synthetic a:B

.field public final b:Lk6l;

.field public final c:Z

.field public final d:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lk6l;ZLjava/lang/Iterable;B)V
    .registers 5

    iput-byte p4, p0, Lt6l;->a:B

    packed-switch p4, :pswitch_data_22

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt6l;->b:Lk6l;

    iput-boolean p2, p0, Lt6l;->c:Z

    invoke-static {p1, p3}, Lexg;->x(Lk6l;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lt6l;->d:Ljava/util/ArrayList;

    return-void

    :pswitch_13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt6l;->b:Lk6l;

    iput-boolean p2, p0, Lt6l;->c:Z

    invoke-static {p1, p3}, Lexg;->B(Lk6l;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lt6l;->d:Ljava/util/ArrayList;

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_13
    .end packed-switch
.end method


# virtual methods
.method public final h()Lpxh;
    .registers 4

    iget-byte v0, p0, Lt6l;->a:B

    iget-boolean v1, p0, Lt6l;->c:Z

    iget-object p0, p0, Lt6l;->d:Ljava/util/ArrayList;

    packed-switch v0, :pswitch_data_54

    if-eqz v1, :cond_14

    new-instance p0, Lrxh;

    const v0, 0x7f14017f

    invoke-direct {p0, v0}, Lrxh;-><init>(I)V

    goto :goto_2d

    :cond_14
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    new-instance v1, Ltxh;

    const v2, 0x7f12004a

    invoke-direct {v1, p0, v2, v0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    move-object p0, v1

    :goto_2d
    return-object p0

    :pswitch_2e
    if-eqz v1, :cond_39

    new-instance p0, Lrxh;

    const v0, 0x7f14017e

    invoke-direct {p0, v0}, Lrxh;-><init>(I)V

    goto :goto_52

    :cond_39
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    new-instance v1, Ltxh;

    const v2, 0x7f120049

    invoke-direct {v1, p0, v2, v0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    move-object p0, v1

    :goto_52
    return-object p0

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method

.method public final l()V
    .registers 3

    iget-byte v0, p0, Lt6l;->a:B

    iget-object v1, p0, Lt6l;->d:Ljava/util/ArrayList;

    iget-object p0, p0, Lt6l;->b:Lk6l;

    packed-switch v0, :pswitch_data_12

    invoke-static {p0, v1}, Lexg;->x(Lk6l;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    return-void

    :pswitch_d
    invoke-static {p0, v1}, Lexg;->B(Lk6l;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
