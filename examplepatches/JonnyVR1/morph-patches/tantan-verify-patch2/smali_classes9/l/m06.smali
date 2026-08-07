.class public final synthetic Ll/m06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m06;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m06;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/consumealert/ConsumeAlertDialog;->i0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V

    return-void
.end method
