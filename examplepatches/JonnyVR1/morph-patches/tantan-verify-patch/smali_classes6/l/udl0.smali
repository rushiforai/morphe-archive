.class public Ll/udl0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/immomo/velib/anim/model/VideoEffectModel;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/anim/model/VideoEffectModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    new-instance p1, Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/udl0;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iput-object p1, p0, Ll/udl0;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 15
    .line 16
    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getConfigPath(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static d(Ljava/lang/String;)Ll/udl0;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->parseByPath(Ljava/lang/String;)Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/udl0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/udl0;-><init>(Lcom/immomo/velib/anim/model/VideoEffectModel;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/udl0;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Lcom/immomo/velib/anim/model/VideoEffectModel;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/udl0;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    return-object p0
.end method
