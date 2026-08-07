.class public final synthetic Ll/hm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hm0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;

    iput-boolean p2, p0, Ll/hm0;->b:Z

    iput-boolean p3, p0, Ll/hm0;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hm0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;

    iget-boolean v1, p0, Ll/hm0;->b:Z

    iget-boolean p0, p0, Ll/hm0;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->l0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;ZZ)V

    return-void
.end method
