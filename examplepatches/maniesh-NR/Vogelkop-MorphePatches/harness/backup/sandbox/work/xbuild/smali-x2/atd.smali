.class public final synthetic Latd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzsd;

.field public final synthetic c:Lv4b;


# direct methods
.method public synthetic constructor <init>(Lzsd;Lv4b;B)V
    .registers 4

    iput-byte p3, p0, Latd;->a:B

    iput-object p1, p0, Latd;->b:Lzsd;

    iput-object p2, p0, Latd;->c:Lv4b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Latd;->a:B

    iget-object v1, p0, Latd;->c:Lv4b;

    iget-object p0, p0, Latd;->b:Lzsd;

    check-cast p1, Lndc;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget-object p0, p0, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
