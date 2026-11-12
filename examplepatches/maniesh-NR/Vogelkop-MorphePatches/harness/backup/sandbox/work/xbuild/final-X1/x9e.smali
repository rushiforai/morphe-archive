.class public final synthetic Lx9e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh42;


# direct methods
.method public synthetic constructor <init>(Lh42;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lx9e;->a:B

    iput-object p1, p0, Lx9e;->b:Lh42;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lx9e;->a:B

    iget-object p0, p0, Lx9e;->b:Lh42;

    packed-switch v0, :pswitch_data_4c

    check-cast p1, Loen;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpen;

    iget-boolean v1, p1, Loen;->c:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_22

    if-eqz v0, :cond_1c

    iget-object v0, v0, Lpen;->e:Leb8;

    if-eqz v0, :cond_1c

    :goto_1a
    move-object v8, v0

    goto :goto_23

    :cond_1c
    new-instance v0, Leb8;

    invoke-direct {v0, v2}, Leb8;-><init>(Lek5;)V

    goto :goto_1a

    :cond_22
    move-object v8, v2

    :goto_23
    new-instance v3, Lpen;

    iget-object v4, p1, Loen;->a:Ljava/lang/Integer;

    iget-object v5, p1, Loen;->b:Ljava/lang/CharSequence;

    if-eqz v4, :cond_2f

    const/4 p1, 0x1

    :goto_2c
    move v6, p1

    move v7, v6

    goto :goto_31

    :cond_2f
    const/4 p1, 0x0

    goto :goto_2c

    :goto_31
    invoke-direct/range {v3 .. v8}, Lpen;-><init>(Ljava/lang/Integer;Ljava/lang/CharSequence;ZZLeb8;)V

    invoke-virtual {p0, v3}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3a
    check-cast p1, Ly7f;

    if-nez p1, :cond_41

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_4a

    :cond_41
    invoke-static {p1}, Ly9e;->b(Ly7f;)Ljava/util/Set;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_4a
    return-object p0

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
