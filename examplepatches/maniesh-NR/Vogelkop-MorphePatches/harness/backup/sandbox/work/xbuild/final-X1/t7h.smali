.class public final synthetic Lt7h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lw7h;


# direct methods
.method public synthetic constructor <init>(Lw7h;B)V
    .registers 3

    iput-byte p2, p0, Lt7h;->a:B

    iput-object p1, p0, Lt7h;->b:Lw7h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lt7h;->a:B

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x8

    const/4 v6, 0x1

    const v7, 0x7fffffff

    iget-object p0, p0, Lt7h;->b:Lw7h;

    packed-switch v0, :pswitch_data_76

    iget-object p0, p0, Lw7h;->u:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lizj;

    iget-object p0, p0, Lizj;->d:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltta;

    if-nez p0, :cond_45

    goto :goto_47

    :pswitch_23
    iget-object p0, p0, Lw7h;->q:Lgy;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ley;

    iget-wide v7, p0, Ley;->a:J

    and-long/2addr v7, v4

    cmp-long p0, v7, v2

    if-eqz p0, :cond_70

    goto :goto_6f

    :pswitch_33
    iget-object p0, p0, Lw7h;->u:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lizj;

    iget-object p0, p0, Lizj;->d:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltta;

    if-eqz p0, :cond_47

    :cond_45
    iget v7, p0, Ltta;->c:I

    :cond_47
    :goto_47
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_4c
    iget-object p0, p0, Lw7h;->t:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgx8;

    iget-object p0, p0, Lgx8;->d:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    return-object p0

    :pswitch_60
    iget-object p0, p0, Lw7h;->q:Lgy;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ley;

    iget-wide v7, p0, Ley;->a:J

    and-long/2addr v7, v4

    cmp-long p0, v7, v2

    if-eqz p0, :cond_70

    :goto_6f
    move v1, v6

    :cond_70
    xor-int/2addr v1, v6

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_60
        :pswitch_4c
        :pswitch_33
        :pswitch_23
        :pswitch_4c
    .end packed-switch
.end method
