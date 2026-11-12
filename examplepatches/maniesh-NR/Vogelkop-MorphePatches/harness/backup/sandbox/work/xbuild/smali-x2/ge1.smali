.class public final Lge1;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Z

.field public final synthetic k:Lc8e;

.field public final synthetic l:Lx48;

.field public final synthetic m:Lvh8;

.field public final synthetic n:Ljava/lang/String;

.field public final synthetic o:Lue5;

.field public final synthetic p:I

.field public final synthetic q:B


# direct methods
.method public synthetic constructor <init>(ZLc8e;Lx48;Lvh8;Ljava/lang/String;Lue5;IIB)V
    .registers 10

    iput-byte p9, p0, Lge1;->i:B

    iput-boolean p1, p0, Lge1;->j:Z

    iput-object p2, p0, Lge1;->k:Lc8e;

    iput-object p3, p0, Lge1;->l:Lx48;

    iput-object p4, p0, Lge1;->m:Lvh8;

    iput-object p5, p0, Lge1;->n:Ljava/lang/String;

    iput-object p6, p0, Lge1;->o:Lue5;

    iput p7, p0, Lge1;->p:I

    iput-byte p8, p0, Lge1;->q:B

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lge1;->i:B

    iget v1, p0, Lge1;->p:I

    packed-switch v0, :pswitch_data_4c

    move-object v8, p1

    check-cast v8, Lih5;

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    or-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Laoh;->m(I)I

    move-result v9

    iget-byte v10, p0, Lge1;->q:B

    iget-boolean v2, p0, Lge1;->j:Z

    iget-object v3, p0, Lge1;->k:Lc8e;

    iget-object v4, p0, Lge1;->l:Lx48;

    iget-object v5, p0, Lge1;->m:Lvh8;

    iget-object v6, p0, Lge1;->n:Ljava/lang/String;

    iget-object v7, p0, Lge1;->o:Lue5;

    invoke-static/range {v2 .. v10}, Lxf8;->e(ZLc8e;Lx48;Lvh8;Ljava/lang/String;Lue5;Lih5;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29
    move-object v6, p1

    check-cast v6, Lih5;

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    or-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Laoh;->m(I)I

    move-result v7

    iget-byte v8, p0, Lge1;->q:B

    iget-boolean v0, p0, Lge1;->j:Z

    iget-object v1, p0, Lge1;->k:Lc8e;

    iget-object v2, p0, Lge1;->l:Lx48;

    iget-object v3, p0, Lge1;->m:Lvh8;

    iget-object v4, p0, Lge1;->n:Ljava/lang/String;

    iget-object v5, p0, Lge1;->o:Lue5;

    invoke-static/range {v0 .. v8}, Lxf8;->d(ZLc8e;Lx48;Lvh8;Ljava/lang/String;Lue5;Lih5;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
