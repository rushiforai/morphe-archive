.class public final synthetic Ll/jji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wji0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/wji0;Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jji0;->a:Ll/wji0;

    iput-object p2, p0, Ll/jji0;->b:Ll/xc00;

    iput-object p3, p0, Ll/jji0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/jji0;->d:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jji0;->a:Ll/wji0;

    iget-object v1, p0, Ll/jji0;->b:Ll/xc00;

    iget-object v2, p0, Ll/jji0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/jji0;->d:Lorg/json/JSONObject;

    check-cast p1, Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    invoke-static {v0, v1, v2, p0, p1}, Ll/wji0;->O(Ll/wji0;Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V

    return-void
.end method
