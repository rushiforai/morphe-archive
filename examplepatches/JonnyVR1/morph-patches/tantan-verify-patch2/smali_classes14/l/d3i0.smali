.class public Ll/d3i0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/d3i0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/d3i0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/d3i0;->c:Ljava/lang/Throwable;

    .line 9
    .line 10
    return-void
.end method

.method public static a(Ljava/lang/String;)Ll/d3i0;
    .locals 3

    .line 1
    new-instance v0, Ll/d3i0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, p0, v2}, Ll/d3i0;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static b(Ljava/lang/Throwable;)Ll/d3i0;
    .locals 3

    .line 1
    new-instance v0, Ll/d3i0;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2, p0}, Ll/d3i0;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
