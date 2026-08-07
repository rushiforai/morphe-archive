.class public final Lv/VList_Horizontal$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VList_Horizontal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "f"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static a(Landroid/widget/Scroller;)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/Scroller;->getCurrVelocity()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
