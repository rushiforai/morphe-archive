.class public final synthetic Lijn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lojn;


# direct methods
.method public synthetic constructor <init>(Lojn;B)V
    .registers 3

    iput-byte p2, p0, Lijn;->a:B

    iput-object p1, p0, Lijn;->b:Lojn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lijn;->a:B

    iget-object p0, p0, Lijn;->b:Lojn;

    packed-switch v0, :pswitch_data_26

    new-instance v0, Lra3;

    iget-object p0, p0, Lojn;->a:Lfp1;

    invoke-direct {v0, p0}, Lra3;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_f
    new-instance v0, Lvj2;

    iget-object v1, p0, Lojn;->a:Lfp1;

    iget-object v2, p0, Lojn;->b:Lumi;

    new-instance v3, Ljjn;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Ljjn;-><init>(Lojn;B)V

    new-instance v4, Ljjn;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5}, Ljjn;-><init>(Lojn;B)V

    invoke-direct {v0, v1, v2, v3, v4}, Lvj2;-><init>(Landroid/content/Context;Lumi;Ljjn;Ljjn;)V

    return-object v0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
