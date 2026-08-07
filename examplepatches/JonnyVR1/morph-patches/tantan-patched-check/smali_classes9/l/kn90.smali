.class public final synthetic Ll/kn90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pn90;

.field public final synthetic b:Ll/pf60;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public synthetic constructor <init>(Ll/pn90;Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kn90;->a:Ll/pn90;

    iput-object p2, p0, Ll/kn90;->b:Ll/pf60;

    iput-object p3, p0, Ll/kn90;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kn90;->a:Ll/pn90;

    iget-object v1, p0, Ll/kn90;->b:Ll/pf60;

    iget-object p0, p0, Ll/kn90;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    invoke-static {v0, v1, p0}, Ll/pn90;->o(Ll/pn90;Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method
