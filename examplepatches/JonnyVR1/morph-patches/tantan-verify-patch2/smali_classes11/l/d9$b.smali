.class public final Ll/d9$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d9;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(IIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/d9$b;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/d9$b;->c:I

    .line 7
    .line 8
    iput p3, p0, Ll/d9$b;->b:I

    .line 9
    .line 10
    iput p4, p0, Ll/d9$b;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/d9$b;->e:I

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(IIIIILl/d9$a;)V
    .locals 0

    .line 15
    invoke-direct/range {p0 .. p5}, Ll/d9$b;-><init>(IIIII)V

    return-void
.end method
