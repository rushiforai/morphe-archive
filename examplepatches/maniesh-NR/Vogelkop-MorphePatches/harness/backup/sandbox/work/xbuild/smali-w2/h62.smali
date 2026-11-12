.class public final synthetic Lh62;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxb;

.field public final synthetic c:Lk42;


# direct methods
.method public synthetic constructor <init>(Lxb;Lk42;B)V
    .registers 4

    iput-byte p3, p0, Lh62;->a:B

    iput-object p1, p0, Lh62;->b:Lxb;

    iput-object p2, p0, Lh62;->c:Lk42;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lh62;->a:B

    check-cast p1, Lndc;

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Lq52;

    iget-object v1, p0, Lh62;->b:Lxb;

    iget-object p0, p0, Lh62;->c:Lk42;

    invoke-direct {v0, p1, v1, p0}, Lq52;-><init>(Lndc;Lxb;Lk42;)V

    return-object v0

    :pswitch_11
    new-instance v0, Lq52;

    iget-object v1, p0, Lh62;->b:Lxb;

    iget-object p0, p0, Lh62;->c:Lk42;

    invoke-direct {v0, p1, v1, p0}, Lq52;-><init>(Lndc;Lxb;Lk42;)V

    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
