.class public final Ll/m5z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/t2u0;

.field public final b:[I


# direct methods
.method public constructor <init>(Ll/t2u0;[II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length p3, p2

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    new-instance p3, Ljava/lang/IllegalArgumentException;

    .line 8
    .line 9
    invoke-direct {p3}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "ETSDefinition"

    .line 13
    .line 14
    const-string v1, "Empty tracks are not allowed"

    .line 15
    .line 16
    invoke-static {v0, v1, p3}, Ll/y4w0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iput-object p1, p0, Ll/m5z0;->a:Ll/t2u0;

    .line 20
    .line 21
    iput-object p2, p0, Ll/m5z0;->b:[I

    .line 22
    .line 23
    return-void
.end method
