.class public final synthetic Ll/i9m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i9m;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;

    iput p2, p0, Ll/i9m;->b:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i9m;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;

    iget p0, p0, Ll/i9m;->b:F

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;->f(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;F)V

    return-void
.end method
