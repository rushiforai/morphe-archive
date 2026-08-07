.class public final synthetic Ll/tvi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bqq;


# direct methods
.method public synthetic constructor <init>(Ll/bqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tvi0;->a:Ll/bqq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tvi0;->a:Ll/bqq;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->d(Ll/bqq;Ljava/lang/String;)V

    return-void
.end method
