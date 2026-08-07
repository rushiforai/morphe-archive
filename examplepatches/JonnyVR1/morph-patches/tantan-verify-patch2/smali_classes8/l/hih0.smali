.class public final synthetic Ll/hih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hih0;->a:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-object p2, p0, Ll/hih0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/hih0;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hih0;->a:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-object v1, p0, Ll/hih0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/hih0;->c:Ll/y20;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, v1, p0, p1}, Ll/uih0;->K(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/util/Pair;)V

    return-void
.end method
