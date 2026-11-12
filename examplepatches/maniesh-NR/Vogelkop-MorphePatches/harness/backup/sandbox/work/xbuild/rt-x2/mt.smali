.class public final synthetic Lmt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lesi;


# direct methods
.method public synthetic constructor <init>(Lesi;B)V
    .registers 3

    iput-byte p2, p0, Lmt;->a:B

    iput-object p1, p0, Lmt;->b:Lesi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lmt;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, -0x1

    iget-object p0, p0, Lmt;->b:Lesi;

    packed-switch v0, :pswitch_data_3c

    check-cast p1, Lhq8;

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lesi;->a(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_35

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p1, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lesi;->a(Ljava/lang/String;)I

    move-result p0

    if-eq p0, v3, :cond_36

    goto :goto_35

    :pswitch_23
    check-cast p1, Llq8;

    iget-object v0, p1, Llq8;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lesi;->a(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_35

    iget-object p1, p1, Llq8;->d:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lesi;->a(Ljava/lang/String;)I

    move-result p0

    if-eq p0, v3, :cond_36

    :cond_35
    :goto_35
    move v1, v2

    :cond_36
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
