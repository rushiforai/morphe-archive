.class public final Lorg/apmem/tools/layouts/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apmem/tools/layouts/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static FlowLayout:[I = null

.field public static FlowLayout_LayoutParams:[I = null

.field public static FlowLayout_LayoutParams_android_layout_gravity:I = 0x0

.field public static FlowLayout_LayoutParams_layout_newLine:I = 0x1

.field public static FlowLayout_LayoutParams_layout_weight:I = 0x2

.field public static FlowLayout_android_gravity:I = 0x0

.field public static FlowLayout_android_orientation:I = 0x1

.field public static FlowLayout_debugDraw:I = 0x2

.field public static FlowLayout_itemSpacing:I = 0x3

.field public static FlowLayout_layoutDirection:I = 0x4

.field public static FlowLayout_lineSpacing:I = 0x5

.field public static FlowLayout_weightDefault:I = 0x6


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout:[I

    const v0, 0x7f0403a2

    const v1, 0x7f0403ab

    const v2, 0x10100b3

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lorg/apmem/tools/layouts/R$styleable;->FlowLayout_LayoutParams:[I

    return-void

    :array_0
    .array-data 4
        0x10100af
        0x10100c4
        0x7f0401de
        0x7f04033d
        0x7f040363
        0x7f0403c3
        0x7f04073b
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
