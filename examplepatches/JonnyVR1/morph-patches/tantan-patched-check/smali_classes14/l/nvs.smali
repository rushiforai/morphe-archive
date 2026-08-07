.class public final synthetic Ll/nvs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bws;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ll/bws;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nvs;->a:Ll/bws;

    iput-object p2, p0, Ll/nvs;->b:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nvs;->a:Ll/bws;

    iget-object p0, p0, Ll/nvs;->b:Landroid/os/Bundle;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    invoke-static {v0, p0, p1}, Ll/bws;->U2(Ll/bws;Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method
