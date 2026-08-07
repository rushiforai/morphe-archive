.class public Ll/so0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/cp0;


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

.method public static a(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)Ll/so0;
    .locals 2

    .line 1
    new-instance v0, Ll/so0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/so0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getFps()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iput v1, v0, Ll/so0;->a:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getFrames()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, v0, Ll/so0;->b:I

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getImageMap()Ljava/util/HashMap;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Ll/so0;->c:Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getVideoSize()Landroid/graphics/Rect;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/cp0;->a(Landroid/graphics/Rect;)Ll/cp0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Ll/so0;->d:Ll/cp0;

    .line 33
    .line 34
    return-object v0
.end method


# virtual methods
.method public b()Ll/cp0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/so0;->d:Ll/cp0;

    .line 2
    .line 3
    return-object p0
.end method
