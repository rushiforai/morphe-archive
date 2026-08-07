.class public Ll/x0j$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x0j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:[Ll/x0j$b;


# direct methods
.method public constructor <init>(I[Ll/x0j$b;)V
    .locals 0
    .param p2    # [Ll/x0j$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/x0j$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/x0j$a;->b:[Ll/x0j$b;

    .line 7
    .line 8
    return-void
.end method

.method public static a(I[Ll/x0j$b;)Ll/x0j$a;
    .locals 1
    .param p1    # [Ll/x0j$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/x0j$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/x0j$a;-><init>(I[Ll/x0j$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()[Ll/x0j$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x0j$a;->b:[Ll/x0j$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/x0j$a;->a:I

    .line 2
    .line 3
    return p0
.end method
