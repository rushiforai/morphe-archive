.class public final Lrp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/text/Collator;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lrp2;->a:B

    packed-switch p1, :pswitch_data_26

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object p1

    iput-object p1, p0, Lrp2;->b:Ljava/text/Collator;

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Ljava/text/Collator;->setStrength(I)V

    return-void

    :pswitch_15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object p1

    iput-object p1, p0, Lrp2;->b:Ljava/text/Collator;

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Ljava/text/Collator;->setStrength(I)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x2
        :pswitch_15
    .end packed-switch
.end method

.method public constructor <init>(Ljava/text/Collator;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lrp2;->a:B

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrp2;->b:Ljava/text/Collator;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5

    iget-byte v0, p0, Lrp2;->a:B

    iget-object p0, p0, Lrp2;->b:Ljava/text/Collator;

    packed-switch v0, :pswitch_data_38

    check-cast p1, Llbn;

    check-cast p2, Llbn;

    iget-object p1, p1, Llbn;->b:Ljava/lang/String;

    iget-object p2, p2, Llbn;->b:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_14
    check-cast p1, Ltzb;

    check-cast p2, Ltzb;

    iget-object p1, p1, Ltzb;->c:Ljava/lang/String;

    iget-object p2, p2, Ltzb;->c:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_21
    check-cast p1, Lsp2;

    check-cast p2, Lsp2;

    iget-object v0, p1, Lsp2;->b:Ljava/lang/String;

    iget-object v1, p2, Lsp2;->b:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_37

    iget-object p0, p1, Lsp2;->a:Ljava/lang/String;

    iget-object p1, p2, Lsp2;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    :cond_37
    return p0

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_21
        :pswitch_14
    .end packed-switch
.end method
