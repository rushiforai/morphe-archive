.class public final Ll/k1v0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/b9s0;

.field public static volatile b:Ll/b9s0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/i4u0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/i4u0;-><init>(Ll/t5t0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/k1v0;->a:Ll/b9s0;

    .line 8
    .line 9
    sput-object v0, Ll/k1v0;->b:Ll/b9s0;

    .line 10
    .line 11
    return-void
.end method

.method public static a()Ll/b9s0;
    .locals 1

    .line 1
    sget-object v0, Ll/k1v0;->b:Ll/b9s0;

    .line 2
    .line 3
    return-object v0
.end method
