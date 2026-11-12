.class public final Lzpc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Laqc;


# direct methods
.method public synthetic constructor <init>(Laqc;B)V
    .registers 3

    iput-byte p2, p0, Lzpc;->a:B

    iput-object p1, p0, Lzpc;->b:Laqc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5

    iget-byte v0, p0, Lzpc;->a:B

    iget-object p0, p0, Lzpc;->b:Laqc;

    const v1, 0x7fffffff

    packed-switch v0, :pswitch_data_50

    check-cast p1, Lzmc;

    invoke-virtual {p0, p1}, Laqc;->a(Lzmc;)Ljava/lang/Integer;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_18

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_19

    :cond_18
    move p1, v0

    :goto_19
    sub-int p1, v1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    check-cast p2, Lzmc;

    invoke-virtual {p0, p2}, Laqc;->a(Lzmc;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_2b

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_2b
    sub-int/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_35
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    check-cast p1, Lzmc;

    invoke-virtual {p0, p1}, Laqc;->a(Lzmc;)Ljava/lang/Integer;

    move-result-object p1

    if-nez p1, :cond_42

    move-object p1, v0

    :cond_42
    check-cast p2, Lzmc;

    invoke-virtual {p0, p2}, Laqc;->a(Lzmc;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_4b

    move-object v0, p0

    :cond_4b
    invoke-virtual {p1, v0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
