.class public final synthetic Ll/wj7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wj7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/wj7;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/wj7;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wj7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/wj7;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/wj7;->c:Z

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->r5(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;ZLorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
