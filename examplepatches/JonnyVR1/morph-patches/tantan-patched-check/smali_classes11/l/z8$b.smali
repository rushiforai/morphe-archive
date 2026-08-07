.class public final Ll/z8$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z8;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIIIII)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/z8$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/z8$b;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/z8$b;->d:I

    .line 9
    .line 10
    iput p4, p0, Ll/z8$b;->c:I

    .line 11
    .line 12
    iput p5, p0, Ll/z8$b;->e:I

    .line 13
    .line 14
    iput p6, p0, Ll/z8$b;->f:I

    .line 15
    .line 16
    iput p7, p0, Ll/z8$b;->g:I

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IIIIIILl/z8$a;)V
    .locals 0

    .line 19
    invoke-direct/range {p0 .. p7}, Ll/z8$b;-><init>(Ljava/lang/String;IIIIII)V

    return-void
.end method
