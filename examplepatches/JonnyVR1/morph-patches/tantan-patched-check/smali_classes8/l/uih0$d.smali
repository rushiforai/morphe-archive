.class public Ll/uih0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uih0;->i0(Lcom/p1/mobile/putong/core/newui/home/b;Ll/u7m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Ll/u7m;

.field public final synthetic c:Ll/uih0;


# direct methods
.method public constructor <init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/b;Ll/u7m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/uih0$d;->c:Ll/uih0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/uih0$d;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    iput-object p3, p0, Ll/uih0$d;->b:Ll/u7m;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uih0$d;->c:Ll/uih0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/uih0$d;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    iget-object v2, p0, Ll/uih0$d;->b:Ll/u7m;

    .line 6
    .line 7
    move-object v3, v2

    .line 8
    check-cast v3, Landroid/view/View;

    .line 9
    .line 10
    invoke-interface {v2}, Ll/q7m;->t()Landroid/view/ViewStub;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object p0, p0, Ll/uih0$d;->b:Ll/u7m;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/q7m;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, v1, v3, v2, p0}, Ll/uih0;->Z0(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
