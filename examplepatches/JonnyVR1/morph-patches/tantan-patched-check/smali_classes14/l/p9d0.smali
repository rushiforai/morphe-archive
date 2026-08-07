.class public final synthetic Ll/p9d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p9d0;->a:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9d0;->a:Landroid/os/Bundle;

    check-cast p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    invoke-static {p0, p1}, Ll/v9d0;->f(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Ll/thk0;

    move-result-object p0

    return-object p0
.end method
