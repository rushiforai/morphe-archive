.class public final synthetic Ll/pv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/GreetingSummary;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GreetingSummary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/pv8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pv8;->c:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/pv8;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/pv8;->c:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/j;->h4(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GreetingSummary;)V

    return-void
.end method
