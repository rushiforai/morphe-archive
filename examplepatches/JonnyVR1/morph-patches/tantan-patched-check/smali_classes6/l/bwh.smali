.class public final synthetic Ll/bwh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ll/l4g0;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/y20;Ll/l4g0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bwh;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    iput-object p2, p0, Ll/bwh;->b:Ll/y20;

    iput-object p3, p0, Ll/bwh;->c:Ll/l4g0;

    iput-object p4, p0, Ll/bwh;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bwh;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    iget-object v1, p0, Ll/bwh;->b:Ll/y20;

    iget-object v2, p0, Ll/bwh;->c:Ll/l4g0;

    iget-object p0, p0, Ll/bwh;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->r(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/y20;Ll/l4g0;Ljava/lang/String;Landroid/content/DialogInterface;)V

    return-void
.end method
