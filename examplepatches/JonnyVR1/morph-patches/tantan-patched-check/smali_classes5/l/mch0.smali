.class public final synthetic Ll/mch0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/SurpriseGift;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mch0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/mch0;->b:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mch0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/mch0;->b:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    invoke-static {v0, p0, p1}, Ll/och0$a;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;Landroid/content/DialogInterface;)V

    return-void
.end method
