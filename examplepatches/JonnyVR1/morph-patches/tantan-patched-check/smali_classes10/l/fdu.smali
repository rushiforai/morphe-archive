.class public final synthetic Ll/fdu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fdu;->a:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    iput-object p2, p0, Ll/fdu;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fdu;->a:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    iget-object p0, p0, Ll/fdu;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->y(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;Ljava/lang/Runnable;)V

    return-void
.end method
