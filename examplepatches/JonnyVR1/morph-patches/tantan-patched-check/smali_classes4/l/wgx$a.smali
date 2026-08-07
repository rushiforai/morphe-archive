.class public Ll/wgx$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wgx;->E(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/wgx;


# direct methods
.method public constructor <init>(Ll/wgx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wgx$a;->a:Ll/wgx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wgx$a;->a:Ll/wgx;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wgx;->i(Ll/wgx;)Ll/l4g0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/wgx$a;->a:Ll/wgx;

    .line 11
    .line 12
    invoke-static {v0}, Ll/wgx;->i(Ll/wgx;)Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/wgx$a;->a:Ll/wgx;

    .line 20
    .line 21
    invoke-static {p0}, Ll/wgx;->i(Ll/wgx;)Ll/l4g0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
