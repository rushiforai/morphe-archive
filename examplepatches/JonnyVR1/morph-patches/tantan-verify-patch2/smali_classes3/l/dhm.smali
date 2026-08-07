.class public final synthetic Ll/dhm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dhm;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/dhm;->b:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dhm;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/dhm;->b:Ll/aqq;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->e(Ljava/lang/String;Ll/aqq;)V

    return-void
.end method
