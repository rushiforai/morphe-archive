.class public final Ll/j360$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/j360;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field static final INSTANCE:Ll/j360;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/j360<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/j360;

    .line 2
    .line 3
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/j360;-><init>(Ll/qcj;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/j360$b;->INSTANCE:Ll/j360;

    .line 11
    .line 12
    return-void
.end method
