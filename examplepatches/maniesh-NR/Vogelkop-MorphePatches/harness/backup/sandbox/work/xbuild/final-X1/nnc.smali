.class public final synthetic Lnnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsnc;

.field public final synthetic c:Lumi;


# direct methods
.method public synthetic constructor <init>(Lsnc;Lumi;B)V
    .registers 4

    iput-byte p3, p0, Lnnc;->a:B

    iput-object p1, p0, Lnnc;->b:Lsnc;

    iput-object p2, p0, Lnnc;->c:Lumi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lnnc;->a:B

    iget-object v1, p0, Lnnc;->c:Lumi;

    iget-object p0, p0, Lnnc;->b:Lsnc;

    packed-switch v0, :pswitch_data_16

    new-instance v0, Lrnc;

    invoke-direct {v0, p0, v1}, Lrnc;-><init>(Lsnc;Lumi;)V

    return-object v0

    :pswitch_f
    new-instance v0, Lqnc;

    invoke-direct {v0, p0, v1}, Lqnc;-><init>(Lsnc;Lumi;)V

    return-object v0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
