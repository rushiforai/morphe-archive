.class public final synthetic Ll/qx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GreetingSummary;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GreetingSummary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qx8;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/qx8;->b:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qx8;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/qx8;->b:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/j;->j4(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GreetingSummary;)V

    return-void
.end method
