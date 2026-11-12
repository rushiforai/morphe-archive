.class public final synthetic Lmu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lru;


# direct methods
.method public synthetic constructor <init>(Lru;B)V
    .registers 3

    iput-byte p2, p0, Lmu;->a:B

    iput-object p1, p0, Lmu;->b:Lru;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lmu;->a:B

    iget-object p0, p0, Lmu;->b:Lru;

    packed-switch p1, :pswitch_data_18

    invoke-virtual {p0}, Lru;->H0()Ltab;

    move-result-object p0

    iget-object p1, p0, Ltab;->c:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Lru;->L0()V

    return-void

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
