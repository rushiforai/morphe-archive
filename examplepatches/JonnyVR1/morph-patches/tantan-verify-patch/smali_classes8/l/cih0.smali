.class public final synthetic Ll/cih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic e:Ll/y20;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cih0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/cih0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/cih0;->c:Landroid/view/View;

    iput-object p4, p0, Ll/cih0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-object p5, p0, Ll/cih0;->e:Ll/y20;

    iput-object p6, p0, Ll/cih0;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cih0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/cih0;->b:Landroid/view/View;

    iget-object v2, p0, Ll/cih0;->c:Landroid/view/View;

    iget-object v3, p0, Ll/cih0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-object v4, p0, Ll/cih0;->e:Ll/y20;

    iget-object v5, p0, Ll/cih0;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Ll/uih0;->v(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    return-void
.end method
