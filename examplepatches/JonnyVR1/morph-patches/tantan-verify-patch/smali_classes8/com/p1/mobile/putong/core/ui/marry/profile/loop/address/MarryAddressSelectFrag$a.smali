.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->N4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->N4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p3}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;->a(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
