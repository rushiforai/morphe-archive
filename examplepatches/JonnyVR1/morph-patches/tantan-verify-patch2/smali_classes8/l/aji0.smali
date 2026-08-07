.class public final synthetic Ll/aji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gji0;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Ll/xc00;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/gji0;Lorg/json/JSONObject;Ll/xc00;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aji0;->a:Ll/gji0;

    iput-object p2, p0, Ll/aji0;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/aji0;->c:Ll/xc00;

    iput-object p4, p0, Ll/aji0;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aji0;->a:Ll/gji0;

    iget-object v1, p0, Ll/aji0;->b:Lorg/json/JSONObject;

    iget-object v2, p0, Ll/aji0;->c:Ll/xc00;

    iget-object p0, p0, Ll/aji0;->d:Ljava/util/List;

    invoke-static {v0, v1, v2, p0}, Ll/gji0;->N(Ll/gji0;Lorg/json/JSONObject;Ll/xc00;Ljava/util/List;)V

    return-void
.end method
