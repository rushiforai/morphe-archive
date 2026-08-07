.class public final Ll/tjr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Z

.field public final c:I


# direct methods
.method public constructor <init>(IZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/tjr0;->a:I

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/tjr0;->b:Z

    .line 7
    .line 8
    iput p3, p0, Ll/tjr0;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Ll/tjr0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tjr0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic b(Ll/tjr0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tjr0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic c(Ll/tjr0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tjr0;->b:Z

    .line 2
    .line 3
    return p0
.end method
