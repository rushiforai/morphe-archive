.class public final synthetic Ll/v0f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/bqq;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/bqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v0f0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/v0f0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/v0f0;->c:Ll/bqq;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/v0f0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/v0f0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/v0f0;->c:Ll/bqq;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    move-object v4, p2

    check-cast v4, Ljava/lang/String;

    move-object v5, p3

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;->o(Ljava/lang/String;Ljava/lang/String;Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
