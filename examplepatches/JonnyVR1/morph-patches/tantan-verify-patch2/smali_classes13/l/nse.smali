.class public final synthetic Ll/nse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/EglRenderer;

.field public final synthetic b:Landroid/os/Looper;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/EglRenderer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nse;->a:Lcom/momo/rtcbase/EglRenderer;

    iput-object p2, p0, Ll/nse;->b:Landroid/os/Looper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nse;->a:Lcom/momo/rtcbase/EglRenderer;

    iget-object p0, p0, Ll/nse;->b:Landroid/os/Looper;

    invoke-static {v0, p0}, Lcom/momo/rtcbase/EglRenderer;->h(Lcom/momo/rtcbase/EglRenderer;Landroid/os/Looper;)V

    return-void
.end method
