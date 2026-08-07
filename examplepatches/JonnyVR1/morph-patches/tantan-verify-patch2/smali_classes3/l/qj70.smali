.class public final synthetic Ll/qj70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public final synthetic b:I

.field public final synthetic c:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public final synthetic d:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;ILv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qj70;->a:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    iput p2, p0, Ll/qj70;->b:I

    iput-object p3, p0, Ll/qj70;->c:Lv/fresco/photodraweeview/PhotoDraweeView;

    iput-object p4, p0, Ll/qj70;->d:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qj70;->a:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    iget v1, p0, Ll/qj70;->b:I

    iget-object v2, p0, Ll/qj70;->c:Lv/fresco/photodraweeview/PhotoDraweeView;

    iget-object p0, p0, Ll/qj70;->d:Ljava/io/File;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->u(Lv/fresco/subscaleview/SubsamplingScaleImageView;ILv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V

    return-void
.end method
