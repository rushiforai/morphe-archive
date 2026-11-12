.class public final synthetic Lz12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb22;

.field public final synthetic c:Lxy3;


# direct methods
.method public synthetic constructor <init>(Lb22;Lxy3;B)V
    .registers 4

    iput-byte p3, p0, Lz12;->a:B

    iput-object p1, p0, Lz12;->b:Lb22;

    iput-object p2, p0, Lz12;->c:Lxy3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lz12;->a:B

    const/4 v1, 0x3

    iget-object v2, p0, Lz12;->c:Lxy3;

    iget-object p0, p0, Lz12;->b:Lb22;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/util/List;

    packed-switch v0, :pswitch_data_3c

    new-instance v0, Lc5o;

    iget-object p0, p0, Lb22;->v:Lcom/opera/android/BrowserActivity;

    invoke-direct {v0, p0, v1}, Lc5o;-><init>(Landroid/content/Context;B)V

    iget-object p0, v2, Ls62;->p:Lq52;

    iget-object p0, p0, Lq52;->c:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo52;

    invoke-virtual {v0, p2, p0, p1}, Lc5o;->E(Ljava/util/List;Lo52;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    new-instance v0, Lc5o;

    iget-object p0, p0, Lb22;->v:Lcom/opera/android/BrowserActivity;

    invoke-direct {v0, p0, v1}, Lc5o;-><init>(Landroid/content/Context;B)V

    iget-object p0, v2, Ls62;->p:Lq52;

    iget-object p0, p0, Lq52;->c:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo52;

    invoke-virtual {v0, p2, p0, p1}, Lc5o;->i(Ljava/util/List;Lo52;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method
