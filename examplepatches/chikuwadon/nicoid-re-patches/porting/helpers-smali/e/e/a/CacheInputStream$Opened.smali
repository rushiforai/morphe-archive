.class Le/e/a/CacheInputStream$Opened;
.super Ljava/lang/Object;
.source "CacheInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CacheInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Opened"
.end annotation


# instance fields
.field descriptor:Landroid/os/ParcelFileDescriptor;

.field entry:Le/e/a/CachePackIndex$Entry;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/CacheInputStream$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/CacheInputStream$1;

    .line 5
    invoke-direct {p0}, Le/e/a/CacheInputStream$Opened;-><init>()V

    return-void
.end method
