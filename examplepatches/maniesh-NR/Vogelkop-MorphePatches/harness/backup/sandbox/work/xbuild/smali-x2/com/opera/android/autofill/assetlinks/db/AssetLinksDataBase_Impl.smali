.class public final Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase_Impl;
.super Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0001\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase_Impl;",
        "Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final m:Lzyk;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase;-><init>()V

    new-instance v0, Lpa;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase_Impl;->m:Lzyk;

    return-void
.end method


# virtual methods
.method public final d(Ljava/util/LinkedHashMap;)Ljava/util/List;
    .registers 2

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method public final e()Lpjb;
    .registers 6

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v2, Lpjb;

    const-string v3, "asset_links"

    const-string v4, "whitelisted_domains"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v0, v1, v3}, Lpjb;-><init>(Ly5i;Ljava/util/HashMap;Ljava/util/HashMap;[Ljava/lang/String;)V

    return-object v2
.end method

.method public final f()Lc6i;
    .registers 2

    new-instance v0, Lsv0;

    invoke-direct {v0, p0}, Lsv0;-><init>(Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase_Impl;)V

    return-object v0
.end method

.method public final j()Ljava/util/Set;
    .registers 1

    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    return-object p0
.end method

.method public final l()Ljava/util/LinkedHashMap;
    .registers 3

    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    const-class v0, Lob2;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    sget-object v1, Ll08;->a:Ll08;

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final x()Lob2;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase_Impl;->m:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lob2;

    return-object p0
.end method
