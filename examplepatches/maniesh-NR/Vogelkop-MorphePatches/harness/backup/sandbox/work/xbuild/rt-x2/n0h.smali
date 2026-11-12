.class public final synthetic Ln0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    iput-byte p2, p0, Ln0h;->a:B

    iput-object p1, p0, Ln0h;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 3

    iget-byte v0, p0, Ln0h;->a:B

    iget-object p0, p0, Ln0h;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_36

    check-cast p1, Laln;

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_12
    check-cast p1, Laln;

    invoke-interface {p1}, Laln;->f()I

    move-result p1

    invoke-static {p1}, Lam2;->c(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_21
    check-cast p1, Laln;

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_2c
    check-cast p1, Lloj;

    iget-object p1, p1, Lloj;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_21
        :pswitch_12
    .end packed-switch
.end method
