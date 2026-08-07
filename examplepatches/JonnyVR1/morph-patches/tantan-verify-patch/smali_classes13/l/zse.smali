.class public final synthetic Ll/zse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/EglRenderer;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/EglRenderer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zse;->a:Lcom/momo/rtcbase/EglRenderer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zse;->a:Lcom/momo/rtcbase/EglRenderer;

    invoke-static {p0}, Lcom/momo/rtcbase/EglRenderer;->c(Lcom/momo/rtcbase/EglRenderer;)V

    return-void
.end method
