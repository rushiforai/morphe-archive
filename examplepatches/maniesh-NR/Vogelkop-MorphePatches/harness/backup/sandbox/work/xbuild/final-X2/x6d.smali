.class public final synthetic Lx6d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lutm;


# direct methods
.method public synthetic constructor <init>(Lutm;B)V
    .registers 3

    iput-byte p2, p0, Lx6d;->a:B

    iput-object p1, p0, Lx6d;->b:Lutm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lx6d;->a:B

    const/16 v1, 0x30

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/high16 v4, 0x41800000    # 16.0f

    const/16 v5, 0x10

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object p0, p0, Lx6d;->b:Lutm;

    check-cast p1, Ly4c;

    check-cast p2, Lih5;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p1

    and-int/lit8 p3, p1, 0x11

    packed-switch v0, :pswitch_data_56

    if-eq p3, v5, :cond_20

    move v7, v6

    :cond_20
    and-int/2addr p1, v6

    check-cast p2, Lvt9;

    invoke-virtual {p2, p1, v7}, Lvt9;->N(IZ)Z

    move-result p1

    if-eqz p1, :cond_33

    sget-object p1, Lz7e;->b:Lz7e;

    invoke-static {p1, v4, v3, v2}, La26;->Z(Lc8e;FFI)Lc8e;

    move-result-object p1

    invoke-static {p0, p1, p2, v1}, Ljpo;->d(Lutm;Lc8e;Lih5;I)V

    goto :goto_36

    :cond_33
    invoke-virtual {p2}, Lvt9;->Q()V

    :goto_36
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_39
    if-eq p3, v5, :cond_3c

    move v7, v6

    :cond_3c
    and-int/2addr p1, v6

    check-cast p2, Lvt9;

    invoke-virtual {p2, p1, v7}, Lvt9;->N(IZ)Z

    move-result p1

    if-eqz p1, :cond_4f

    sget-object p1, Lmpj;->a:Li39;

    invoke-static {p1, v4, v3, v2}, La26;->Z(Lc8e;FFI)Lc8e;

    move-result-object p1

    invoke-static {p0, p1, p2, v1}, Lxf8;->g(Lutm;Lc8e;Lih5;I)V

    goto :goto_52

    :cond_4f
    invoke-virtual {p2}, Lvt9;->Q()V

    :goto_52
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_39
    .end packed-switch
.end method
