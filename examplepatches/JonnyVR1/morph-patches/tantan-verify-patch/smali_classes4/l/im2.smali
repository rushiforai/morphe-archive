.class public final synthetic Ll/im2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongFrag;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/app/PutongFrag;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/im2;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;

    iput-object p2, p0, Ll/im2;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    iput-boolean p3, p0, Ll/im2;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im2;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;

    iget-object v1, p0, Ll/im2;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    iget-boolean p0, p0, Ll/im2;->c:Z

    check-cast p1, Landroid/os/Bundle;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->O4(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/app/PutongFrag;ZLandroid/os/Bundle;)V

    return-void
.end method
