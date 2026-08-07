.class public final synthetic Lcom/momo/xengine/mestatistics/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xengine/mestatistics/StatisticalEvent;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xengine/mestatistics/a;->a:Lcom/momo/xengine/mestatistics/StatisticalEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/a;->a:Lcom/momo/xengine/mestatistics/StatisticalEvent;

    invoke-static {p0}, Lcom/momo/xengine/mestatistics/Server;->a(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V

    return-void
.end method
