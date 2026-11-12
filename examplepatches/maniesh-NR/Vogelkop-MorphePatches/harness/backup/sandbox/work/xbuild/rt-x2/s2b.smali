.class public final Ls2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmkf;


# instance fields
.field public final synthetic a:B

.field public final b:Lesk;


# direct methods
.method public synthetic constructor <init>(Lesk;B)V
    .registers 3

    iput-byte p2, p0, Ls2b;->a:B

    iput-object p1, p0, Ls2b;->b:Lesk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 4

    iget-byte v0, p0, Ls2b;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Ls2b;->b:Lesk;

    packed-switch v0, :pswitch_data_34

    const-class v0, Lnhf;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1d

    new-instance v1, Lnhf;

    check-cast p0, Lmw3;

    invoke-virtual {p0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhxk;

    invoke-direct {v1, p0}, Lnhf;-><init>(Lhxk;)V

    :cond_1d
    return-object v1

    :pswitch_1e
    const-class v0, Lq2b;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_33

    new-instance v1, Lq2b;

    check-cast p0, Lew3;

    invoke-virtual {p0}, Lew3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu2b;

    invoke-direct {v1, p0}, Lq2b;-><init>(Lu2b;)V

    :cond_33
    return-object v1

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
