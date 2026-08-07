.class public final synthetic Ll/dih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ll/y20;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dih0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/dih0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/dih0;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-object p4, p0, Ll/dih0;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/dih0;->e:Ll/y20;

    iput-object p6, p0, Ll/dih0;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dih0;->a:Landroid/view/View;

    iget-object v1, p0, Ll/dih0;->b:Landroid/view/View;

    iget-object v2, p0, Ll/dih0;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-object v3, p0, Ll/dih0;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/dih0;->e:Ll/y20;

    iget-object v5, p0, Ll/dih0;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Ll/uih0;->w(Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method
