.class public final synthetic Lcc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:Lpc9;

.field public final synthetic b:J

.field public final synthetic c:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lpc9;JLandroid/net/Uri;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcc9;->a:Lpc9;

    iput-wide p2, p0, Lcc9;->b:J

    iput-object p4, p0, Lcc9;->c:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lcc9;->a:Lpc9;

    iget-object v1, v0, Lpc9;->c:Lbf9;

    invoke-virtual {v0}, Lpc9;->c()Ljvd;

    move-result-object v2

    iget-object v3, p0, Lcc9;->c:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v2, v2, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v4, Livd;

    iget-wide v5, p0, Lcc9;->b:J

    const/4 p0, 0x0

    invoke-direct {v4, v3, v5, v6, p0}, Livd;-><init>(Ljava/lang/String;JB)V

    const/4 v3, 0x1

    invoke-static {v2, p0, v3, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    invoke-virtual {v0}, Lpc9;->c()Ljvd;

    move-result-object v2

    iget-object v2, v2, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v4, Lx41;

    const/16 v7, 0xd

    invoke-direct {v4, v5, v6, v7}, Lx41;-><init>(JB)V

    invoke-static {v2, v3, p0, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfvd;

    const/4 v2, 0x0

    if-eqz p0, :cond_6a

    iget-object v0, v0, Lpc9;->j:Ljc9;

    if-eqz v0, :cond_6a

    iget-object v0, v0, Ljc9;->a:Ljava/util/HashMap;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_49

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_4a

    :cond_49
    const/4 v0, -0x1

    :goto_4a
    if-ltz v0, :cond_6a

    invoke-virtual {v1}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v3

    if-eqz v3, :cond_5d

    iget-object v1, v1, Lbf9;->a:Loji;

    invoke-virtual {v1}, Loji;->u()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v3, v1}, Lpc9;->a(Lfvd;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;)Lhb9;

    move-result-object p0

    goto :goto_5e

    :cond_5d
    move-object p0, v2

    :goto_5e
    if-eqz p0, :cond_6a

    new-instance v1, Landroid/util/Pair;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {v1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :cond_6a
    return-object v2
.end method
