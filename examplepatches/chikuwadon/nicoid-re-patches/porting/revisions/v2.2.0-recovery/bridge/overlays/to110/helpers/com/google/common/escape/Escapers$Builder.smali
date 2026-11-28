.class public final Lcom/google/common/escape/Escapers$Builder;
.super Ljava/lang/Object;
.source "Escapers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/escape/Escapers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final replacementMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private safeMax:C

.field private safeMin:C

.field private unsafeReplacement:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/common/escape/Escapers$Builder;->replacementMap:Ljava/util/Map;

    const/4 v0, 0x0

    .line 93
    iput-char v0, p0, Lcom/google/common/escape/Escapers$Builder;->safeMin:C

    const v0, 0xffff

    .line 94
    iput-char v0, p0, Lcom/google/common/escape/Escapers$Builder;->safeMax:C

    const/4 v0, 0x0

    .line 95
    iput-object v0, p0, Lcom/google/common/escape/Escapers$Builder;->unsafeReplacement:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/escape/Escapers$1;)V
    .registers 2

    .line 91
    invoke-direct {p0}, Lcom/google/common/escape/Escapers$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/common/escape/Escapers$Builder;)Ljava/lang/String;
    .registers 1

    .line 91
    iget-object p0, p0, Lcom/google/common/escape/Escapers$Builder;->unsafeReplacement:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public addEscape(CLjava/lang/String;)Lcom/google/common/escape/Escapers$Builder;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "c",
            "replacement"
        }
    .end annotation

    .line 142
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    iget-object v0, p0, Lcom/google/common/escape/Escapers$Builder;->replacementMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public build()Lcom/google/common/escape/Escaper;
    .registers 5

    .line 150
    new-instance v0, Lcom/google/common/escape/Escapers$Builder$1;

    iget-object v1, p0, Lcom/google/common/escape/Escapers$Builder;->replacementMap:Ljava/util/Map;

    iget-char v2, p0, Lcom/google/common/escape/Escapers$Builder;->safeMin:C

    iget-char v3, p0, Lcom/google/common/escape/Escapers$Builder;->safeMax:C

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/google/common/escape/Escapers$Builder$1;-><init>(Lcom/google/common/escape/Escapers$Builder;Ljava/util/Map;CC)V

    return-object v0
.end method

.method public setSafeRange(CC)Lcom/google/common/escape/Escapers$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "safeMin",
            "safeMax"
        }
    .end annotation

    .line 111
    iput-char p1, p0, Lcom/google/common/escape/Escapers$Builder;->safeMin:C

    .line 112
    iput-char p2, p0, Lcom/google/common/escape/Escapers$Builder;->safeMax:C

    return-object p0
.end method

.method public setUnsafeReplacement(Ljava/lang/String;)Lcom/google/common/escape/Escapers$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "unsafeReplacement"
        }
    .end annotation

    .line 126
    iput-object p1, p0, Lcom/google/common/escape/Escapers$Builder;->unsafeReplacement:Ljava/lang/String;

    return-object p0
.end method
