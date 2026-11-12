.class public final synthetic Lonc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj4c;


# direct methods
.method public synthetic constructor <init>(Lj4c;B)V
    .registers 3

    iput-byte p2, p0, Lonc;->a:B

    iput-object p1, p0, Lonc;->b:Lj4c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lonc;->a:B

    iget-object p0, p0, Lonc;->b:Lj4c;

    packed-switch v0, :pswitch_data_20

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfqe;

    invoke-virtual {p0}, Lfqe;->b()Lp1c;

    move-result-object p0

    return-object p0

    :pswitch_12
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le59;

    sget-object v0, Ld59;->e:Ld59;

    invoke-virtual {p0, v0}, Le59;->b(Ld59;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
