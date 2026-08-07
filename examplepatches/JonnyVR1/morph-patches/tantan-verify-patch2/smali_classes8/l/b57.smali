.class public final synthetic Ll/b57;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b57;->a:Ll/aqq;

    iput-object p2, p0, Ll/b57;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/b57;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b57;->a:Ll/aqq;

    iget-object v1, p0, Ll/b57;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/b57;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->q1(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
