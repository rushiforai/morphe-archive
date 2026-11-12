.class public final Ls0k;
.super Lu0k;
.source "SourceFile"


# instance fields
.field public final synthetic h:B

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lvr3;Ljava/lang/CharSequence;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Ls0k;->h:B

    iput-object p3, p0, Ls0k;->i:Ljava/lang/Object;

    invoke-direct {p0, p1, p2}, Lu0k;-><init>(Lvr3;Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final a(I)I
    .registers 3

    iget-byte v0, p0, Ls0k;->h:B

    packed-switch v0, :pswitch_data_12

    iget-object p0, p0, Ls0k;->i:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    add-int/2addr p0, p1

    return p0

    :pswitch_f
    add-int/lit8 p1, p1, 0x1

    return p1

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method

.method public final b(I)I
    .registers 8

    iget-byte v0, p0, Ls0k;->h:B

    iget-object v1, p0, Lu0k;->c:Ljava/lang/CharSequence;

    iget-object p0, p0, Ls0k;->i:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_34

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    sub-int/2addr v2, v0

    :goto_14
    if-gt p1, v2, :cond_2b

    const/4 v3, 0x0

    :goto_17
    if-ge v3, v0, :cond_2c

    add-int v4, v3, p1

    invoke-interface {v1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_28

    add-int/lit8 p1, p1, 0x1

    goto :goto_14

    :cond_28
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_2b
    const/4 p1, -0x1

    :cond_2c
    return p1

    :pswitch_2d
    check-cast p0, Lst4;

    invoke-virtual {p0, v1, p1}, Lut4;->b(Ljava/lang/CharSequence;I)I

    move-result p0

    return p0

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method
