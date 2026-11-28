.class Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;
.super Ljava/lang/Object;
.source "MoreObjects.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/MoreObjects$ToStringHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ValueHolder"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field next:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

.field value:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 455
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
