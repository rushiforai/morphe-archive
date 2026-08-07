.class public Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->N(Lcom/p1/mobile/putong/data/Picture;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;->b:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;->a:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;->b:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 6
    .line 7
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;->a:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->z(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;->b:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->w(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)I

    .line 16
    .line 17
    .line 18
    move-result v8

    .line 19
    move-object v3, p1

    .line 20
    move-object v4, p2

    .line 21
    move-object v5, p3

    .line 22
    invoke-static/range {v1 .. v8}, Ll/fsb0;->o0(Lv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
