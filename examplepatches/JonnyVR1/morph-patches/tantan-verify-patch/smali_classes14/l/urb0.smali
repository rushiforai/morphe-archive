.class public final synthetic Ll/urb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fsb0;

.field public final synthetic b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public final synthetic c:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public final synthetic d:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ll/fsb0;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/urb0;->a:Ll/fsb0;

    iput-object p2, p0, Ll/urb0;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    iput-object p3, p0, Ll/urb0;->c:Lv/fresco/photodraweeview/PhotoDraweeView;

    iput-object p4, p0, Ll/urb0;->d:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/urb0;->a:Ll/fsb0;

    iget-object v1, p0, Ll/urb0;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    iget-object v2, p0, Ll/urb0;->c:Lv/fresco/photodraweeview/PhotoDraweeView;

    iget-object p0, p0, Ll/urb0;->d:Ljava/io/File;

    invoke-static {v0, v1, v2, p0}, Ll/fsb0;->r(Ll/fsb0;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V

    return-void
.end method
