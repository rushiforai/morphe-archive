.class public Lcom/momo/mcamera/mask/segment/SegmentFilterFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/segment/SegmentFilterFactory$SegmentType;
    }
.end annotation


# static fields
.field public static final BYTEDANCE:Ljava/lang/String; = "byteDance"

.field public static final MOMO:Ljava/lang/String; = "momo"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createSegmentFilter(Ljava/lang/String;)Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;
    .locals 1

    .line 1
    const-string v0, "byteDance"

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p0, Lcom/momo/mcamera/mask/segment/SegmentFilter;

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/momo/mcamera/mask/segment/SegmentFilter;-><init>()V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method
