.class public final synthetic Ll/mgh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mgh0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/mgh0;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iput-object p3, p0, Ll/mgh0;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-object p4, p0, Ll/mgh0;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mgh0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/mgh0;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iget-object v2, p0, Ll/mgh0;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-object p0, p0, Ll/mgh0;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v0, v1, v2, p0}, Ll/uih0;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method
