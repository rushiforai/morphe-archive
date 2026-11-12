.class public final synthetic Lkvl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpvl;


# direct methods
.method public synthetic constructor <init>(Lpvl;B)V
    .registers 3

    iput-byte p2, p0, Lkvl;->a:B

    iput-object p1, p0, Lkvl;->b:Lpvl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lkvl;->a:B

    iget-object p0, p0, Lkvl;->b:Lpvl;

    check-cast p1, Lf8k;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0}, Lpvl;->E()V

    return-void

    :pswitch_d
    invoke-virtual {p0}, Lpvl;->E()V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
