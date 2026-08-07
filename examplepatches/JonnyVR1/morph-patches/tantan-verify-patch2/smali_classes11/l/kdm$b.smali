.class public final Ll/kdm$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kdm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


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
    iput p1, p0, Ll/kdm$b;->a:I

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/kdm$b;->b:Z

    .line 7
    .line 8
    iput p3, p0, Ll/kdm$b;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/kdm$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/kdm$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/kdm$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/kdm$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/kdm$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kdm$b;->b:Z

    .line 2
    .line 3
    return p0
.end method
