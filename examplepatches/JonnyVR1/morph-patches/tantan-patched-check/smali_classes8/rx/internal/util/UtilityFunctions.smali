.class public final Lrx/internal/util/UtilityFunctions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/util/UtilityFunctions$AlwaysFalse;,
        Lrx/internal/util/UtilityFunctions$AlwaysTrue;
    }
.end annotation


# direct methods
.method public static a()Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lrx/internal/util/UtilityFunctions$AlwaysTrue;->INSTANCE:Lrx/internal/util/UtilityFunctions$AlwaysTrue;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b()Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/qcj<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/UtilityFunctions$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lrx/internal/util/UtilityFunctions$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
