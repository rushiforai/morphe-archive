.class public final synthetic Le/e/a/ImageDiskCache$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 0
    check-cast p1, Le/e/a/ImageDiskCache$Entry;

    check-cast p2, Le/e/a/ImageDiskCache$Entry;

    invoke-static {p1, p2}, Le/e/a/ImageDiskCache;->lambda$0(Le/e/a/ImageDiskCache$Entry;Le/e/a/ImageDiskCache$Entry;)I

    move-result p1

    return p1
.end method
