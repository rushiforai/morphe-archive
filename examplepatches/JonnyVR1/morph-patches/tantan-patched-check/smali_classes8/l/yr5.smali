.class public final synthetic Ll/yr5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yr5;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/yr5;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/yr5;->c:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yr5;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/yr5;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/yr5;->c:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0, p1}, Ll/zr5;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V

    return-void
.end method
