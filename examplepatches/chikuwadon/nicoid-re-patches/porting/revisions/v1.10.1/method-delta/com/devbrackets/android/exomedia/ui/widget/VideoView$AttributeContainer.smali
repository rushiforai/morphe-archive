.class public Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/devbrackets/android/exomedia/ui/widget/VideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AttributeContainer"
.end annotation


# instance fields
.field public apiImplLegacyResourceId:I

.field public apiImplResourceId:I

.field public measureBasedOnAspectRatio:Ljava/lang/Boolean;

.field public scaleType:Lcom/devbrackets/android/exomedia/core/video/scale/ScaleType;

.field public final synthetic this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

.field public useDefaultControls:Z

.field public useTextureViewBacking:Z


# direct methods
.method public constructor <init>(Lcom/devbrackets/android/exomedia/ui/widget/VideoView;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    iput-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useDefaultControls:Z

    iput-boolean p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useTextureViewBacking:Z

    invoke-static {p2, p1}, Le/e/a/MiniSession225;->textureBacking(Landroid/content/Context;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useTextureViewBacking:Z

    const/4 p1, 0x0

    sget v0, Lcom/devbrackets/android/exomedia/R$layout;->exomedia_default_exo_texture_video_view:I

    iput v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplResourceId:I

    sget v0, Lcom/devbrackets/android/exomedia/R$layout;->exomedia_default_native_texture_video_view:I

    iput v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplLegacyResourceId:I

    if-nez p3, :cond_1c

    return-void

    :cond_1c
    sget-object v0, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView:[I

    invoke-virtual {p2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    if-nez p2, :cond_25

    return-void

    :cond_25
    sget p3, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_useDefaultControls:I

    iget-boolean v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useDefaultControls:Z

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useDefaultControls:Z

    sget p3, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_useTextureViewBacking:I

    iget-boolean v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useTextureViewBacking:Z

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useTextureViewBacking:Z

    sget p3, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_videoScale:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_4e

    sget p3, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_videoScale:I

    const/4 v0, -0x1

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    invoke-static {p3}, Lcom/devbrackets/android/exomedia/core/video/scale/ScaleType;->fromOrdinal(I)Lcom/devbrackets/android/exomedia/core/video/scale/ScaleType;

    move-result-object p3

    iput-object p3, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->scaleType:Lcom/devbrackets/android/exomedia/core/video/scale/ScaleType;

    :cond_4e
    sget p3, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_measureBasedOnAspectRatio:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_62

    sget p3, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_measureBasedOnAspectRatio:I

    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->measureBasedOnAspectRatio:Ljava/lang/Boolean;

    :cond_62
    iget-boolean p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useTextureViewBacking:Z

    if-eqz p1, :cond_69

    sget p1, Lcom/devbrackets/android/exomedia/R$layout;->exomedia_default_exo_texture_video_view:I

    goto :goto_6b

    :cond_69
    sget p1, Lcom/devbrackets/android/exomedia/R$layout;->exomedia_default_exo_surface_video_view:I

    :goto_6b
    iput p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplResourceId:I

    iget-boolean p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->useTextureViewBacking:Z

    if-eqz p1, :cond_74

    sget p1, Lcom/devbrackets/android/exomedia/R$layout;->exomedia_default_native_texture_video_view:I

    goto :goto_76

    :cond_74
    sget p1, Lcom/devbrackets/android/exomedia/R$layout;->exomedia_default_native_surface_video_view:I

    :goto_76
    iput p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplLegacyResourceId:I

    sget p1, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_videoViewApiImpl:I

    iget p3, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplResourceId:I

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplResourceId:I

    sget p1, Lcom/devbrackets/android/exomedia/R$styleable;->VideoView_videoViewApiImplLegacy:I

    iget p3, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplLegacyResourceId:I

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    iput p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView$AttributeContainer;->apiImplLegacyResourceId:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method
