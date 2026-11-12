.class public final synthetic Ljjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lojn;


# direct methods
.method public synthetic constructor <init>(Lojn;B)V
    .registers 3

    iput-byte p2, p0, Ljjn;->a:B

    iput-object p1, p0, Ljjn;->b:Lojn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ljjn;->a:B

    iget-object p0, p0, Ljjn;->b:Lojn;

    packed-switch v0, :pswitch_data_16

    new-instance v0, Lrb;

    iget-object v1, p0, Lojn;->a:Lfp1;

    iget-object p0, p0, Lojn;->b:Lumi;

    const/4 v2, 0x3

    invoke-direct {v0, v1, p0, v2}, Lrb;-><init>(Landroid/content/Context;Lumi;B)V

    return-object v0

    :pswitch_12
    iget-object p0, p0, Lojn;->a:Lfp1;

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
