.class public final synthetic Lhr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpr;


# direct methods
.method public synthetic constructor <init>(Lpr;B)V
    .registers 3

    iput-byte p2, p0, Lhr8;->a:B

    iput-object p1, p0, Lhr8;->b:Lpr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lhr8;->a:B

    iget-object p0, p0, Lhr8;->b:Lpr;

    packed-switch v0, :pswitch_data_16

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lpr;->E()V

    return-void

    :pswitch_10
    check-cast p1, Ltta;

    invoke-virtual {p0}, Lpr;->E()V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
