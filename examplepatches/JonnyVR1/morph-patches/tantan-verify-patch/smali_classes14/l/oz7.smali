.class public final synthetic Ll/oz7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oz7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/oz7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/oz7;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oz7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/oz7;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/oz7;->c:Ljava/util/List;

    check-cast p1, Lorg/json/JSONArray;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->M6(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/util/List;Lorg/json/JSONArray;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
