.class public final synthetic Le/e/a/MenuEditor120$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda0;->f$0:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda0;->f$0:Ljava/util/List;

    check-cast p1, Le/e/a/ListActions$Action;

    check-cast p2, Le/e/a/ListActions$Action;

    invoke-static {v0, p1, p2}, Le/e/a/MenuEditor120;->lambda$0(Ljava/util/List;Le/e/a/ListActions$Action;Le/e/a/ListActions$Action;)I

    move-result p1

    return p1
.end method
