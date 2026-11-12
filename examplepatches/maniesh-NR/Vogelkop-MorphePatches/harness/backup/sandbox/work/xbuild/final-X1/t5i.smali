.class public final Lt5i;
.super Lv5i;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lt5i;->a:B

    iput-object p1, p0, Lt5i;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lto9;)V
    .registers 4

    iget-byte v0, p0, Lt5i;->a:B

    iget-object p0, p0, Lt5i;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    check-cast p0, La5l;

    iget-object p1, p0, La5l;->a:Lumi;

    new-instance v0, Lw4l;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lw4l;-><init>(La5l;B)V

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_1a
    check-cast p0, Lrmg;

    invoke-virtual {p0, p1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
