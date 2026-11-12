.class public Lcom/leanplum/Var;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/Var$VarInitializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static printedCallbackWarning:Z


# instance fields
.field private data:[B

.field private defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private fileIsPending:Z

.field private final fileReadyHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/leanplum/callbacks/VariableCallback<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private hadStarted:Z

.field private hash:Ljava/lang/String;

.field private isAsset:Z

.field private isInternal:Z

.field public isResource:Z

.field private kind:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private nameComponents:[Ljava/lang/String;

.field private numberValue:Ljava/lang/Double;

.field private overrideResId:I

.field private size:I

.field public stringValue:Ljava/lang/String;

.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final valueChangedHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/leanplum/callbacks/VariableCallback<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private valueIsInAssets:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/leanplum/Var;->fileReadyHandlers:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/leanplum/Var;->valueChangedHandlers:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/Var;->valueIsInAssets:Z

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/Var;)Ljava/io/InputStream;
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/Var;->defaultStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic access$002(Lcom/leanplum/Var;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/leanplum/Var;->isAsset:Z

    return p1
.end method

.method public static synthetic access$102(Lcom/leanplum/Var;I)I
    .registers 2

    iput p1, p0, Lcom/leanplum/Var;->size:I

    return p1
.end method

.method public static synthetic access$202(Lcom/leanplum/Var;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lcom/leanplum/Var;->hash:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic access$302(Lcom/leanplum/Var;[B)[B
    .registers 2

    iput-object p1, p0, Lcom/leanplum/Var;->data:[B

    return-object p1
.end method

.method public static synthetic access$400(Lcom/leanplum/Var;)V
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/Var;->triggerFileIsReady()V

    return-void
.end method

.method private cacheComputedValues()V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_13

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/leanplum/Var;->modifyNumberValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;

    invoke-direct {p0, v0}, Lcom/leanplum/Var;->modifyValue(Ljava/lang/Number;)V

    return-void

    :cond_13
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_35

    iget-object v0, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    iget-object v0, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;

    iget-object v0, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lcom/leanplum/Var;->modifyValue(Ljava/lang/Number;)V

    return-void

    :cond_35
    const/4 v1, 0x0

    if-eqz v0, :cond_49

    instance-of v2, v0, Ljava/lang/Iterable;

    if-nez v2, :cond_49

    instance-of v2, v0, Ljava/util/Map;

    if-nez v2, :cond_49

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    iput-object v1, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;

    return-void

    :cond_49
    iput-object v1, p0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    iput-object v1, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;

    return-void
.end method

.method private defaultStream()Ljava/io/InputStream;
    .registers 9

    const/4 v1, 0x0

    :try_start_1
    const-string v0, "file"

    iget-object v2, p0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    return-object v1

    :cond_c
    iget-boolean v2, p0, Lcom/leanplum/Var;->isResource:Z

    iget-boolean v0, p0, Lcom/leanplum/Var;->isAsset:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iget-boolean v0, p0, Lcom/leanplum/Var;->valueIsInAssets:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v0, p0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    iget-object v7, p0, Lcom/leanplum/Var;->data:[B

    invoke-static/range {v2 .. v7}, Lcom/leanplum/internal/FileManager;->stream(ZLjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;[B)Ljava/io/InputStream;

    move-result-object p0
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_29

    return-object p0

    :catchall_29
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public static define(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/Var;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)",
            "Lcom/leanplum/Var<",
            "TT;>;"
        }
    .end annotation

    .line 151
    invoke-static {p1}, Lcom/leanplum/internal/VarCache;->kindFromValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;

    move-result-object p0

    return-object p0
.end method

.method public static define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Lcom/leanplum/Var;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Ljava/lang/String;",
            ")",
            "Lcom/leanplum/Var<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 152
    invoke-static {p0, p1, p2, v0}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;

    move-result-object p0

    return-object p0
.end method

.method private static define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Ljava/lang/String;",
            "Lcom/leanplum/Var$VarInitializer<",
            "TT;>;)",
            "Lcom/leanplum/Var<",
            "TT;>;"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_10

    const-string p0, "Empty name parameter provided."

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_10
    invoke-static {p0}, Lcom/leanplum/internal/VarCache;->getVariable(Ljava/lang/String;)Lcom/leanplum/Var;

    move-result-object v0

    if-eqz v0, :cond_17

    return-object v0

    :cond_17
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    const-string v3, "__Android Resources"

    if-eqz v0, :cond_32

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "You should not create new variables after calling start (name="

    const-string v4, ")"

    invoke-static {v0, p0, v4}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_32
    new-instance v0, Lcom/leanplum/Var;

    invoke-direct {v0}, Lcom/leanplum/Var;-><init>()V

    :try_start_37
    iput-object p0, v0, Lcom/leanplum/Var;->name:Ljava/lang/String;

    invoke-static {p0}, Lcom/leanplum/internal/VarCache;->getNameComponents(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/leanplum/Var;->nameComponents:[Ljava/lang/String;

    iput-object p1, v0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    iput-object p1, v0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    iput-object p2, v0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    const/4 p1, 0x1

    if-eqz p0, :cond_4e

    iput-boolean p1, v0, Lcom/leanplum/Var;->isInternal:Z

    :cond_4e
    if-eqz p3, :cond_53

    invoke-interface {p3, v0}, Lcom/leanplum/Var$VarInitializer;->init(Lcom/leanplum/Var;)V

    :cond_53
    invoke-direct {v0}, Lcom/leanplum/Var;->cacheComputedValues()V

    invoke-static {v0}, Lcom/leanplum/internal/VarCache;->registerVariable(Lcom/leanplum/Var;)V

    const-string p0, "file"

    iget-object p2, v0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8e

    iget-boolean p0, v0, Lcom/leanplum/Var;->isResource:Z

    if-eqz p0, :cond_76

    iget-object p0, v0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    new-instance p2, Lfc;

    invoke-direct {p2, v0, p1}, Lfc;-><init>(Ljava/lang/Object;B)V

    iget-object p1, v0, Lcom/leanplum/Var;->hash:Ljava/lang/String;

    iget p3, v0, Lcom/leanplum/Var;->size:I

    invoke-static {p0, p2, p1, p3}, Lcom/leanplum/internal/VarCache;->registerFile(Ljava/lang/String;Lcom/leanplum/internal/VarCache$StreamProvider;Ljava/lang/String;I)V

    goto :goto_8e

    :cond_76
    invoke-virtual {v0}, Lcom/leanplum/Var;->defaultValue()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_84

    invoke-virtual {v0}, Lcom/leanplum/Var;->defaultValue()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_84
    iget-object p0, v0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    new-instance p2, Lfc;

    invoke-direct {p2, v0, p1}, Lfc;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v1, p2}, Lcom/leanplum/internal/VarCache;->registerFile(Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/internal/VarCache$StreamProvider;)V

    :cond_8e
    :goto_8e
    invoke-virtual {v0}, Lcom/leanplum/Var;->update()V
    :try_end_91
    .catchall {:try_start_37 .. :try_end_91} :catchall_92

    return-object v0

    :catchall_92
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static defineAsset(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/Var;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/leanplum/Var<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/leanplum/Var$1;

    invoke-direct {v0}, Lcom/leanplum/Var$1;-><init>()V

    const-string v1, "file"

    invoke-static {p0, p1, v1, v0}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;

    move-result-object p0

    return-object p0
.end method

.method public static defineColor(Ljava/lang/String;I)Lcom/leanplum/Var;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/leanplum/Var<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v0, "color"

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;

    move-result-object p0

    return-object p0
.end method

.method public static defineFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/Var;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/leanplum/Var<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "file"

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;

    move-result-object p0

    return-object p0
.end method

.method public static defineResource(Ljava/lang/String;I)Lcom/leanplum/Var;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/leanplum/Var<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Lcom/leanplum/internal/Util;->generateResourceNameFromId(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lcom/leanplum/Var$2;

    invoke-direct {v0}, Lcom/leanplum/Var$2;-><init>()V

    const-string v1, "file"

    invoke-static {p0, p1, v1, v0}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;

    move-result-object p0

    return-object p0
.end method

.method public static defineResource(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[B)Lcom/leanplum/Var;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "[B)",
            "Lcom/leanplum/Var<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 16
    new-instance v0, Lcom/leanplum/Var$3;

    invoke-direct {v0, p2, p3, p4}, Lcom/leanplum/Var$3;-><init>(ILjava/lang/String;[B)V

    const-string p2, "file"

    invoke-static {p0, p1, p2, v0}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lcom/leanplum/Var$VarInitializer;)Lcom/leanplum/Var;

    move-result-object p0

    return-object p0
.end method

.method private modifyNumberValue(Ljava/lang/String;)V
    .registers 4

    :try_start_0
    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_6} :catch_7

    return-void

    :catch_7
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;

    iget-object p1, p0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1c

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;

    :cond_1c
    return-void
.end method

.method private modifyValue(Ljava/lang/Number;)V
    .registers 4

    if-eqz p1, :cond_6d

    iget-object v0, p0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/Byte;

    if-eqz v1, :cond_13

    invoke-virtual {p1}, Ljava/lang/Number;->byteValue()B

    move-result p1

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    return-void

    :cond_13
    instance-of v1, v0, Ljava/lang/Short;

    if-eqz v1, :cond_22

    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result p1

    invoke-static {p1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    return-void

    :cond_22
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_31

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    return-void

    :cond_31
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_40

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    return-void

    :cond_40
    instance-of v1, v0, Ljava/lang/Float;

    if-eqz v1, :cond_4f

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    return-void

    :cond_4f
    instance-of v1, v0, Ljava/lang/Double;

    if-eqz v1, :cond_5e

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    return-void

    :cond_5e
    instance-of v0, v0, Ljava/lang/Character;

    if-eqz v0, :cond_6d

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    int-to-char p1, p1

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    :cond_6d
    return-void
.end method

.method private triggerFileIsReady()V
    .registers 5

    iget-object v0, p0, Lcom/leanplum/Var;->fileReadyHandlers:Ljava/util/List;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    iput-boolean v1, p0, Lcom/leanplum/Var;->fileIsPending:Z

    iget-object v1, p0, Lcom/leanplum/Var;->fileReadyHandlers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/callbacks/VariableCallback;

    invoke-virtual {v2, p0}, Lcom/leanplum/callbacks/VariableCallback;->setVariable(Lcom/leanplum/Var;)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_c

    :cond_23
    monitor-exit v0

    return-void

    :goto_25
    monitor-exit v0
    :try_end_26
    .catchall {:try_start_4 .. :try_end_26} :catchall_27

    throw p0

    :catchall_27
    move-exception p0

    goto :goto_25
.end method

.method private triggerValueChanged()V
    .registers 5

    iget-object v0, p0, Lcom/leanplum/Var;->valueChangedHandlers:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/leanplum/Var;->valueChangedHandlers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/callbacks/VariableCallback;

    invoke-virtual {v2, p0}, Lcom/leanplum/callbacks/VariableCallback;->setVariable(Lcom/leanplum/Var;)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_9

    :cond_20
    monitor-exit v0

    return-void

    :goto_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_24

    throw p0

    :catchall_24
    move-exception p0

    goto :goto_22
.end method

.method private warnIfNotStarted()V
    .registers 2

    iget-boolean v0, p0, Lcom/leanplum/Var;->isInternal:Z

    if-nez v0, :cond_1c

    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-nez v0, :cond_1c

    sget-boolean v0, Lcom/leanplum/Var;->printedCallbackWarning:Z

    if-nez v0, :cond_1c

    iget-object p0, p0, Lcom/leanplum/Var;->name:Ljava/lang/String;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "Leanplum hasn\'t finished retrieving values from the server. You should use a callback to make sure the value for \'%s\' is ready. Otherwise, your app may not use the most up-to-date value."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x1

    sput-boolean p0, Lcom/leanplum/Var;->printedCallbackWarning:Z

    :cond_1c
    return-void
.end method


# virtual methods
.method public addFileReadyHandler(Lcom/leanplum/callbacks/VariableCallback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/callbacks/VariableCallback<",
            "TT;>;)V"
        }
    .end annotation

    if-nez p1, :cond_b

    const-string p0, "Invalid handler parameter provided."

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    iget-object v0, p0, Lcom/leanplum/Var;->fileReadyHandlers:Ljava/util/List;

    monitor-enter v0

    :try_start_e
    iget-object v1, p0, Lcom/leanplum/Var;->fileReadyHandlers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_24

    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_21

    iget-boolean v0, p0, Lcom/leanplum/Var;->fileIsPending:Z

    if-nez v0, :cond_21

    invoke-virtual {p1, p0}, Lcom/leanplum/callbacks/VariableCallback;->handle(Lcom/leanplum/Var;)V

    :cond_21
    return-void

    :goto_22
    :try_start_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_24

    throw p0

    :catchall_24
    move-exception p0

    goto :goto_22
.end method

.method public addValueChangedHandler(Lcom/leanplum/callbacks/VariableCallback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/callbacks/VariableCallback<",
            "TT;>;)V"
        }
    .end annotation

    if-nez p1, :cond_b

    const-string p0, "Invalid handler parameter provided."

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    iget-object v0, p0, Lcom/leanplum/Var;->valueChangedHandlers:Ljava/util/List;

    monitor-enter v0

    :try_start_e
    iget-object v1, p0, Lcom/leanplum/Var;->valueChangedHandlers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_20

    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p1, p0}, Lcom/leanplum/callbacks/VariableCallback;->handle(Lcom/leanplum/Var;)V

    :cond_1d
    return-void

    :goto_1e
    :try_start_1e
    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_20

    throw p0

    :catchall_20
    move-exception p0

    goto :goto_1e
.end method

.method public count()I
    .registers 3

    const/4 v0, 0x0

    :try_start_1
    invoke-direct {p0}, Lcom/leanplum/Var;->warnIfNotStarted()V

    iget-object p0, p0, Lcom/leanplum/Var;->nameComponents:[Ljava/lang/String;

    invoke-static {p0}, Lcom/leanplum/internal/VarCache;->getMergedValueFromComponentArray([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v1, p0, Ljava/util/List;

    if-eqz v1, :cond_15

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_20

    return p0

    :cond_15
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This variable is not a list."

    invoke-direct {p0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->maybeThrowException(Ljava/lang/RuntimeException;)V

    return v0

    :catchall_20
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return v0
.end method

.method public defaultValue()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object p0, p0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    return-object p0
.end method

.method public fileValue()Ljava/lang/String;
    .registers 3

    :try_start_0
    invoke-direct {p0}, Lcom/leanplum/Var;->warnIfNotStarted()V

    const-string v0, "file"

    iget-object v1, p0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    iget-object v1, p0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-boolean p0, p0, Lcom/leanplum/Var;->valueIsInAssets:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lcom/leanplum/internal/FileManager;->fileValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object p0
    :try_end_1d
    .catchall {:try_start_0 .. :try_end_1d} :catchall_1e

    return-object p0

    :catchall_1e
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_22
    const/4 p0, 0x0

    return-object p0
.end method

.method public kind()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    return-object p0
.end method

.method public name()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/Var;->name:Ljava/lang/String;

    return-object p0
.end method

.method public nameComponents()[Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/Var;->nameComponents:[Ljava/lang/String;

    return-object p0
.end method

.method public numberValue()Ljava/lang/Number;
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/Var;->warnIfNotStarted()V

    iget-object p0, p0, Lcom/leanplum/Var;->numberValue:Ljava/lang/Double;

    return-object p0
.end method

.method public varargs objectForKeyPath([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    :try_start_0
    invoke-direct {p0}, Lcom/leanplum/Var;->warnIfNotStarted()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Lcom/leanplum/Var;->nameComponents:[Ljava/lang/String;

    invoke-static {v0, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    if-eqz p1, :cond_15

    array-length p0, p1

    if-lez p0, :cond_15

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    :cond_15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/VarCache;->getMergedValueFromComponentArray([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_23
    .catchall {:try_start_0 .. :try_end_23} :catchall_24

    return-object p0

    :catchall_24
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public overrideResId()I
    .registers 1

    iget p0, p0, Lcom/leanplum/Var;->overrideResId:I

    return p0
.end method

.method public removeFileReadyHandler(Lcom/leanplum/callbacks/VariableCallback;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/callbacks/VariableCallback<",
            "TT;>;)V"
        }
    .end annotation

    if-nez p1, :cond_b

    const-string p0, "Invalid handler parameter provided."

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    iget-object v0, p0, Lcom/leanplum/Var;->fileReadyHandlers:Ljava/util/List;

    monitor-enter v0

    :try_start_e
    iget-object p0, p0, Lcom/leanplum/Var;->fileReadyHandlers:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_17

    throw p0

    :catchall_17
    move-exception p0

    goto :goto_15
.end method

.method public removeValueChangedHandler(Lcom/leanplum/callbacks/VariableCallback;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/callbacks/VariableCallback<",
            "TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/leanplum/Var;->valueChangedHandlers:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/leanplum/Var;->valueChangedHandlers:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_a
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_c

    throw p0

    :catchall_c
    move-exception p0

    goto :goto_a
.end method

.method public setOverrideResId(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/Var;->overrideResId:I

    return-void
.end method

.method public stream()Ljava/io/InputStream;
    .registers 9

    const/4 v1, 0x0

    :try_start_1
    const-string v0, "file"

    iget-object v2, p0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    return-object v1

    :cond_c
    invoke-direct {p0}, Lcom/leanplum/Var;->warnIfNotStarted()V

    iget-boolean v2, p0, Lcom/leanplum/Var;->isResource:Z

    iget-boolean v0, p0, Lcom/leanplum/Var;->isAsset:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iget-boolean v0, p0, Lcom/leanplum/Var;->valueIsInAssets:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p0}, Lcom/leanplum/Var;->fileValue()Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    iget-object v7, p0, Lcom/leanplum/Var;->data:[B

    invoke-static/range {v2 .. v7}, Lcom/leanplum/internal/FileManager;->stream(ZLjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;[B)Ljava/io/InputStream;

    move-result-object v0

    if-nez v0, :cond_33

    invoke-direct {p0}, Lcom/leanplum/Var;->defaultStream()Ljava/io/InputStream;

    move-result-object p0
    :try_end_32
    .catchall {:try_start_1 .. :try_end_32} :catchall_34

    return-object p0

    :cond_33
    return-object v0

    :catchall_34
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public stringValue()Ljava/lang/String;
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/Var;->warnIfNotStarted()V

    iget-object p0, p0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Var("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/leanplum/Var;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public declared-synchronized update()V
    .registers 7

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    iget-object v1, p0, Lcom/leanplum/Var;->nameComponents:[Ljava/lang/String;

    invoke-static {v1}, Lcom/leanplum/internal/VarCache;->getMergedValueFromComponentArray([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_a2

    if-nez v1, :cond_11

    if-nez v0, :cond_11

    monitor-exit p0

    return-void

    :cond_11
    if-eqz v1, :cond_21

    if-eqz v0, :cond_21

    :try_start_15
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    iget-boolean v0, p0, Lcom/leanplum/Var;->hadStarted:Z
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_a2

    if-eqz v0, :cond_21

    monitor-exit p0

    return-void

    :cond_21
    :try_start_21
    invoke-direct {p0}, Lcom/leanplum/Var;->cacheComputedValues()V

    invoke-static {}, Lcom/leanplum/internal/VarCache;->silent()Z

    move-result v0

    if-eqz v0, :cond_45

    iget-object v0, p0, Lcom/leanplum/Var;->name:Ljava/lang/String;

    const-string v1, "__Android Resources"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_45

    const-string v0, "file"

    iget-object v1, p0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    iget-boolean v0, p0, Lcom/leanplum/Var;->fileIsPending:Z

    if-nez v0, :cond_45

    invoke-direct {p0}, Lcom/leanplum/Var;->triggerFileIsReady()V

    :cond_45
    invoke-static {}, Lcom/leanplum/internal/VarCache;->silent()Z

    move-result v0
    :try_end_49
    .catchall {:try_start_21 .. :try_end_49} :catchall_a2

    if-eqz v0, :cond_4d

    monitor-exit p0

    return-void

    :cond_4d
    :try_start_4d
    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-direct {p0}, Lcom/leanplum/Var;->triggerValueChanged()V

    :cond_56
    const-string v0, "file"

    iget-object v1, p0, Lcom/leanplum/Var;->kind:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_96

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_89

    iget-boolean v0, p0, Lcom/leanplum/Var;->isResource:Z

    iget-object v2, p0, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/leanplum/Var;->defaultValue:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    new-instance v4, Lcom/leanplum/Var$4;

    invoke-direct {v4, p0}, Lcom/leanplum/Var$4;-><init>(Lcom/leanplum/Var;)V

    const/4 v5, 0x0

    invoke-static {v0, v2, v3, v5, v4}, Lcom/leanplum/internal/FileManager;->maybeDownloadFile(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Lcom/leanplum/internal/FileManager$DownloadFileResult;

    move-result-object v0

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/leanplum/Var;->valueIsInAssets:Z

    sget-object v2, Lcom/leanplum/internal/FileManager$DownloadFileResult;->DOWNLOADING:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    if-ne v0, v2, :cond_83

    iput-boolean v1, p0, Lcom/leanplum/Var;->fileIsPending:Z

    goto :goto_89

    :cond_83
    sget-object v2, Lcom/leanplum/internal/FileManager$DownloadFileResult;->EXISTS_IN_ASSETS:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    if-ne v0, v2, :cond_89

    iput-boolean v1, p0, Lcom/leanplum/Var;->valueIsInAssets:Z

    :cond_89
    :goto_89
    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_96

    iget-boolean v0, p0, Lcom/leanplum/Var;->fileIsPending:Z

    if-nez v0, :cond_96

    invoke-direct {p0}, Lcom/leanplum/Var;->triggerFileIsReady()V

    :cond_96
    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_9e

    iput-boolean v1, p0, Lcom/leanplum/Var;->hadStarted:Z
    :try_end_9e
    .catchall {:try_start_4d .. :try_end_9e} :catchall_a2

    :cond_9e
    monitor-exit p0

    return-void

    :goto_a0
    :try_start_a0
    monitor-exit p0
    :try_end_a1
    .catchall {:try_start_a0 .. :try_end_a1} :catchall_a2

    throw v0

    :catchall_a2
    move-exception v0

    goto :goto_a0
.end method

.method public value()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/leanplum/Var;->warnIfNotStarted()V

    iget-object p0, p0, Lcom/leanplum/Var;->value:Ljava/lang/Object;

    return-object p0
.end method
