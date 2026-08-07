.class public final synthetic Ll/rr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/as20;

.field public final synthetic b:Ll/pf60;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rr20;->a:Ll/as20;

    iput-object p2, p0, Ll/rr20;->b:Ll/pf60;

    iput-object p3, p0, Ll/rr20;->c:Lcom/p1/mobile/putong/data/Media;

    iput-object p4, p0, Ll/rr20;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-object p5, p0, Ll/rr20;->e:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rr20;->a:Ll/as20;

    iget-object v1, p0, Ll/rr20;->b:Ll/pf60;

    iget-object v2, p0, Ll/rr20;->c:Lcom/p1/mobile/putong/data/Media;

    iget-object v3, p0, Ll/rr20;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-object p0, p0, Ll/rr20;->e:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, v2, v3, p0}, Ll/as20;->k(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
