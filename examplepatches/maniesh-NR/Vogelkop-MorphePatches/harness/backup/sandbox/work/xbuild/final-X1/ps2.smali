.class public final synthetic Lps2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrs2;


# direct methods
.method public synthetic constructor <init>(Lrs2;B)V
    .registers 3

    iput-byte p2, p0, Lps2;->a:B

    iput-object p1, p0, Lps2;->b:Lrs2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lps2;->a:B

    iget-object p0, p0, Lps2;->b:Lrs2;

    packed-switch v0, :pswitch_data_40

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lrs2;->i:I

    invoke-virtual {p0}, Lrs2;->a()V

    return-void

    :pswitch_13
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lrs2;->h:I

    invoke-virtual {p0}, Lrs2;->a()V

    return-void

    :pswitch_1f
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lrs2;->g:I

    invoke-virtual {p0}, Lrs2;->a()V

    return-void

    :pswitch_2b
    check-cast p1, La4g;

    iget-object v0, p1, La4g;->a:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lrs2;->f:I

    invoke-virtual {p1}, La4g;->a()V

    invoke-virtual {p0}, Lrs2;->a()V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_1f
        :pswitch_13
    .end packed-switch
.end method
