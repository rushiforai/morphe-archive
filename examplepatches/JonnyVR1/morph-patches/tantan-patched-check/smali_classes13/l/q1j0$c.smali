.class public Ll/q1j0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q1j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:Ll/q1j0$b;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:I


# direct methods
.method public constructor <init>(ILl/q1j0$b;)V
    .locals 0
    .param p2    # Ll/q1j0$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/q1j0$c;->a:Ll/q1j0$b;

    .line 5
    .line 6
    iput p1, p0, Ll/q1j0$c;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/q1j0$b;)Z
    .locals 0
    .param p1    # Ll/q1j0$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/q1j0$c;->a:Ll/q1j0$b;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
