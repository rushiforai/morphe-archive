.class public final synthetic Lm2i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo2i;


# direct methods
.method public synthetic constructor <init>(Lo2i;B)V
    .registers 3

    iput-byte p2, p0, Lm2i;->a:B

    iput-object p1, p0, Lm2i;->b:Lo2i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lm2i;->a:B

    iget-object p0, p0, Lm2i;->b:Lo2i;

    check-cast p1, Landroid/view/View;

    check-cast p2, Lef;

    packed-switch v0, :pswitch_data_38

    new-instance p2, Ldd;

    iget-object p0, p0, Lo2i;->d:Lfd;

    invoke-direct {p2, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    iget-object p1, p0, Lo2i;->c:Lew3;

    invoke-virtual {p1}, Lew3;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Le4i;

    iget-object v2, p0, Lo2i;->a:Lcom/opera/android/BrowserActivity;

    sget-object v3, Lo3i;->d:Lo3i;

    iget-object p0, v1, Le4i;->a:Lk3i;

    invoke-virtual {p0}, Lk3i;->a()Likc;

    move-result-object v5

    new-instance v0, Ld4i;

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Ld4i;-><init>(Le4i;Lndc;Lo3i;Ljava/lang/String;Likc;)V

    invoke-virtual {v5, v2, v0}, Lekc;->j(Lndc;Lf7f;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
