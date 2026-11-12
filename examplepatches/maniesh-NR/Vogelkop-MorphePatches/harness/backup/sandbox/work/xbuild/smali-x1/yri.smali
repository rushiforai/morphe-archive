.class public final synthetic Lyri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzri;


# direct methods
.method public synthetic constructor <init>(Lzri;B)V
    .registers 3

    iput-byte p2, p0, Lyri;->a:B

    iput-object p1, p0, Lyri;->b:Lzri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lyri;->a:B

    iget-object p0, p0, Lyri;->b:Lzri;

    packed-switch p1, :pswitch_data_22

    iget-object p1, p0, Lfmj;->d:Lfqk;

    if-eqz p1, :cond_13

    iget-object p0, p0, Lfmj;->c:Lhqk;

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_13
    return-void

    :pswitch_14
    iget-object p1, p0, Lfmj;->d:Lfqk;

    if-eqz p1, :cond_20

    iget-object p0, p0, Lfmj;->c:Lhqk;

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
