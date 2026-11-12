.class public final synthetic Lec9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpc9;


# direct methods
.method public synthetic constructor <init>(Lpc9;B)V
    .registers 3

    iput-byte p2, p0, Lec9;->a:B

    iput-object p1, p0, Lec9;->b:Lpc9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lec9;->a:B

    const/16 v1, 0x9

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lec9;->b:Lpc9;

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_f2

    invoke-virtual {p0}, Lpc9;->c()Ljvd;

    move-result-object v0

    iget-object v0, v0, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v1, Luvc;

    const/16 v5, 0xa

    invoke-direct {v1, v5}, Luvc;-><init>(B)V

    invoke-static {v0, v4, v3, v1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    iget-object p0, p0, Lpc9;->j:Ljc9;

    if-eqz p0, :cond_2f

    iget-object p0, p0, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    if-lez v0, :cond_2f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_2f
    return-object v2

    :pswitch_30
    iget-object v0, p0, Lpc9;->c:Lbf9;

    iget-object v5, p0, Lpc9;->j:Ljc9;

    if-eqz v5, :cond_8f

    iget-object v2, v5, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    iget-object v5, p0, Lpc9;->j:Ljc9;

    iget-object v5, v5, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    invoke-virtual {p0}, Lpc9;->c()Ljvd;

    move-result-object v5

    iget-object v5, v5, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v6, Luvc;

    invoke-direct {v6, v1}, Luvc;-><init>(B)V

    invoke-static {v5, v3, v4, v6}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v5

    if-eqz v5, :cond_6f

    iget-object v0, v0, Lbf9;->a:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v5, v0, v3}, Lpc9;->b(Ljava/util/List;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_6f
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_73
    if-ge v4, v0, :cond_85

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v4, v4, 0x1

    check-cast v1, Lhb9;

    iget-object v5, p0, Lpc9;->j:Ljc9;

    iget-wide v6, v1, Lhb9;->b:J

    invoke-virtual {v5, v6, v7}, Ljc9;->a(J)I

    goto :goto_73

    :cond_85
    new-instance p0, Landroid/util/Pair;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v2, p0

    :cond_8f
    return-object v2

    :pswitch_90
    invoke-virtual {p0}, Lpc9;->c()Ljvd;

    move-result-object p0

    iget-object p0, p0, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v0, Luvc;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Luvc;-><init>(B)V

    invoke-static {p0, v3, v4, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    return-object p0

    :pswitch_a4
    invoke-virtual {p0}, Lpc9;->c()Ljvd;

    move-result-object v0

    iget-object v0, v0, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v2, Luvc;

    invoke-direct {v2, v1}, Luvc;-><init>(B)V

    invoke-static {v0, v3, v4, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v2, p0, Lpc9;->c:Lbf9;

    invoke-virtual {v2}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v3

    if-eqz v3, :cond_cf

    iget-object v2, v2, Lbf9;->a:Loji;

    invoke-virtual {v2}, Loji;->u()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v3, v2, v1}, Lpc9;->b(Ljava/util/List;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_cf
    iget-object v0, p0, Lpc9;->j:Ljc9;

    if-nez v0, :cond_f0

    new-instance v0, Ljc9;

    invoke-direct {v0, v4}, Ljc9;-><init>(B)V

    iput-object v0, p0, Lpc9;->j:Ljc9;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_de
    if-ge v4, v0, :cond_f0

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    check-cast v2, Lhb9;

    iget-object v3, p0, Lpc9;->j:Ljc9;

    iget-wide v5, v2, Lhb9;->b:J

    invoke-virtual {v3, v5, v6}, Ljc9;->a(J)I

    goto :goto_de

    :cond_f0
    return-object v1

    nop

    :pswitch_data_f2
    .packed-switch 0x0
        :pswitch_a4
        :pswitch_90
        :pswitch_30
    .end packed-switch
.end method
