.class public final synthetic Ldok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkok;


# direct methods
.method public synthetic constructor <init>(Lkok;B)V
    .registers 3

    iput-byte p2, p0, Ldok;->a:B

    iput-object p1, p0, Ldok;->b:Lkok;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ldok;->a:B

    iget-object p0, p0, Ldok;->b:Lkok;

    packed-switch v0, :pswitch_data_22

    check-cast p1, Ljava/lang/Integer;

    iget-object p0, p0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Lcom/opera/android/custom_views/FadingRecyclerView;->requestLayout()V

    return-void

    :pswitch_f
    check-cast p1, Lvr8;

    iget-object p1, p0, Lkok;->k:Lhok;

    if-eqz p1, :cond_20

    iget-object p0, p0, Lkok;->t:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvr8;

    invoke-virtual {p1, p0}, Lns8;->X(Lvr8;)V

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
