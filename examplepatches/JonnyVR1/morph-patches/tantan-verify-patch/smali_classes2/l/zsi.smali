.class public final Ll/zsi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/zsi;->a:F

    return-void
.end method

.method public constructor <init>(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/zsi;->a:F

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/zsi;->b(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/zsi;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public b(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zsi;->a:F

    .line 2
    .line 3
    return-void
.end method
