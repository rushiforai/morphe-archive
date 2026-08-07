.class public Ll/quq$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/quq;->W(Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jl80;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/quq$h;->a:Ll/jl80;

    .line 2
    .line 3
    iput-object p2, p0, Ll/quq$h;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/quq$h;->a:Ll/jl80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    const-string v0, "e_verify_add_likes_buy_vip"

    .line 7
    .line 8
    const-string v1, "p_verify_to_like_more_popup"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/spl0;->m()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "p_home,verification_card"

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->I4()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v2, "unknown_"

    .line 30
    .line 31
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTriggerShowType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTriggerShowType;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

    .line 42
    .line 43
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->sceneTriggerDialog:Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LeftSwipeLimitConfig;->swipeLimit:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;

    .line 52
    .line 53
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;->showType:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTriggerShowType;

    .line 54
    .line 55
    :cond_0
    const-string v0, "svip"

    .line 56
    .line 57
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Ll/quq$h;->b:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 74
    .line 75
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-object p0, p0, Ll/quq$h;->b:Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 82
    .line 83
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    iget-object p0, p0, Ll/quq$h;->b:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 90
    .line 91
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method
