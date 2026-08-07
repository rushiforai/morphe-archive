.class public abstract Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:Landroid/graphics/drawable/Drawable;

.field public c:Landroid/graphics/drawable/Drawable;

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/graphics/Paint;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/res/TypedArray;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x32

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 7
    .line 8
    sget v0, Ll/vhc0;->P:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    sget v0, Ll/vhc0;->K:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->b:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    sget v0, Ll/vhc0;->L:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c:Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    sget v0, Ll/vhc0;->S:I

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->d:I

    .line 40
    .line 41
    sget v0, Ll/vhc0;->R:I

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->e:I

    .line 48
    .line 49
    new-instance p1, Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 61
    .line 62
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->e:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 68
    .line 69
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->d:I

    .line 70
    .line 71
    int-to-float p0, p0

    .line 72
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;Landroid/graphics/Canvas;IIII)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->b(Landroid/graphics/Canvas;IIII)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/graphics/Canvas;IIII)V
    .locals 1

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->e(Landroid/graphics/Canvas;IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f(Landroid/graphics/Canvas;IIII)V

    .line 5
    .line 6
    .line 7
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g(Landroid/graphics/Canvas;IIII)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->h:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->h(Landroid/graphics/Canvas;IIII)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public abstract c()I
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract e(Landroid/graphics/Canvas;IIII)V
.end method

.method public abstract f(Landroid/graphics/Canvas;IIII)V
.end method

.method public abstract g(Landroid/graphics/Canvas;IIII)V
.end method

.method public abstract h(Landroid/graphics/Canvas;IIII)V
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public abstract j(FI)V
.end method

.method public k(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 2
    .line 3
    return-void
.end method
