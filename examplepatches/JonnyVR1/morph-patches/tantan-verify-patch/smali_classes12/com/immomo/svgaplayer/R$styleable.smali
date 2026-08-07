.class public final Lcom/immomo/svgaplayer/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static SVGAImageView:[I = null

.field public static SVGAImageView_addCache:I = 0x0

.field public static SVGAImageView_antiAlias:I = 0x1

.field public static SVGAImageView_autoPlay:I = 0x2

.field public static SVGAImageView_clearsAfterStop:I = 0x3

.field public static SVGAImageView_endFrame:I = 0x4

.field public static SVGAImageView_fillMode:I = 0x5

.field public static SVGAImageView_loopCount:I = 0x6

.field public static SVGAImageView_source:I = 0x7

.field public static SVGAImageView_startFrame:I = 0x8


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView:[I

    return-void

    :array_0
    .array-data 4
        0x7f040042
        0x7f040056
        0x7f04005e
        0x7f04012a
        0x7f04023c
        0x7f040293
        0x7f0403fb
        0x7f04060d
        0x7f040653
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
