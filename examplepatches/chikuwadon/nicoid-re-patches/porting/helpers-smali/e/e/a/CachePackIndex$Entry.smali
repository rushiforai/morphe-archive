.class public Le/e/a/CachePackIndex$Entry;
.super Ljava/lang/Object;
.source "CachePackIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CachePackIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation


# instance fields
.field public name:Ljava/lang/String;

.field public offset:J

.field public size:J

.field public time:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JJJ)V
    .registers 8
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "o"    # J
    .param p4, "s"    # J
    .param p6, "t"    # J

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CachePackIndex$Entry;->name:Ljava/lang/String;

    iput-wide p2, p0, Le/e/a/CachePackIndex$Entry;->offset:J

    iput-wide p4, p0, Le/e/a/CachePackIndex$Entry;->size:J

    iput-wide p6, p0, Le/e/a/CachePackIndex$Entry;->time:J

    return-void
.end method
