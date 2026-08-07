.class public final synthetic Ll/bel0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/VideoFileRenderer;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/VideoFileRenderer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bel0;->a:Lcom/momo/rtcbase/VideoFileRenderer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bel0;->a:Lcom/momo/rtcbase/VideoFileRenderer;

    invoke-static {p0}, Lcom/momo/rtcbase/VideoFileRenderer;->a(Lcom/momo/rtcbase/VideoFileRenderer;)V

    return-void
.end method
