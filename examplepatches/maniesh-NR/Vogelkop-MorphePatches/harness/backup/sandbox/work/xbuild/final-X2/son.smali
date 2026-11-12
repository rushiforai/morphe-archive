.class public final synthetic Lson;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lw7j;


# direct methods
.method public synthetic constructor <init>(Lw7j;B)V
    .registers 3

    iput-byte p2, p0, Lson;->a:B

    iput-object p1, p0, Lson;->b:Lw7j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lson;->a:B

    iget-object p0, p0, Lson;->b:Lw7j;

    packed-switch v0, :pswitch_data_54

    iget-object v0, p0, Lw7j;->b:Ljava/lang/Object;

    check-cast v0, Lplh;

    new-instance v1, Lz78;

    const/16 v2, 0xa

    invoke-direct {v1, v0, v2}, Lz78;-><init>(Lplh;B)V

    iget-object p0, p0, Lw7j;->a:Ljava/lang/Object;

    check-cast p0, Lx0f;

    const-string v0, "weather_alerts"

    invoke-virtual {p0, v0}, Lx0f;->a(Ljava/lang/String;)Lode;

    move-result-object p0

    invoke-static {p0}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p0

    new-instance v0, Lyc1;

    const/16 v2, 0x18

    invoke-direct {v0, p0, v2}, Lyc1;-><init>(Lf99;B)V

    new-instance p0, Lpr6;

    const/4 v2, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {p0, v2, v4, v3}, Lpr6;-><init>(ILmt5;B)V

    new-instance v2, Lya9;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v0, p0, v3}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p0

    return-object p0

    :pswitch_3a
    iget-object p0, p0, Lw7j;->a:Ljava/lang/Object;

    check-cast p0, Lx0f;

    const-string v0, "weather_forecast"

    invoke-virtual {p0, v0}, Lx0f;->a(Ljava/lang/String;)Lode;

    move-result-object p0

    invoke-static {p0}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p0

    new-instance v0, Lyc1;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lyc1;-><init>(Lf99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p0

    return-object p0

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
