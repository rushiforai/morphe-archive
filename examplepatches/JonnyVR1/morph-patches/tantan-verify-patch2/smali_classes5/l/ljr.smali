.class public final synthetic Ll/ljr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pf60;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public synthetic constructor <init>(Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ljr;->a:Ll/pf60;

    iput-object p2, p0, Ll/ljr;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ljr;->a:Ll/pf60;

    iget-object p0, p0, Ll/ljr;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    invoke-static {v0, p0}, Ll/ojr;->j(Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method
