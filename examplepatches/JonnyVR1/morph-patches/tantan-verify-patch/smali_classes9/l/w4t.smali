.class public final synthetic Ll/w4t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w4t;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w4t;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->u(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
