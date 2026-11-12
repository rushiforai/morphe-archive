.class public final synthetic Lrnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyqa;

.field public final synthetic c:Lpde;

.field public final synthetic d:Lkol;


# direct methods
.method public synthetic constructor <init>(Lyqa;Lpde;Lkol;B)V
    .registers 5

    iput-byte p4, p0, Lrnl;->a:B

    iput-object p1, p0, Lrnl;->b:Lyqa;

    iput-object p2, p0, Lrnl;->c:Lpde;

    iput-object p3, p0, Lrnl;->d:Lkol;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lrnl;->a:B

    iget-object v1, p0, Lrnl;->d:Lkol;

    iget-object v2, p0, Lrnl;->c:Lpde;

    iget-object p0, p0, Lrnl;->b:Lyqa;

    packed-switch v0, :pswitch_data_36

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->Q0()Lqln;

    move-result-object p0

    iget-object p0, p0, Lqln;->h:Lkze;

    new-instance v0, Lsnl;

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lsnl;-><init>(Lkol;B)V

    invoke-static {p0, v2, v0}, La26;->S(Lekc;Likc;Lf7f;)V

    return-object p0

    :pswitch_1f
    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->w0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc8l;

    new-instance v0, Lqv3;

    const/4 v3, 0x2

    invoke-direct {v0, v1, v3}, Lqv3;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v2, v0}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-object p0

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
