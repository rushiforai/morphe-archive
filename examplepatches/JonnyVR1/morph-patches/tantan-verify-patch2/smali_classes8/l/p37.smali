.class public final synthetic Ll/p37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p37;->a:Ll/aqq;

    iput-object p2, p0, Ll/p37;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p37;->a:Ll/aqq;

    iget-object p0, p0, Ll/p37;->b:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->h1(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
