.class public final synthetic Ll/fl3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Settings;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Settings;

.field public final synthetic c:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Settings;Lcom/p1/mobile/putong/data/Settings;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fl3;->a:Lcom/p1/mobile/putong/data/Settings;

    iput-object p2, p0, Ll/fl3;->b:Lcom/p1/mobile/putong/data/Settings;

    iput-object p3, p0, Ll/fl3;->c:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fl3;->a:Lcom/p1/mobile/putong/data/Settings;

    iget-object v1, p0, Ll/fl3;->b:Lcom/p1/mobile/putong/data/Settings;

    iget-object p0, p0, Ll/fl3;->c:Ll/l4g0;

    invoke-static {v0, v1, p0, p1}, Ll/hl3;->C(Lcom/p1/mobile/putong/data/Settings;Lcom/p1/mobile/putong/data/Settings;Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
