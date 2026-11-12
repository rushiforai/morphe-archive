.class public final synthetic Lxqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyqm;


# direct methods
.method public synthetic constructor <init>(Lyqm;B)V
    .registers 3

    iput-byte p2, p0, Lxqm;->a:B

    iput-object p1, p0, Lxqm;->b:Lyqm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lxqm;->a:B

    iget-object p0, p0, Lxqm;->b:Lyqm;

    packed-switch p1, :pswitch_data_2c

    iget-object p1, p0, Lfmj;->d:Lfqk;

    if-eqz p1, :cond_18

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v0, p0, Lyqm;->f:Lnv6;

    invoke-virtual {v0, p1}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    iget-object p0, p0, Lfmj;->c:Lhqk;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_18
    return-void

    :pswitch_19
    iget-object p1, p0, Lfmj;->d:Lfqk;

    if-eqz p1, :cond_2a

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v0, p0, Lyqm;->f:Lnv6;

    invoke-virtual {v0, p1}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    iget-object p0, p0, Lfmj;->c:Lhqk;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_2a
    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
