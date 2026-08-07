.class public final synthetic Ll/nel0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/ui/VideoFrameRender;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nel0;->a:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    iput p2, p0, Ll/nel0;->b:I

    iput p3, p0, Ll/nel0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nel0;->a:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    iget v1, p0, Ll/nel0;->b:I

    iget p0, p0, Ll/nel0;->c:I

    invoke-static {v0, v1, p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->e(Lcom/ss/bytertc/engine/ui/VideoFrameRender;II)V

    return-void
.end method
