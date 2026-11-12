.class public final synthetic Lk62;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls62;


# direct methods
.method public synthetic constructor <init>(Ls62;B)V
    .registers 3

    iput-byte p2, p0, Lk62;->a:B

    iput-object p1, p0, Lk62;->b:Ls62;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lk62;->a:B

    iget-object p0, p0, Lk62;->b:Ls62;

    packed-switch v0, :pswitch_data_40

    new-instance v0, Lrni;

    iget-object v1, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    iget-object p0, p0, Ls62;->o:Lqdc;

    invoke-direct {v0, v1, p0}, Lrni;-><init>(Landroid/content/Context;Lqdc;)V

    return-object v0

    :pswitch_15
    iget-object v0, p0, Ls62;->s:Lode;

    iget-object v1, p0, Ls62;->t:Lkze;

    new-instance v2, Lve5;

    invoke-direct {v2, p0}, Lve5;-><init>(Ls62;)V

    const/4 p0, 0x0

    invoke-static {p0, v0, v1, v2}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object p0

    invoke-static {p0}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p0

    return-object p0

    :pswitch_28
    iget-object p0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p0

    new-instance v0, Luyj;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Luyj;-><init>(Ldx3;Lumi;)V

    return-object v0

    :pswitch_36
    invoke-virtual {p0}, Ls62;->f()Lqyj;

    move-result-object p0

    return-object p0

    :pswitch_3b
    invoke-virtual {p0}, Ls62;->f()Lqyj;

    move-result-object p0

    return-object p0

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_36
        :pswitch_28
        :pswitch_15
    .end packed-switch
.end method
