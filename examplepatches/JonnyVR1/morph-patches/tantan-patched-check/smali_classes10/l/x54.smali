.class public final synthetic Ll/x54;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z54;


# direct methods
.method public synthetic constructor <init>(Ll/z54;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x54;->a:Ll/z54;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x54;->a:Ll/z54;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;

    invoke-static {p0, p1}, Ll/z54;->K3(Ll/z54;Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;)V

    return-void
.end method
