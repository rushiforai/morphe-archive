.class public final synthetic Lg62;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk42;


# direct methods
.method public synthetic constructor <init>(Lk42;B)V
    .registers 3

    iput-byte p2, p0, Lg62;->a:B

    iput-object p1, p0, Lg62;->b:Lk42;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lg62;->a:B

    iget-object p0, p0, Lg62;->b:Lk42;

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Lk42;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    return-object p0

    :pswitch_10
    iget-object p0, p0, Lk42;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
