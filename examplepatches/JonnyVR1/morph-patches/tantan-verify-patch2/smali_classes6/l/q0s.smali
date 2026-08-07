.class public final synthetic Ll/q0s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/aqq;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q0s;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/q0s;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/q0s;->c:Ll/aqq;

    iput-object p4, p0, Ll/q0s;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q0s;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/q0s;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/q0s;->c:Ll/aqq;

    iget-object p0, p0, Ll/q0s;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/LiveBridgeImpl;->d(Ljava/lang/String;Ljava/lang/String;Ll/aqq;Ljava/lang/String;)V

    return-void
.end method
