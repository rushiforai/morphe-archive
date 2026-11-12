.class public final synthetic Lr1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv1a;


# direct methods
.method public synthetic constructor <init>(Lv1a;B)V
    .registers 3

    iput-byte p2, p0, Lr1a;->a:B

    iput-object p1, p0, Lr1a;->b:Lv1a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lr1a;->a:B

    iget-object p0, p0, Lr1a;->b:Lv1a;

    packed-switch v0, :pswitch_data_18

    new-instance v0, Lcom/opera/android/browser/chromium/CookieManager;

    invoke-direct {v0}, Lcom/opera/android/browser/chromium/CookieManager;-><init>()V

    iput-object v0, p0, Lv1a;->d:Lcom/opera/android/browser/chromium/CookieManager;

    iget-object p0, p0, Lv1a;->c:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Lv1a;->b()V

    return-void

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
