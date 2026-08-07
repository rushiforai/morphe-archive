.class public Ll/e060;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[I

.field public final b:[I


# direct methods
.method public constructor <init>([I[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e060;->a:[I

    .line 5
    .line 6
    iput-object p2, p0, Ll/e060;->b:[I

    .line 7
    .line 8
    return-void
.end method

.method public static c()Ll/e060;
    .locals 3

    .line 1
    new-instance v0, Ll/e060;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    new-array v1, v1, [I

    .line 7
    .line 8
    invoke-direct {v0, v2, v1}, Ll/e060;-><init>([I[I)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public a()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e060;->b:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public b()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e060;->a:[I

    .line 2
    .line 3
    return-object p0
.end method
