.class public final synthetic Ll/ibk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ibk0;->a:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibk0;->a:Ll/xc00;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->f(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
