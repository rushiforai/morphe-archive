.class public final synthetic Lepk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lurg;
.implements Ljr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lipk;


# direct methods
.method public synthetic constructor <init>(Lipk;B)V
    .registers 3

    iput-byte p2, p0, Lepk;->a:B

    iput-object p1, p0, Lepk;->b:Lipk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lepk;->b:Lipk;

    iget-object p0, p0, Lipk;->g:Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpne;

    iget-object p0, p0, Lpne;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Ldbh;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 5

    iget-byte v0, p0, Lepk;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lepk;->b:Lipk;

    packed-switch v0, :pswitch_data_4c

    :pswitch_9
    check-cast p1, Ln8f;

    iget-object v0, p1, Ln8f;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lipk;->T(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object p1, p1, Ln8f;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lipk;->U(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1c

    :cond_1b
    move v1, v2

    :cond_1c
    return v1

    :pswitch_1d
    check-cast p1, Lrca;

    iget-object p1, p1, Lrca;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lipk;->T(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_33

    invoke-virtual {p0, p1}, Lipk;->V(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_33

    invoke-virtual {p0, p1}, Lipk;->U(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_34

    :cond_33
    move v1, v2

    :cond_34
    return v1

    :pswitch_35
    check-cast p1, Ljn7;

    iget-object p1, p1, Ljn7;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lipk;->T(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4b

    invoke-virtual {p0, p1}, Lipk;->V(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4b

    invoke-virtual {p0, p1}, Lipk;->U(Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 v2, p0, 0x1

    :cond_4b
    return v2

    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_35
        :pswitch_9
        :pswitch_1d
    .end packed-switch
.end method
