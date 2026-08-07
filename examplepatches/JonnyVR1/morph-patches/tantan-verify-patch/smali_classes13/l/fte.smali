.class public final synthetic Ll/fte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/EglRenderer;

.field public final synthetic b:Lcom/momo/rtcbase/EglBase$Context;

.field public final synthetic c:[I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/EglBase$Context;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fte;->a:Lcom/momo/rtcbase/EglRenderer;

    iput-object p2, p0, Ll/fte;->b:Lcom/momo/rtcbase/EglBase$Context;

    iput-object p3, p0, Ll/fte;->c:[I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fte;->a:Lcom/momo/rtcbase/EglRenderer;

    iget-object v1, p0, Ll/fte;->b:Lcom/momo/rtcbase/EglBase$Context;

    iget-object p0, p0, Ll/fte;->c:[I

    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/EglRenderer;->a(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/EglBase$Context;[I)V

    return-void
.end method
