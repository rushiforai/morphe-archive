.class final Le/e/a/PlaybackPresentation;
.super Ljava/lang/Object;
.source "PlaybackPresentation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlaybackPresentation$RankingButton;,
        Le/e/a/PlaybackPresentation$PortraitMode;
    }
.end annotation


# static fields
.field private static final LANDSCAPE_HEIGHT_PER_WIDTH:F = 0.5625f

.field private static final modes:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/PlaybackPresentation$PortraitMode;",
            ">;"
        }
    .end annotation
.end field

.field private static final originalHeights:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final portraitSurfaces:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 21
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackPresentation;->originalHeights:Ljava/util/WeakHashMap;

    .line 22
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackPresentation;->portraitSurfaces:Ljava/util/WeakHashMap;

    .line 23
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static ambientChildIndex(Landroid/view/ViewGroup;Landroid/view/View;)I
    .registers 3

    .line 191
    nop

    :goto_0
    if-eqz p1, :cond_2

    if-eq p1, p0, :cond_2

    .line 192
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 193
    if-ne v0, p0, :cond_0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p0

    return p0

    .line 194
    :cond_0
    instance-of p1, v0, Landroid/view/View;

    if-eqz p1, :cond_1

    check-cast v0, Landroid/view/View;

    move-object p1, v0

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    .line 195
    :goto_1
    goto :goto_0

    .line 196
    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method static ambientHost(Landroid/view/View;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 4

    .line 183
    invoke-static {p0}, Le/e/a/PlaybackPresentation;->normalPortraitMode(Landroid/view/View;)Le/e/a/PlaybackPresentation$PortraitMode;

    move-result-object p0

    .line 184
    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Le/e/a/PlaybackPresentation$PortraitMode;->frame:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    .line 185
    :goto_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    return-object p2

    .line 186
    :cond_1
    check-cast p0, Landroid/view/ViewGroup;

    .line 187
    invoke-static {p0, p1}, Le/e/a/PlaybackPresentation;->ambientChildIndex(Landroid/view/ViewGroup;Landroid/view/View;)I

    move-result p1

    if-gez p1, :cond_2

    goto :goto_1

    :cond_2
    move-object p2, p0

    :goto_1
    return-object p2
.end method

.method static back(Landroid/app/Activity;)Z
    .registers 3

    .line 250
    sget-object v0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackPresentation$PortraitMode;

    .line 251
    if-eqz v0, :cond_1

    iget-boolean v1, v0, Le/e/a/PlaybackPresentation$PortraitMode;->fullscreen:Z

    if-nez v1, :cond_0

    goto :goto_0

    .line 252
    :cond_0
    const v1, 0x1020002

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/PlaybackPresentation;->toggleFullscreen(Landroid/app/Activity;Le/e/a/PlaybackPresentation$PortraitMode;Landroid/view/View;)V

    .line 253
    const/4 p0, 0x1

    return p0

    .line 251
    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private static fit(Landroid/view/View;)V
    .registers 4

    .line 303
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 304
    if-eqz v0, :cond_1

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, v2, :cond_1

    .line 305
    :cond_0
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 306
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 307
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 309
    :cond_1
    return-void
.end method

.method static fitBounds(Landroid/graphics/Rect;IIIIF)V
    .registers 8

    .line 212
    int-to-float v0, p4

    div-float/2addr v0, p5

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 213
    int-to-float v1, p3

    mul-float/2addr v1, p5

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p5

    invoke-static {p4, p5}, Ljava/lang/Math;->min(II)I

    move-result p5

    .line 214
    sub-int/2addr p3, v0

    div-int/lit8 p3, p3, 0x2

    add-int/2addr p1, p3

    .line 215
    sub-int/2addr p4, p5

    div-int/lit8 p4, p4, 0x2

    add-int/2addr p2, p4

    .line 216
    add-int/2addr v0, p1

    add-int/2addr p5, p2

    invoke-virtual {p0, p1, p2, v0, p5}, Landroid/graphics/Rect;->set(IIII)V

    .line 217
    return-void
.end method

.method private static fitComments(Landroid/view/View;)V
    .registers 3

    .line 312
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 313
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_1

    .line 314
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 315
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-nez v1, :cond_0

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eqz v1, :cond_1

    .line 316
    :cond_0
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 317
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 318
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 321
    :cond_1
    invoke-static {p0}, Le/e/a/PlaybackPresentation;->fit(Landroid/view/View;)V

    .line 322
    return-void
.end method

.method static synthetic lambda$shortsHeader$0(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method static synthetic lambda$shortsRanking$1(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/view/View;)V
    .registers 4

    .line 56
    invoke-static {p0, p1, p2}, Le/e/a/ShortsBrowser;->showOrder(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    return-void
.end method

.method static synthetic lambda$update$2(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;)V
    .registers 3

    .line 148
    invoke-static {p0}, Le/e/a/PlaybackPresentation;->modeFor(Landroid/app/Activity;)Le/e/a/PlaybackPresentation$PortraitMode;

    move-result-object p2

    invoke-static {p0, p2, p1}, Le/e/a/PlaybackPresentation;->toggleFullscreen(Landroid/app/Activity;Le/e/a/PlaybackPresentation$PortraitMode;Landroid/view/View;)V

    return-void
.end method

.method static miniRatio(Ljava/lang/Object;)F
    .registers 2

    .line 84
    nop

    .line 85
    instance-of v0, p0, Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_0

    .line 86
    check-cast p0, Le/e/a/MiniSession225$Session;

    iget-object p0, p0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_0

    .line 87
    :cond_0
    instance-of v0, p0, Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_1

    .line 88
    check-cast p0, Le/e/a/DirectBackground235$State;

    iget-object p0, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    .line 89
    if-eqz p0, :cond_1

    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_0

    .line 91
    :cond_1
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Le/e/a/PlaybackPresentation;->ratioOf(Ljava/lang/Object;)F

    move-result p0

    .line 92
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p0, v0

    if-lez v0, :cond_2

    goto :goto_1

    :cond_2
    const/high16 p0, 0x3f100000    # 0.5625f

    :goto_1
    return p0
.end method

.method private static modeFor(Landroid/app/Activity;)Le/e/a/PlaybackPresentation$PortraitMode;
    .registers 2

    .line 163
    sget-object v0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlaybackPresentation$PortraitMode;

    return-object p0
.end method

.method private static normalPortraitMode(Landroid/view/View;)Le/e/a/PlaybackPresentation$PortraitMode;
    .registers 6

    .line 166
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 167
    :goto_0
    instance-of v0, p0, Landroid/app/Activity;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    instance-of v2, p0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_1

    .line 168
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 169
    if-ne v0, p0, :cond_0

    return-object v1

    .line 170
    :cond_0
    nop

    .line 171
    move-object p0, v0

    goto :goto_0

    .line 172
    :cond_1
    if-nez v0, :cond_2

    return-object v1

    .line 173
    :cond_2
    check-cast p0, Landroid/app/Activity;

    .line 174
    sget-object v0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackPresentation$PortraitMode;

    .line 175
    if-nez v0, :cond_3

    move-object v2, v1

    goto :goto_1

    :cond_3
    iget-object v2, v0, Le/e/a/PlaybackPresentation$PortraitMode;->frame:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 176
    :goto_1
    if-eqz v2, :cond_5

    iget v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->ratio:F

    const/high16 v4, 0x3f800000    # 1.0f

    cmpg-float v3, v3, v4

    if-lez v3, :cond_5

    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 177
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_5

    .line 178
    invoke-static {p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_4

    goto :goto_2

    .line 179
    :cond_4
    return-object v0

    .line 178
    :cond_5
    :goto_2
    return-object v1
.end method

.method static normalShort(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V
    .registers 6

    .line 325
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->normalPresentation:Z

    .line 326
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 327
    iget-object v1, p1, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    if-eqz v1, :cond_0

    .line 328
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v2, p1, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 329
    const/4 v1, 0x0

    iput-object v1, p1, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 331
    :cond_0
    iget-object v1, p1, Le/e/a/ModernShorts$State;->bar:Landroid/view/View;

    if-eqz v1, :cond_1

    iget-object p1, p1, Le/e/a/ModernShorts$State;->bar:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 332
    :cond_1
    const-string p1, "tabinfo"

    invoke-static {v0, p1}, Le/e/a/PlaybackPresentation;->show(Landroid/view/View;Ljava/lang/String;)V

    .line 333
    const-string p1, "statuslay"

    invoke-static {v0, p1}, Le/e/a/PlaybackPresentation;->show(Landroid/view/View;Ljava/lang/String;)V

    .line 334
    const-string p1, "videoLayout"

    invoke-static {v0, p1}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    .line 335
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 336
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x41100000    # 9.0f

    mul-float/2addr v2, v3

    const/high16 v3, 0x41800000    # 16.0f

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 337
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 339
    :cond_2
    const-string p1, "controller"

    invoke-static {v0, p1}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    .line 340
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_3

    .line 341
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 342
    const/4 v2, 0x0

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 343
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 345
    :cond_3
    invoke-static {p0}, Le/e/a/PlayerGestures219;->owner(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object p1

    .line 346
    if-eqz p1, :cond_4

    invoke-static {p1, p0, v0}, Le/e/a/PlaybackPresentation;->update(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V

    .line 347
    :cond_4
    return-void
.end method

.method static pictureBounds(Landroid/view/View;Landroid/graphics/Rect;)Z
    .registers 11

    .line 200
    invoke-static {p0}, Le/e/a/PlaybackPresentation;->normalPortraitMode(Landroid/view/View;)Le/e/a/PlaybackPresentation$PortraitMode;

    move-result-object v0

    .line 201
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, v0, Le/e/a/PlaybackPresentation$PortraitMode;->frame:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 202
    :goto_0
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/View;

    if-nez v3, :cond_1

    goto :goto_1

    .line 203
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    .line 204
    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->framePosition:[I

    invoke-virtual {v1, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 205
    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->ambientPosition:[I

    invoke-virtual {p0, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 206
    iget-object p0, v0, Le/e/a/PlaybackPresentation$PortraitMode;->framePosition:[I

    aget p0, p0, v2

    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->ambientPosition:[I

    aget v2, v3, v2

    sub-int v4, p0, v2

    iget-object p0, v0, Le/e/a/PlaybackPresentation$PortraitMode;->framePosition:[I

    const/4 v2, 0x1

    aget p0, p0, v2

    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->ambientPosition:[I

    aget v3, v3, v2

    sub-int v5, p0, v3

    .line 207
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v7

    iget v8, v0, Le/e/a/PlaybackPresentation$PortraitMode;->ratio:F

    .line 206
    move-object v3, p1

    invoke-static/range {v3 .. v8}, Le/e/a/PlaybackPresentation;->fitBounds(Landroid/graphics/Rect;IIIIF)V

    .line 208
    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    .line 202
    :cond_2
    :goto_1
    return v2
.end method

.method private static ratioOf(Ljava/lang/Object;)F
    .registers 3

    .line 367
    instance-of v0, p0, Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 369
    :cond_0
    :try_start_0
    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Le/e/a/Dev139;->player(Landroid/view/View;)Le/e/a/Media3VideoPlayer;

    move-result-object p0

    .line 370
    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->presentationRatio()F

    move-result v1
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v1

    .line 371
    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    .line 372
    :goto_1
    return v1
.end method

.method private static restoreHeight(Landroid/view/View;)V
    .registers 5

    .line 350
    sget-object v0, Le/e/a/PlaybackPresentation;->originalHeights:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 351
    if-eqz v0, :cond_2

    if-nez p0, :cond_0

    goto :goto_0

    .line 352
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 353
    if-eqz v1, :cond_1

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 354
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 355
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 357
    :cond_1
    return-void

    .line 351
    :cond_2
    :goto_0
    return-void
.end method

.method static shortsHeader(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 26
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 27
    const-string v1, "\u2039"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    const/high16 v1, 0x41f00000    # 30.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 29
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 30
    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    const-string v1, "Back"

    const-string/jumbo v2, "\u8fd4\u56de"

    const-string/jumbo v3, "\u623b\u308b"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 32
    new-instance v1, Le/e/a/PlaybackPresentation$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Le/e/a/PlaybackPresentation$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    const/16 v1, 0x30

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    .line 34
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, p0, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    invoke-static {v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 36
    return-void
.end method

.method static shortsRanking(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/view/View;)V
    .registers 7

    .line 50
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    return-void

    .line 51
    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p3

    check-cast p3, Landroid/widget/FrameLayout;

    .line 52
    const-string v0, "Loaded Shorts"

    const-string v1, "\u5df2\u8f09\u5165\u7684\u77ed\u7247"

    const-string v2, "\u53d6\u5f97\u6e08\u307f\u30b7\u30e7\u30fc\u30c8"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    new-instance v1, Le/e/a/PlaybackPresentation$RankingButton;

    invoke-direct {v1, p0}, Le/e/a/PlaybackPresentation$RankingButton;-><init>(Landroid/app/Activity;)V

    .line 54
    invoke-virtual {v1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 55
    invoke-virtual {v1, v0}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    .line 56
    new-instance v0, Le/e/a/PlaybackPresentation$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/PlaybackPresentation$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    const/16 p1, 0x38

    invoke-static {p0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    .line 58
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const p2, 0x800013

    invoke-direct {p1, p0, p0, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p3, v1, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    invoke-static {v1}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 60
    return-void
.end method

.method static shortsSearch(Landroid/widget/EditText;)V
    .registers 6

    .line 39
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0xe

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    .line 40
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 41
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v3

    invoke-static {v3}, Landroid/graphics/Color;->luminance(I)F

    move-result v3

    const/high16 v4, 0x3f000000    # 0.5f

    cmpg-float v3, v3, v4

    if-gez v3, :cond_0

    .line 42
    const v3, 0x22ffffff

    goto :goto_0

    :cond_0
    const/high16 v3, 0x14000000

    .line 41
    :goto_0
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 43
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 44
    invoke-virtual {p0, v2}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 45
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v0, v1}, Landroid/widget/EditText;->setPaddingRelative(IIII)V

    .line 46
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Search Shorts"

    const-string/jumbo v2, "\u641c\u5c0b\u77ed\u5f71\u7247"

    const-string v3, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22"

    invoke-static {v0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 47
    return-void
.end method

.method private static show(Landroid/view/View;Ljava/lang/String;)V
    .registers 2

    .line 360
    invoke-static {p0, p1}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    .line 361
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    .line 362
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 364
    :cond_0
    return-void
.end method

.method private static toggleFullscreen(Landroid/app/Activity;Le/e/a/PlaybackPresentation$PortraitMode;Landroid/view/View;)V
    .registers 11

    .line 220
    if-nez p1, :cond_0

    return-void

    .line 221
    :cond_0
    iget-boolean v0, p1, Le/e/a/PlaybackPresentation$PortraitMode;->fullscreen:Z

    .line 222
    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    .line 223
    const-string v3, "tabinfo"

    invoke-static {p2, v3}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 224
    const-string v4, "info"

    invoke-static {p2, v4}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 225
    const/16 v5, 0x400

    if-eqz v0, :cond_6

    .line 226
    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v6

    iput v6, p1, Le/e/a/PlaybackPresentation$PortraitMode;->systemUi:I

    .line 227
    invoke-virtual {p0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v6

    iput v6, p1, Le/e/a/PlaybackPresentation$PortraitMode;->orientation:I

    .line 228
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v6

    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/2addr v6, v5

    if-eqz v6, :cond_1

    move v6, v1

    goto :goto_0

    :cond_1
    const/4 v6, 0x0

    :goto_0
    iput-boolean v6, p1, Le/e/a/PlaybackPresentation$PortraitMode;->windowFullscreen:Z

    .line 229
    const/16 v6, 0x8

    if-nez v3, :cond_2

    move v7, v6

    goto :goto_1

    :cond_2
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v7

    :goto_1
    iput v7, p1, Le/e/a/PlaybackPresentation$PortraitMode;->tabs:I

    .line 230
    if-nez v4, :cond_3

    move v7, v6

    goto :goto_2

    :cond_3
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v7

    :goto_2
    iput v7, p1, Le/e/a/PlaybackPresentation$PortraitMode;->details:I

    .line 231
    if-eqz v3, :cond_4

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 232
    :cond_4
    if-eqz v4, :cond_5

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 233
    :cond_5
    invoke-virtual {p0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 234
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/Window;->addFlags(I)V

    .line 235
    iget v1, p1, Le/e/a/PlaybackPresentation$PortraitMode;->systemUi:I

    or-int/lit16 v1, v1, 0x1000

    or-int/lit8 v1, v1, 0x2

    or-int/lit8 v1, v1, 0x4

    invoke-virtual {v2, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_3

    .line 238
    :cond_6
    if-eqz v3, :cond_7

    iget v1, p1, Le/e/a/PlaybackPresentation$PortraitMode;->tabs:I

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 239
    :cond_7
    if-eqz v4, :cond_8

    iget v1, p1, Le/e/a/PlaybackPresentation$PortraitMode;->details:I

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 240
    :cond_8
    iget-boolean v1, p1, Le/e/a/PlaybackPresentation$PortraitMode;->windowFullscreen:Z

    if-nez v1, :cond_9

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/Window;->clearFlags(I)V

    .line 241
    :cond_9
    iget v1, p1, Le/e/a/PlaybackPresentation$PortraitMode;->systemUi:I

    invoke-virtual {v2, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 242
    iget v1, p1, Le/e/a/PlaybackPresentation$PortraitMode;->orientation:I

    invoke-virtual {p0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 244
    :goto_3
    iput-boolean v0, p1, Le/e/a/PlaybackPresentation$PortraitMode;->fullscreen:Z

    .line 245
    invoke-static {p0}, Le/e/a/PlayerGestures219;->owner(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object p1

    .line 246
    if-eqz p1, :cond_a

    invoke-static {p1, p0, p2}, Le/e/a/PlaybackPresentation;->update(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V

    .line 247
    :cond_a
    return-void
.end method

.method static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 9

    .line 257
    sget-object v0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackPresentation$PortraitMode;

    .line 258
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, v0, Le/e/a/PlaybackPresentation$PortraitMode;->frame:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 259
    :goto_0
    const/4 v2, 0x0

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v3

    if-eqz v3, :cond_a

    iget-boolean v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->fullscreen:Z

    if-nez v3, :cond_a

    invoke-static {p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto/16 :goto_4

    .line 260
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    const/4 v4, 0x1

    packed-switch v3, :pswitch_data_0

    .line 286
    :pswitch_0
    return v2

    .line 272
    :pswitch_1
    iput-boolean v2, v0, Le/e/a/PlaybackPresentation$PortraitMode;->tracking:Z

    .line 273
    return v2

    .line 275
    :pswitch_2
    iget-boolean v1, v0, Le/e/a/PlaybackPresentation$PortraitMode;->tracking:Z

    if-nez v1, :cond_2

    return v2

    .line 276
    :cond_2
    iput-boolean v2, v0, Le/e/a/PlaybackPresentation$PortraitMode;->tracking:Z

    .line 277
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->startY:F

    sub-float/2addr v1, v3

    .line 278
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/16 v5, 0x48

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    int-to-float v5, v5

    cmpg-float v3, v3, v5

    if-ltz v3, :cond_7

    .line 279
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iget v5, v0, Le/e/a/PlaybackPresentation$PortraitMode;->startX:F

    sub-float/2addr p1, v5

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v5, 0x3fc00000    # 1.5f

    mul-float/2addr p1, v5

    cmpg-float p1, v3, p1

    if-ltz p1, :cond_7

    iget-boolean p1, v0, Le/e/a/PlaybackPresentation$PortraitMode;->compact:Z

    const/4 v3, 0x0

    cmpg-float v1, v1, v3

    if-gez v1, :cond_3

    move v3, v4

    goto :goto_1

    :cond_3
    move v3, v2

    :goto_1
    if-ne p1, v3, :cond_4

    goto :goto_2

    .line 281
    :cond_4
    if-gez v1, :cond_5

    move v2, v4

    :cond_5
    iput-boolean v2, v0, Le/e/a/PlaybackPresentation$PortraitMode;->compact:Z

    .line 282
    invoke-static {p0}, Le/e/a/PlayerGestures219;->owner(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object p1

    .line 283
    if-eqz p1, :cond_6

    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p1, p0, v0}, Le/e/a/PlaybackPresentation;->update(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V

    .line 284
    :cond_6
    return v4

    .line 280
    :cond_7
    :goto_2
    return v2

    .line 262
    :pswitch_3
    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->bounds:Landroid/graphics/Rect;

    if-nez v3, :cond_8

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->bounds:Landroid/graphics/Rect;

    .line 263
    :cond_8
    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v3}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, v0, Le/e/a/PlaybackPresentation$PortraitMode;->bounds:Landroid/graphics/Rect;

    .line 264
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v1, v3, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 265
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->bounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    const/16 v5, 0x38

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    add-int/2addr v3, v6

    int-to-float v3, v3

    cmpl-float v1, v1, v3

    if-lez v1, :cond_9

    .line 266
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget-object v3, v0, Le/e/a/PlaybackPresentation$PortraitMode;->bounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    sub-int/2addr v3, p0

    int-to-float p0, v3

    cmpg-float p0, v1, p0

    if-gez p0, :cond_9

    goto :goto_3

    :cond_9
    move v4, v2

    :goto_3
    iput-boolean v4, v0, Le/e/a/PlaybackPresentation$PortraitMode;->tracking:Z

    .line 267
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p0

    iput p0, v0, Le/e/a/PlaybackPresentation$PortraitMode;->startX:F

    .line 268
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p0

    iput p0, v0, Le/e/a/PlaybackPresentation$PortraitMode;->startY:F

    .line 269
    return v2

    .line 259
    :cond_a
    :goto_4
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static update(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V
    .registers 10

    .line 96
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 97
    :goto_0
    const-string v3, "videoLayout"

    invoke-static {p2, v3}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 98
    if-eqz v0, :cond_12

    invoke-static {p1}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "x0"

    invoke-static {p0, v0}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_5

    .line 103
    :cond_1
    invoke-static {p0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 104
    sget-object p0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    invoke-static {v3}, Le/e/a/PlaybackPresentation;->restoreHeight(Landroid/view/View;)V

    .line 106
    const-string p0, "statuslay"

    invoke-static {p2, p0}, Le/e/a/PlaybackPresentation;->show(Landroid/view/View;Ljava/lang/String;)V

    .line 107
    const-string p0, "viewctrllay"

    invoke-static {p2, p0}, Le/e/a/PlaybackPresentation;->show(Landroid/view/View;Ljava/lang/String;)V

    .line 108
    const-string p0, "viewbutton"

    invoke-static {p2, p0}, Le/e/a/PlaybackPresentation;->show(Landroid/view/View;Ljava/lang/String;)V

    .line 109
    const-string p0, "controller"

    invoke-static {p2, p0}, Le/e/a/PlaybackPresentation;->show(Landroid/view/View;Ljava/lang/String;)V

    .line 110
    return-void

    .line 112
    :cond_2
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackPresentation;->ratioOf(Ljava/lang/Object;)F

    move-result p0

    .line 113
    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p0, v0

    if-gtz v0, :cond_4

    .line 114
    const/4 p2, 0x0

    cmpl-float p0, p0, p2

    if-lez p0, :cond_3

    .line 115
    sget-object p0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    invoke-static {v3}, Le/e/a/PlaybackPresentation;->restoreHeight(Landroid/view/View;)V

    .line 118
    :cond_3
    return-void

    .line 120
    :cond_4
    if-eqz v3, :cond_11

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-nez v0, :cond_5

    goto/16 :goto_4

    .line 121
    :cond_5
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 122
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    .line 123
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 124
    if-lez v4, :cond_10

    if-gtz v0, :cond_6

    goto/16 :goto_3

    .line 125
    :cond_6
    sget-object v5, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {v5, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/PlaybackPresentation$PortraitMode;

    .line 126
    if-eqz v5, :cond_7

    iget-object v6, v5, Le/e/a/PlaybackPresentation$PortraitMode;->frame:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v3, :cond_8

    .line 127
    :cond_7
    new-instance v5, Le/e/a/PlaybackPresentation$PortraitMode;

    invoke-direct {v5, v3}, Le/e/a/PlaybackPresentation$PortraitMode;-><init>(Landroid/view/View;)V

    .line 128
    sget-object v6, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {v6, p1, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :cond_8
    iput p0, v5, Le/e/a/PlaybackPresentation$PortraitMode;->ratio:F

    .line 131
    iget-boolean v6, v5, Le/e/a/PlaybackPresentation$PortraitMode;->fullscreen:Z

    if-eqz v6, :cond_9

    goto :goto_1

    :cond_9
    iget-boolean v6, v5, Le/e/a/PlaybackPresentation$PortraitMode;->compact:Z

    if-eqz v6, :cond_a

    .line 132
    int-to-float p0, v4

    const/high16 v0, 0x3f100000    # 0.5625f

    mul-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result v0

    goto :goto_1

    .line 133
    :cond_a
    int-to-float v4, v4

    mul-float/2addr v4, p0

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result p0

    int-to-float v0, v0

    const v4, 0x3f333333    # 0.7f

    mul-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 134
    :goto_1
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 135
    if-eqz p0, :cond_c

    if-lez v0, :cond_c

    iget v4, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, v0, :cond_c

    .line 136
    sget-object v4, Le/e/a/PlaybackPresentation;->originalHeights:Ljava/util/WeakHashMap;

    invoke-virtual {v4, v3}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_b

    sget-object v4, Le/e/a/PlaybackPresentation;->originalHeights:Ljava/util/WeakHashMap;

    iget v6, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v3, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    :cond_b
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 138
    invoke-virtual {v3, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    :cond_c
    const-string p0, "commentlay"

    invoke-static {v3, p0}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    .line 141
    if-eqz p0, :cond_d

    .line 142
    invoke-static {p0}, Le/e/a/PlaybackPresentation;->fitComments(Landroid/view/View;)V

    .line 143
    invoke-static {p0}, Le/e/a/CommentVisuals;->fullViewport(Landroid/view/View;)V

    .line 145
    :cond_d
    const-string p0, "fullscbutton"

    invoke-static {p2, p0}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    .line 146
    if-eqz p0, :cond_e

    iget-object v0, v5, Le/e/a/PlaybackPresentation$PortraitMode;->button:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_e

    .line 147
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, v5, Le/e/a/PlaybackPresentation$PortraitMode;->button:Ljava/lang/ref/WeakReference;

    .line 148
    new-instance v0, Le/e/a/PlaybackPresentation$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1, p2}, Le/e/a/PlaybackPresentation$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    :cond_e
    const-string p0, "video_view"

    invoke-static {v3, p0}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    .line 151
    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/View;

    if-eqz p1, :cond_f

    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Le/e/a/PlaybackPresentation;->fit(Landroid/view/View;)V

    .line 153
    invoke-static {p0}, Le/e/a/PlaybackPresentation;->fit(Landroid/view/View;)V

    .line 154
    sget-object p1, Le/e/a/PlaybackPresentation;->portraitSurfaces:Ljava/util/WeakHashMap;

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_f

    .line 156
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string p2, "setMeasureBasedOnAspectRatioEnabled"

    new-array v0, v2, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v1

    invoke-virtual {p1, p2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array p2, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, p2, v1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    goto :goto_2

    .line 157
    :catch_0
    move-exception p0

    .line 161
    :cond_f
    :goto_2
    return-void

    .line 124
    :cond_10
    :goto_3
    return-void

    .line 120
    :cond_11
    :goto_4
    return-void

    .line 99
    :cond_12
    :goto_5
    sget-object p0, Le/e/a/PlaybackPresentation;->modes:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object p0, Le/e/a/PlaybackPresentation;->originalHeights:Ljava/util/WeakHashMap;

    invoke-virtual {p0, v3}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    return-void
.end method
