.class public final synthetic Lfrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lfrk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 1

    iget-byte p0, p0, Lfrk;->a:B

    packed-switch p0, :pswitch_data_16

    sget p0, Lcom/opera/android/widget/UrlFieldEditText;->i0:I

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_a
    const/4 p0, 0x0

    return-object p0

    :pswitch_c
    sget-object p0, Lxne;->b:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_c
        :pswitch_a
    .end packed-switch
.end method
