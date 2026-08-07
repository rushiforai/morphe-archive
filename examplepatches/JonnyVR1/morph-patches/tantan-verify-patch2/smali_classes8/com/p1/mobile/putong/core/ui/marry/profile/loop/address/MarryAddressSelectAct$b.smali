.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->e2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;I)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/content/Intent;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->g2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, -0x1

    .line 23
    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$b;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    return-void
.end method
