.class public final synthetic Ll/hm2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/app/PutongFrag;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hm2;->a:Lcom/p1/mobile/putong/app/PutongFrag;

    iput-boolean p2, p0, Ll/hm2;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hm2;->a:Lcom/p1/mobile/putong/app/PutongFrag;

    iget-boolean p0, p0, Ll/hm2;->b:Z

    check-cast p1, Landroid/os/Bundle;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->M4(Lcom/p1/mobile/putong/app/PutongFrag;ZLandroid/os/Bundle;)V

    return-void
.end method
