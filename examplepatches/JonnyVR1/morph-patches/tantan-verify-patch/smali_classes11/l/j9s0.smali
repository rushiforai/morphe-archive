.class public final Ll/j9s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field public static final a:Ll/j9s0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/j9s0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2}, Ll/j9s0;-><init>(ZLl/o4u0;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/j9s0;->a:Ll/j9s0;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(ZLl/o4u0;)V
    .locals 0
    .param p2    # Ll/o4u0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(ZLl/b6t0;)Ll/j9s0;
    .locals 0
    .param p1    # Ll/b6t0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/j9s0;->a:Ll/j9s0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final close()V
    .locals 0

    .line 1
    return-void
.end method
