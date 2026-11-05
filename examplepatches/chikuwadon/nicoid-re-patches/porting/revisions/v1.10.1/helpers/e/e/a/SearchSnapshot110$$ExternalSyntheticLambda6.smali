.class public final synthetic Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field public final synthetic f$0:Ljava/util/HashMap;

.field public final synthetic f$1:[Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;[Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda6;->f$0:Ljava/util/HashMap;

    iput-object p2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda6;->f$1:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda6;->f$0:Ljava/util/HashMap;

    iget-object v1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda6;->f$1:[Ljava/lang/Object;

    invoke-static {v0, v1, p1, p2, p3}, Le/e/a/SearchSnapshot110;->lambda$1(Ljava/util/HashMap;[Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
