.class public final synthetic Lut3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/IntConsumer;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lut3;->a:B

    iput-object p1, p0, Lut3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(I)V
    .registers 4

    iget-byte v0, p0, Lut3;->a:B

    iget-object p0, p0, Lut3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c

    check-cast p0, Lcv8;

    iget-object p0, p0, Lcv8;->v:Lpr;

    iget v0, p0, Lpr;->a:I

    if-eq p1, v0, :cond_14

    iput p1, p0, Lpr;->a:I

    invoke-virtual {p0}, Lpr;->E()V

    :cond_14
    return-void

    :pswitch_15
    check-cast p0, Lpi8;

    iget-object p0, p0, Lpi8;->c:Lqi8;

    iget-boolean v0, p0, Lqi8;->k0:Z

    if-nez v0, :cond_27

    const/16 v0, 0x13

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0, p1}, Lqi8;->O0(IILjava/lang/Object;)V

    :cond_27
    return-void

    :pswitch_28
    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->N0:Ltg7;

    if-eqz p0, :cond_3b

    iput p1, p0, Ltg7;->d:I

    iget-object p0, p0, Ltg7;->e:Ljava/lang/Object;

    check-cast p0, Lgtj;

    if-eqz p0, :cond_3b

    invoke-virtual {p0, p1}, Lgtj;->h(I)V

    :cond_3b
    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_28
        :pswitch_15
    .end packed-switch
.end method
