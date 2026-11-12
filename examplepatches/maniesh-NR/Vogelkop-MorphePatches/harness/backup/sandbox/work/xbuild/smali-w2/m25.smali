.class public final synthetic Lm25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lm25;->a:B

    iput-object p1, p0, Lm25;->b:Ljava/lang/Object;

    iput-object p2, p0, Lm25;->c:Ljava/lang/Object;

    iput-object p3, p0, Lm25;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lm25;->a:B

    iget-object v1, p0, Lm25;->d:Ljava/lang/Object;

    iget-object v2, p0, Lm25;->c:Ljava/lang/Object;

    iget-object p0, p0, Lm25;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_82

    check-cast p0, Liuh;

    check-cast v2, Landroid/net/Uri;

    check-cast v1, Lxnj;

    check-cast p1, [B

    iget-object p0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Lv4b;

    sget-object v0, Lu4b;->a:Lu4b;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-virtual {p0, v2, p1, v0}, Lv4b;->j(Landroid/net/Uri;[BLjava/util/EnumSet;)V

    invoke-virtual {v1, v2}, Lxnj;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_24
    check-cast p0, Lkcj;

    check-cast v2, Lhcj;

    check-cast v1, Ln61;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_3e

    iget-object p0, p0, Lkcj;->l:Llcj;

    iget-object p0, p0, Llcj;->a:Llld;

    invoke-virtual {v2}, Lhcj;->a()Lhcj;

    move-result-object p1

    invoke-virtual {p0, p1}, Llld;->o0(Lhcj;)V

    goto :goto_42

    :cond_3e
    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Ln61;->a(I)V

    :goto_42
    return-void

    :pswitch_43
    check-cast p0, Lvsi;

    check-cast v2, Lcom/opera/android/browser/SimpleUrlLoader;

    check-cast v1, Ltsi;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lvsi;->c:Lcom/opera/android/browser/SimpleUrlLoader;

    if-ne v0, v2, :cond_6f

    const/4 v0, 0x0

    iput-object v0, p0, Lvsi;->c:Lcom/opera/android/browser/SimpleUrlLoader;

    const/4 v2, 0x3

    iput v2, p0, Lvsi;->b:I

    const/4 v2, 0x0

    iput v2, p0, Lvsi;->f:I

    const-wide/16 v2, 0x96

    iput-wide v2, p0, Lvsi;->g:J

    iget-object v2, p0, Lvsi;->d:Ltsi;

    if-eqz v2, :cond_6f

    iget-object v2, v2, Ltsi;->c:Ltn;

    iget-object v3, p0, Lvsi;->j:Lh6e;

    iget-boolean v1, v1, Ltsi;->b:Z

    invoke-static {p1, v3, v1}, Lvsi;->d(Ljava/lang/String;Lusi;Z)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {v2, p1}, Ltn;->L(Ljava/util/List;)V

    iput-object v0, p0, Lvsi;->d:Ltsi;

    :cond_6f
    return-void

    :pswitch_70
    check-cast p0, Ln25;

    check-cast v2, Ls25;

    check-cast v1, Liu2;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Ln25;->i:I

    invoke-virtual {p0, v2, v1}, Ln25;->e(Ls25;Liu2;)V

    return-void

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_70
        :pswitch_43
        :pswitch_24
    .end packed-switch
.end method
