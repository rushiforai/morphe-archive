.class public final synthetic Ll/mci0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vci0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Privilege;

.field public final synthetic d:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/vci0;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mci0;->a:Ll/vci0;

    iput-object p2, p0, Ll/mci0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/mci0;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    iput-object p4, p0, Ll/mci0;->d:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mci0;->a:Ll/vci0;

    iget-object v1, p0, Ll/mci0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/mci0;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    iget-object p0, p0, Ll/mci0;->d:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, p0}, Ll/vci0;->P(Ll/vci0;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lorg/json/JSONObject;)V

    return-void
.end method
