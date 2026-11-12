.class public final synthetic Lx8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly8k;

.field public final synthetic c:Lch5;


# direct methods
.method public synthetic constructor <init>(Ly8k;Lch5;B)V
    .registers 4

    iput-byte p3, p0, Lx8k;->a:B

    iput-object p1, p0, Lx8k;->b:Ly8k;

    iput-object p2, p0, Lx8k;->c:Lch5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lx8k;->a:B

    sget-object v1, Lkl0;->j:Lkl0;

    iget-object v2, p0, Lx8k;->c:Lch5;

    iget-object p0, p0, Lx8k;->b:Ly8k;

    packed-switch v0, :pswitch_data_50

    iget-object p0, p0, Ly8k;->b:Lwsf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lvsf;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v1, v3}, Lvsf;-><init>(Lwsf;Lkl0;B)V

    invoke-virtual {p0, v0}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Lrxh;

    const v1, 0x7f141083

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const-string v1, "https://www.opera.com/privacy"

    invoke-static {p0, v1, v0}, Lcom/opera/android/FullscreenWebActivity;->z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2d
    iget-object p0, p0, Ly8k;->b:Lwsf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lvsf;

    const/4 v3, 0x1

    invoke-direct {v0, p0, v1, v3}, Lvsf;-><init>(Lwsf;Lkl0;B)V

    invoke-virtual {p0, v0}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Lrxh;

    const v1, 0x7f14120d

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const-string v1, "https://www.opera.com/terms"

    invoke-static {p0, v1, v0}, Lcom/opera/android/FullscreenWebActivity;->z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method
