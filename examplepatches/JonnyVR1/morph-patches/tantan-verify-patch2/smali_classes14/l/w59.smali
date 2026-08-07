.class public final synthetic Ll/w59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w59;->a:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    iput-object p2, p0, Ll/w59;->b:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w59;->a:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    iget-object p0, p0, Ll/w59;->b:Ljava/util/concurrent/atomic/AtomicReference;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)V

    return-void
.end method
