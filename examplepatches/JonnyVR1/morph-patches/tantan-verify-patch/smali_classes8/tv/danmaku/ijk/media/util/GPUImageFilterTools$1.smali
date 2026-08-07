.class Ltv/danmaku/ijk/media/util/GPUImageFilterTools$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/util/GPUImageFilterTools$OnGpuImageFilterChosenListener;

.field final synthetic b:Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterList;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/GPUImageFilterTools$1;->a:Ltv/danmaku/ijk/media/util/GPUImageFilterTools$OnGpuImageFilterChosenListener;

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/util/GPUImageFilterTools$1;->b:Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterList;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterList;->a(I)Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-interface {p1, p2, p0}, Ltv/danmaku/ijk/media/util/GPUImageFilterTools$OnGpuImageFilterChosenListener;->a(Ll/jt2;Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
