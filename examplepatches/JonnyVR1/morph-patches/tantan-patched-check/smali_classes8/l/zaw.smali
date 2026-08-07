.class public final synthetic Ll/zaw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zaw;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    iput-object p2, p0, Ll/zaw;->b:Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    iput-object p3, p0, Ll/zaw;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zaw;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    iget-object v1, p0, Ll/zaw;->b:Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    iget-object p0, p0, Ll/zaw;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;->b(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;Lcom/p1/mobile/android/app/Act;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
