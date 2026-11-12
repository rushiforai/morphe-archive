.class public final Lpd1;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lb3m;

.field public final synthetic k:Lkotlin/jvm/functions/Function1;

.field public final synthetic l:Lc8e;

.field public final synthetic m:Lue5;

.field public final synthetic n:I

.field public final synthetic o:Ljava/lang/Object;

.field public final synthetic p:Ljava/lang/Object;

.field public final synthetic q:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lb3m;Lc8e;Lkotlin/jvm/functions/Function1;Ltd3;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lue5;I)V
    .registers 10

    const/4 v0, 0x0

    iput-byte v0, p0, Lpd1;->i:B

    iput-object p1, p0, Lpd1;->j:Lb3m;

    iput-object p2, p0, Lpd1;->l:Lc8e;

    iput-object p3, p0, Lpd1;->k:Lkotlin/jvm/functions/Function1;

    iput-object p4, p0, Lpd1;->q:Ljava/lang/Object;

    iput-object p5, p0, Lpd1;->o:Ljava/lang/Object;

    iput-object p6, p0, Lpd1;->p:Ljava/lang/Object;

    iput-object p7, p0, Lpd1;->m:Lue5;

    iput p8, p0, Lpd1;->n:I

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method

.method public constructor <init>(Lb3m;Lkotlin/jvm/functions/Function1;Lc8e;Lx48;Lvh8;Lkotlin/jvm/functions/Function2;Lue5;I)V
    .registers 10

    const/4 v0, 0x1

    iput-byte v0, p0, Lpd1;->i:B

    .line 24
    iput-object p1, p0, Lpd1;->j:Lb3m;

    iput-object p2, p0, Lpd1;->k:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Lpd1;->l:Lc8e;

    iput-object p4, p0, Lpd1;->o:Ljava/lang/Object;

    iput-object p5, p0, Lpd1;->p:Ljava/lang/Object;

    iput-object p6, p0, Lpd1;->q:Ljava/lang/Object;

    iput-object p7, p0, Lpd1;->m:Lue5;

    iput p8, p0, Lpd1;->n:I

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 17

    iget-byte v0, p0, Lpd1;->i:B

    iget v1, p0, Lpd1;->n:I

    iget-object v2, p0, Lpd1;->q:Ljava/lang/Object;

    iget-object v3, p0, Lpd1;->p:Ljava/lang/Object;

    iget-object v4, p0, Lpd1;->o:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5a

    move-object v12, p1

    check-cast v12, Lih5;

    move-object/from16 v0, p2

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-object v8, v4

    check-cast v8, Lx48;

    move-object v9, v3

    check-cast v9, Lvh8;

    move-object v10, v2

    check-cast v10, Lkotlin/jvm/functions/Function2;

    or-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Laoh;->m(I)I

    move-result v13

    iget-object v5, p0, Lpd1;->j:Lb3m;

    iget-object v6, p0, Lpd1;->k:Lkotlin/jvm/functions/Function1;

    iget-object v7, p0, Lpd1;->l:Lc8e;

    iget-object v11, p0, Lpd1;->m:Lue5;

    invoke-static/range {v5 .. v13}, Lxf8;->b(Lb3m;Lkotlin/jvm/functions/Function1;Lc8e;Lx48;Lvh8;Lkotlin/jvm/functions/Function2;Lue5;Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_34
    move-object v7, p1

    check-cast v7, Lih5;

    move-object/from16 v0, p2

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    check-cast v2, Ltd3;

    check-cast v4, Lkotlin/jvm/functions/Function1;

    move-object v5, v3

    check-cast v5, Lkotlin/jvm/functions/Function1;

    or-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Laoh;->m(I)I

    move-result v8

    iget-object v0, p0, Lpd1;->j:Lb3m;

    iget-object v1, p0, Lpd1;->l:Lc8e;

    move-object v3, v2

    iget-object v2, p0, Lpd1;->k:Lkotlin/jvm/functions/Function1;

    iget-object v6, p0, Lpd1;->m:Lue5;

    invoke-static/range {v0 .. v8}, Lp37;->c(Lb3m;Lc8e;Lkotlin/jvm/functions/Function1;Ltd3;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lue5;Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_34
    .end packed-switch
.end method
