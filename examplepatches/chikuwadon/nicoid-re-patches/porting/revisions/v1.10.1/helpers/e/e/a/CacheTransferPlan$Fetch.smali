.class interface abstract Le/e/a/CacheTransferPlan$Fetch;
.super Ljava/lang/Object;
.source "CacheTransferPlan.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CacheTransferPlan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "Fetch"
.end annotation


# virtual methods
.method public abstract assets(I)V
.end method

.method public abstract length(Ljava/net/URL;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract text(Ljava/net/URL;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
