.class public final synthetic Ll/i6i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/H5PaymentChannels;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/H5PaymentChannels;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i6i0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/i6i0;->b:Ljava/util/List;

    iput-object p3, p0, Ll/i6i0;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Ll/i6i0;->d:Lcom/p1/mobile/putong/core/data/H5PaymentChannels;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i6i0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/i6i0;->b:Ljava/util/List;

    iget-object v2, p0, Ll/i6i0;->c:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/i6i0;->d:Lcom/p1/mobile/putong/core/data/H5PaymentChannels;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/H5PaymentChannels;Landroid/view/View;)V

    return-void
.end method
