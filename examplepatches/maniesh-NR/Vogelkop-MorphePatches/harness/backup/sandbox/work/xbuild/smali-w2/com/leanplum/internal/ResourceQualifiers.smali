.class public Lcom/leanplum/internal/ResourceQualifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/ResourceQualifiers$Qualifier;,
        Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;
    }
.end annotation


# instance fields
.field public qualifiers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/leanplum/internal/ResourceQualifiers$Qualifier;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/ResourceQualifiers;->qualifiers:Ljava/util/Map;

    return-void
.end method

.method public static fromFolder(Ljava/lang/String;)Lcom/leanplum/internal/ResourceQualifiers;
    .registers 10

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    const-string v1, "-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_13
    if-ge v3, v1, :cond_3d

    aget-object v5, p0, v3

    move v6, v2

    :goto_18
    if-nez v6, :cond_3a

    invoke-static {}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->values()[Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    move-result-object v7

    array-length v7, v7

    if-ge v4, v7, :cond_3a

    invoke-static {}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->values()[Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    move-result-object v7

    aget-object v7, v7, v4

    invoke-virtual {v7}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->getFilter()Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;->getMatch(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_37

    iget-object v6, v0, Lcom/leanplum/internal/ResourceQualifiers;->qualifiers:Ljava/util/Map;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v6, 0x1

    :cond_37
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    :cond_3a
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_3d
    return-object v0
.end method
