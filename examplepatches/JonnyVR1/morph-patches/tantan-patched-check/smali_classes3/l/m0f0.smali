.class public final synthetic Ll/m0f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m0f0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/m0f0;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m0f0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/m0f0;->b:Ljava/io/File;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;->h(Ljava/lang/String;Ljava/io/File;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
