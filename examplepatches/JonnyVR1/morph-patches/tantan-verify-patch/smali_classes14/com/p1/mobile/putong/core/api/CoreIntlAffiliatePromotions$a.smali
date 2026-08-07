.class public Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sw0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->z4()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onBack()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 7
    .line 8
    const-string v0, "app_back"

    .line 9
    .line 10
    invoke-static {v0}, Ll/r3n;->g(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->j3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public onFront()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 7
    .line 8
    const-string v0, "app_front"

    .line 9
    .line 10
    invoke-static {v0}, Ll/r3n;->j(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->k3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
