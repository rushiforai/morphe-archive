.class final Le/e/a/CacheFolders$Index;
.super Ljava/lang/Object;
.source "CacheFolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CacheFolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Index"
.end annotation


# instance fields
.field final files:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field refreshed:J


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/CacheFolders$Index;->files:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/CacheFolders$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/CacheFolders$1;

    .line 42
    invoke-direct {p0}, Le/e/a/CacheFolders$Index;-><init>()V

    return-void
.end method
