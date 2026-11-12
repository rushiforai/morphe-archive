.class public final synthetic Lwcn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lykj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li9c;


# direct methods
.method public synthetic constructor <init>(Li9c;B)V
    .registers 3

    iput-byte p2, p0, Lwcn;->a:B

    iput-object p1, p0, Lwcn;->b:Li9c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-byte p1, p0, Lwcn;->a:B

    iget-object p0, p0, Lwcn;->b:Li9c;

    packed-switch p1, :pswitch_data_30

    iget-object p0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_c
    iget-object p0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_11
    iget-object p0, p0, Li9c;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_16
    iget-object p0, p0, Li9c;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_1b
    iget-object p0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_20
    iget-object p0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_25
    iget-object p0, p0, Li9c;->e:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_2a
    iget-object p0, p0, Li9c;->e:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_25
        :pswitch_20
        :pswitch_1b
        :pswitch_16
        :pswitch_11
        :pswitch_c
    .end packed-switch
.end method
