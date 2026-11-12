.class Lcom/leanplum/internal/LeanplumInternal$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumInternal;->maybePerformActions([Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/leanplum/ActionContext;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/leanplum/ActionContext;Lcom/leanplum/ActionContext;)I
    .registers 3

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getPriority()I

    move-result p0

    invoke-virtual {p2}, Lcom/leanplum/internal/BaseActionContext;->getPriority()I

    move-result p1

    sub-int/2addr p0, p1

    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 10
    check-cast p1, Lcom/leanplum/ActionContext;

    check-cast p2, Lcom/leanplum/ActionContext;

    invoke-virtual {p0, p1, p2}, Lcom/leanplum/internal/LeanplumInternal$4;->compare(Lcom/leanplum/ActionContext;Lcom/leanplum/ActionContext;)I

    move-result p0

    return p0
.end method
