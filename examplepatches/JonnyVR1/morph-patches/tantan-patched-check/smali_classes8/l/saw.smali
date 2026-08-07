.class public final synthetic Ll/saw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/saw;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    iput-object p2, p0, Ll/saw;->b:Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    iput-object p3, p0, Ll/saw;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/saw;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    iget-object v1, p0, Ll/saw;->b:Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    iget-object p0, p0, Ll/saw;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;->a(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;Lcom/p1/mobile/android/app/Act;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
