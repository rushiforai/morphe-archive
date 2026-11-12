.class public final synthetic Lhdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Leve;


# direct methods
.method public synthetic constructor <init>(Leve;B)V
    .registers 3

    iput-byte p2, p0, Lhdn;->a:B

    iput-object p1, p0, Lhdn;->b:Leve;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lhdn;->a:B

    const/16 v1, 0x1003

    iget-object p0, p0, Lhdn;->b:Leve;

    check-cast p1, Lfdn;

    packed-switch v0, :pswitch_data_4a

    iget-object v0, p0, Leve;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    new-instance v2, Lg3b;

    iget-object p0, p0, Leve;->d:Ljava/lang/Object;

    check-cast p0, Ltah;

    invoke-direct {v2, p1, p0}, Lg3b;-><init>(Lfdn;Ltah;)V

    invoke-static {v2, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_20
    iget-object v0, p0, Leve;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    new-instance v2, Lg3b;

    iget-object p0, p0, Leve;->d:Ljava/lang/Object;

    check-cast p0, Ltah;

    invoke-direct {v2, p1, p0}, Lg3b;-><init>(Lfdn;Ltah;)V

    invoke-static {v2, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_35
    iget-object v0, p0, Leve;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    new-instance v2, Lg3b;

    iget-object p0, p0, Leve;->d:Ljava/lang/Object;

    check-cast p0, Ltah;

    invoke-direct {v2, p1, p0}, Lg3b;-><init>(Lfdn;Ltah;)V

    invoke-static {v2, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_35
        :pswitch_20
    .end packed-switch
.end method
