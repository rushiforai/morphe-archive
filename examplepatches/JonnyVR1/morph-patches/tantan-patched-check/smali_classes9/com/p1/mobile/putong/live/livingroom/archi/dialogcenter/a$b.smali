.class public Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jwl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ll/f5t;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->I(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Landroid/content/DialogInterface$OnDismissListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->M(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/content/DialogInterface$OnDismissListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->H(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Landroid/content/DialogInterface$OnShowListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->J(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Landroid/content/DialogInterface$OnShowListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->N(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/content/DialogInterface$OnShowListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public dismiss()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getType()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->G(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
