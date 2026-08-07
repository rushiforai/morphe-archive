.class public final synthetic Ll/kkt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kkt;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;

    iput-boolean p2, p0, Ll/kkt;->b:Z

    iput-boolean p3, p0, Ll/kkt;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kkt;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;

    iget-boolean v1, p0, Ll/kkt;->b:Z

    iget-boolean p0, p0, Ll/kkt;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->a(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;ZZ)V

    return-void
.end method
