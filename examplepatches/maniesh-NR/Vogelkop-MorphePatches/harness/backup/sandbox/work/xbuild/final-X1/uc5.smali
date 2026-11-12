.class public final Luc5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:B

.field public final b:Z


# direct methods
.method public synthetic constructor <init>(BZ)V
    .registers 3

    iput-byte p1, p0, Luc5;->a:B

    iput-boolean p2, p0, Luc5;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7

    iget-byte v0, p0, Luc5;->a:B

    iget-boolean p0, p0, Luc5;->b:Z

    packed-switch v0, :pswitch_data_4c

    check-cast p1, Lqvb;

    check-cast p2, Lqvb;

    iget v0, p1, Lqvb;->c:I

    iget p1, p1, Lqvb;->b:I

    iget v1, p2, Lqvb;->c:I

    iget p2, p2, Lqvb;->b:I

    if-ge v0, v1, :cond_17

    const/4 p0, -0x1

    goto :goto_26

    :cond_17
    if-le v0, v1, :cond_1b

    const/4 p0, 0x1

    goto :goto_26

    :cond_1b
    if-eqz p0, :cond_22

    invoke-static {p2, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    goto :goto_26

    :cond_22
    invoke-static {p1, p2}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    :goto_26
    return p0

    :pswitch_27
    check-cast p1, Landroid/util/Size;

    check-cast p2, Landroid/util/Size;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    int-to-long v2, p1

    mul-long/2addr v0, v2

    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result p1

    int-to-long v2, p1

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result p1

    int-to-long p1, p1

    mul-long/2addr v2, p1

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result p1

    if-eqz p0, :cond_4a

    mul-int/lit8 p1, p1, -0x1

    :cond_4a
    return p1

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
