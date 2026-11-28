.class final Lcom/google/common/base/MoreObjects$ToStringHelper$UnconditionalValueHolder;
.super Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;
.source "MoreObjects.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/MoreObjects$ToStringHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnconditionalValueHolder"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 463
    invoke-direct {p0}, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/base/MoreObjects$1;)V
    .registers 2

    .line 463
    invoke-direct {p0}, Lcom/google/common/base/MoreObjects$ToStringHelper$UnconditionalValueHolder;-><init>()V

    return-void
.end method
