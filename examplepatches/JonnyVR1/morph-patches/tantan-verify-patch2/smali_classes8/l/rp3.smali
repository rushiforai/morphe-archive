.class public final synthetic Ll/rp3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rp3;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/rp3;->b:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Ll/rp3;->c:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rp3;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/rp3;->b:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Ll/rp3;->c:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->c(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
