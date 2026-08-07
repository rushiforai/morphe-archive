.class public final synthetic Ll/qwc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/CityCData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/CityCData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qwc;->a:Lcom/p1/mobile/putong/core/data/CityCData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qwc;->a:Lcom/p1/mobile/putong/core/data/CityCData;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->S1(Lcom/p1/mobile/putong/core/data/CityCData;)V

    return-void
.end method
