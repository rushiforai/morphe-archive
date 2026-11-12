.class public final synthetic Lw78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lplh;


# direct methods
.method public synthetic constructor <init>(Lplh;B)V
    .registers 3

    iput-byte p2, p0, Lw78;->a:B

    iput-object p1, p0, Lw78;->b:Lplh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lw78;->a:B

    iget-object p0, p0, Lw78;->b:Lplh;

    packed-switch v0, :pswitch_data_28

    new-instance v0, Lz78;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lz78;-><init>(Lplh;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p0

    return-object p0

    :pswitch_12
    new-instance v0, Lz78;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lz78;-><init>(Lplh;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p0

    return-object p0

    :pswitch_1d
    new-instance v0, Lz78;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lz78;-><init>(Lplh;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p0

    return-object p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_12
    .end packed-switch
.end method
