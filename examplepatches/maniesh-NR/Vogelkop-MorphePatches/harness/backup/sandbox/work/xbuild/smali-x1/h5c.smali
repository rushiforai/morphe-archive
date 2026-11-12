.class public final Lh5c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lro9;


# direct methods
.method public synthetic constructor <init>(Lro9;B)V
    .registers 3

    iput-byte p2, p0, Lh5c;->a:B

    iput-object p1, p0, Lh5c;->b:Lro9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    iget-byte v0, p0, Lh5c;->a:B

    iget-object p0, p0, Lh5c;->b:Lro9;

    packed-switch v0, :pswitch_data_7c

    check-cast p2, Ln6c;

    iget-object p2, p2, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p2}, Lro9;->p(Ljava/lang/Object;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    check-cast p1, Ln6c;

    iget-object p1, p1, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lro9;->p(Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_24
    check-cast p2, Ln6c;

    iget-object p2, p2, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p2}, Lro9;->p(Ljava/lang/Object;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    check-cast p1, Ln6c;

    iget-object p1, p1, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lro9;->p(Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_41
    check-cast p1, Ln6c;

    iget-object p1, p1, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lro9;->p(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    check-cast p2, Ln6c;

    iget-object p2, p2, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p2}, Lro9;->p(Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_5e
    check-cast p1, Ln6c;

    iget-object p1, p1, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lro9;->p(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    check-cast p2, Ln6c;

    iget-object p2, p2, Ln6c;->i:Ljava/lang/Object;

    invoke-virtual {p0, p2}, Lro9;->p(Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0

    nop

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_41
        :pswitch_24
    .end packed-switch
.end method
