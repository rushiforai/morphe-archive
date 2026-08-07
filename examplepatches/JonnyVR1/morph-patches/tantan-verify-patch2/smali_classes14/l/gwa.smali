.class public final synthetic Ll/gwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gwa;->a:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p2, p0, Ll/gwa;->b:Ljava/util/Map;

    iput-object p3, p0, Ll/gwa;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gwa;->a:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v1, p0, Ll/gwa;->b:Ljava/util/Map;

    iget-object p0, p0, Ll/gwa;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/y;->b3(Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
