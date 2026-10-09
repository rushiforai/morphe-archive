.class Le/e/a/CachePack$Index;
.super Ljava/lang/Object;
.source "CachePack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CachePack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Index"
.end annotation


# instance fields
.field entries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/CachePackIndex$Entry;",
            ">;"
        }
    .end annotation
.end field

.field size:J

.field time:J


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/CachePack$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/CachePack$1;

    .line 6
    invoke-direct {p0}, Le/e/a/CachePack$Index;-><init>()V

    return-void
.end method
