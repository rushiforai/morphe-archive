.class public final synthetic Lm2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lode;


# direct methods
.method public synthetic constructor <init>(Lode;B)V
    .registers 3

    iput-byte p2, p0, Lm2g;->a:B

    iput-object p1, p0, Lm2g;->b:Lode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lm2g;->a:B

    iget-object p0, p0, Lm2g;->b:Lode;

    packed-switch v0, :pswitch_data_10

    :pswitch_7
    check-cast p1, Ljava/util/List;

    :goto_9
    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_d
    check-cast p1, Lc3g;

    goto :goto_9

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_d
        :pswitch_d
        :pswitch_7
    .end packed-switch
.end method
