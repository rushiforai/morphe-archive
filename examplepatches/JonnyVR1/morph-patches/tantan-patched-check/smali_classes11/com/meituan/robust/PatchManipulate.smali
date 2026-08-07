.class public abstract Lcom/meituan/robust/PatchManipulate;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract ensurePatchExist(Lcom/meituan/robust/Patch;)Z
.end method

.method public abstract fetchPatchList(Landroid/content/Context;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/meituan/robust/Patch;",
            ">;"
        }
    .end annotation
.end method

.method public abstract verifyPatch(Landroid/content/Context;Lcom/meituan/robust/Patch;)Z
.end method
