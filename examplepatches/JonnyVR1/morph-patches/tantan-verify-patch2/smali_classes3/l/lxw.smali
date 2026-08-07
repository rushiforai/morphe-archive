.class public Ll/lxw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lxw;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lxw;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lxw;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/data/Prediction;)Ll/lxw;
    .locals 3

    .line 1
    new-instance v0, Ll/lxw;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Prediction;->structured_formatting:Lcom/p1/mobile/putong/core/data/StructuredFormatting;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/StructuredFormatting;->main_text:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StructuredFormatting;->secondary_text:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prediction;->place_id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v0, v2, v1, p0}, Ll/lxw;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lxw;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lxw;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lxw;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
