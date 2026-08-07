.class public final synthetic Ll/z57;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/z57;->a:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z57;->a:Z

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->U0(Z)V

    return-void
.end method
