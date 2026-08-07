.class Lio/agora/base/internal/video/EglRenderer$11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/EglRenderer;->clearImage(FFFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/EglRenderer;

.field final synthetic val$a:F

.field final synthetic val$b:F

.field final synthetic val$g:F

.field final synthetic val$r:F


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglRenderer;FFFF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$11;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    iput p2, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$r:F

    .line 4
    .line 5
    iput p3, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$g:F

    .line 6
    .line 7
    iput p4, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$b:F

    .line 8
    .line 9
    iput p5, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$a:F

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$11;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    iget v1, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$r:F

    .line 4
    .line 5
    iget v2, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$g:F

    .line 6
    .line 7
    iget v3, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$b:F

    .line 8
    .line 9
    iget p0, p0, Lio/agora/base/internal/video/EglRenderer$11;->val$a:F

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lio/agora/base/internal/video/EglRenderer;->access$2200(Lio/agora/base/internal/video/EglRenderer;FFFF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
