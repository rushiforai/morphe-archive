.class public final Luvj;
.super Lqw4;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Luvj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 8

    iget-byte p0, p0, Luvj;->a:B

    sget-object v0, Lvvj;->c:Lvvj;

    packed-switch p0, :pswitch_data_76

    check-cast p1, Lre7;

    check-cast p2, Lre7;

    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object p0

    iget-object v1, p1, Lre7;->m:Ljava/lang/String;

    iget-object v2, p2, Lre7;->m:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_1f

    iget-object p0, v0, Lvvj;->b:Lqw4;

    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    :cond_1f
    return p0

    :pswitch_20
    check-cast p1, Lre7;

    check-cast p2, Lre7;

    invoke-virtual {p1}, Lre7;->k()Z

    move-result p0

    if-eqz p0, :cond_3b

    iget-object p0, p2, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->n()J

    move-result-wide v1

    iget-object p0, p1, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->n()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Lcs5;->p(JJ)I

    move-result p0

    goto :goto_43

    :cond_3b
    iget-wide v1, p2, Lre7;->o:J

    iget-wide v3, p1, Lre7;->o:J

    invoke-static {v1, v2, v3, v4}, Lcs5;->p(JJ)I

    move-result p0

    :goto_43
    if-nez p0, :cond_4b

    iget-object p0, v0, Lvvj;->b:Lqw4;

    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    :cond_4b
    return p0

    :pswitch_4c
    check-cast p1, Lre7;

    check-cast p2, Lre7;

    iget-wide v1, p2, Lre7;->j:J

    iget-wide v3, p1, Lre7;->j:J

    invoke-static {v1, v2, v3, v4}, Lcs5;->p(JJ)I

    move-result p0

    if-nez p0, :cond_60

    iget-object p0, v0, Lvvj;->b:Lqw4;

    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    :cond_60
    return p0

    :pswitch_61
    check-cast p1, Lre7;

    check-cast p2, Lre7;

    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object p0

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lre7;->f()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_61
        :pswitch_4c
        :pswitch_20
    .end packed-switch
.end method
