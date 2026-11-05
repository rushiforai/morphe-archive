.class public final synthetic Le/e/a/ListActions$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Ljava/util/Map;

.field public final synthetic f$2:Ljava/util/Map;

.field public final synthetic f$3:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(ILjava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$0:I

    iput-object p2, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$1:Ljava/util/Map;

    iput-object p3, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$2:Ljava/util/Map;

    iput-object p4, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$3:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 9

    .line 0
    iget v0, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$0:I

    iget-object v1, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$1:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$2:Ljava/util/Map;

    iget-object v3, p0, Le/e/a/ListActions$$ExternalSyntheticLambda16;->f$3:Ljava/util/Map;

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/ListActions;->lambda$19(ILjava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p1

    return p1
.end method
