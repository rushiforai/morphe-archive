.class public final synthetic Ll/xqx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yqx;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ll/yqx;IILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xqx;->a:Ll/yqx;

    iput p2, p0, Ll/xqx;->b:I

    iput p3, p0, Ll/xqx;->c:I

    iput-object p4, p0, Ll/xqx;->d:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xqx;->a:Ll/yqx;

    iget v1, p0, Ll/xqx;->b:I

    iget v2, p0, Ll/xqx;->c:I

    iget-object p0, p0, Ll/xqx;->d:Landroid/os/Bundle;

    invoke-static {v0, v1, v2, p0}, Ll/yqx;->a(Ll/yqx;IILandroid/os/Bundle;)V

    return-void
.end method
