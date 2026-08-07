.class public abstract Ll/x1j0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/x1j0;


# instance fields
.field public final a:Ll/x1j0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/aqf0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2, v2}, Ll/aqf0;-><init>(Ll/x1j0;II)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/x1j0;->b:Ll/x1j0;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ll/x1j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x1j0;->a:Ll/x1j0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(II)Ll/x1j0;
    .locals 1

    .line 1
    new-instance v0, Ll/aqf0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/aqf0;-><init>(Ll/x1j0;II)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final b(II)Ll/x1j0;
    .locals 1

    .line 1
    new-instance v0, Ll/fy2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/fy2;-><init>(Ll/x1j0;II)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public abstract c(Ll/b13;[B)V
.end method

.method public final d()Ll/x1j0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1j0;->a:Ll/x1j0;

    .line 2
    .line 3
    return-object p0
.end method
