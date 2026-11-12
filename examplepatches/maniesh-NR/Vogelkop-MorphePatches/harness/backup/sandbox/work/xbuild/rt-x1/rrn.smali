.class public final synthetic Lrrn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsrn;


# direct methods
.method public synthetic constructor <init>(Lsrn;B)V
    .registers 3

    iput-byte p2, p0, Lrrn;->a:B

    iput-object p1, p0, Lrrn;->b:Lsrn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lrrn;->a:B

    iget-object p0, p0, Lrrn;->b:Lsrn;

    packed-switch v0, :pswitch_data_34

    new-instance v0, Lwll;

    iget-object p0, p0, Lsrn;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {v0, p0}, Lwll;-><init>(Ldx3;)V

    return-object v0

    :pswitch_f
    new-instance v0, Le62;

    iget-object v1, p0, Lsrn;->p:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj62;

    iget-object v2, p0, Lsrn;->k:Lrw3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lurn;

    new-instance v3, Lqfl;

    const/16 v4, 0x19

    invoke-direct {v3, p0, v4}, Lqfl;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lsrn;->l:Lrw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld12;

    invoke-direct {v0, v1, v2, v3, p0}, Le62;-><init>(Lj62;Lurn;Lqfl;Ld12;)V

    return-object v0

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
