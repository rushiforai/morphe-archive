.class public final synthetic Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    check-cast p1, Ljava/nio/file/Path;

    check-cast p2, Ljava/nio/file/Path;

    check-cast p3, Ljava/lang/Exception;

    invoke-static {p1, p2, p3}, Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt;->$r8$lambda$De4yXv8T0vx7waJvVzG_4HFVSss(Ljava/nio/file/Path;Ljava/nio/file/Path;Ljava/lang/Exception;)Lkotlin/io/path/OnErrorResult;

    move-result-object p0

    return-object p0
.end method
