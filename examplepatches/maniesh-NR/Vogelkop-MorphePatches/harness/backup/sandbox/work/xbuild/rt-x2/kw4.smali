.class public final synthetic Lkw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:B

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lkw4;->a:B

    iput-object p1, p0, Lkw4;->c:Ljava/lang/Object;

    iput-byte p2, p0, Lkw4;->b:B

    iput-object p3, p0, Lkw4;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IB)V
    .registers 5

    .line 12
    iput-byte p4, p0, Lkw4;->a:B

    iput-object p1, p0, Lkw4;->c:Ljava/lang/Object;

    iput-object p2, p0, Lkw4;->d:Ljava/lang/Object;

    iput-byte p3, p0, Lkw4;->b:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lkw4;->a:B

    iget-byte v1, p0, Lkw4;->b:B

    iget-object v2, p0, Lkw4;->d:Ljava/lang/Object;

    iget-object p0, p0, Lkw4;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5c

    check-cast p0, Lvrd;

    check-cast v2, Landroid/util/Pair;

    iget-object p0, p0, Lvrd;->b:Lvq8;

    iget-object p0, p0, Lvq8;->i:Ljava/lang/Object;

    check-cast p0, Lel6;

    iget-object v0, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljrd;

    invoke-virtual {p0, v0, v2, v1}, Lel6;->f(ILjrd;I)V

    return-void

    :pswitch_25
    check-cast p0, Lam7;

    check-cast v2, Lbm7;

    iget v0, p0, Lam7;->a:I

    iget-object p0, p0, Lam7;->b:Ljrd;

    invoke-interface {v2, v0, p0, v1}, Lbm7;->f(ILjrd;I)V

    return-void

    :pswitch_31
    check-cast p0, Lcy;

    check-cast v2, Ljava/io/Serializable;

    iget-object p0, p0, Lcy;->c:Ljava/lang/Object;

    check-cast p0, Lh4h;

    invoke-interface {p0, v1, v2}, Lh4h;->b(ILjava/io/Serializable;)V

    return-void

    :pswitch_3d
    check-cast p0, La55;

    check-cast v2, Lchf;

    iget-object p0, p0, La55;->b:Landroid/util/SparseArray;

    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    if-nez p0, :cond_4f

    invoke-interface {v2}, Lchf;->c()V

    goto :goto_52

    :cond_4f
    invoke-virtual {p0, v2}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    :goto_52
    return-void

    :pswitch_53
    check-cast p0, Llw4;

    check-cast v2, Lole;

    invoke-virtual {p0, v2, v1}, Llw4;->a(Lole;I)Z

    return-void

    nop

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_53
        :pswitch_3d
        :pswitch_31
        :pswitch_25
    .end packed-switch
.end method
