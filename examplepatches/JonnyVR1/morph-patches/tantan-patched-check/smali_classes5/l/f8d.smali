.class public final synthetic Ll/f8d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/GreetingSummary;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/GreetingSummary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f8d;->a:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f8d;->a:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->z7(Lcom/p1/mobile/putong/core/data/GreetingSummary;)V

    return-void
.end method
