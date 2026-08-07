.class public final Ll/kfl0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kfl0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/kfl0$a;->a:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/kfl0$a;->b:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/kfl0$a;->c:Z

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic c(Ll/kfl0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kfl0$a;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic d(Ll/kfl0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kfl0$a;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic e(Ll/kfl0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kfl0$a;->a:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a()Ll/kfl0;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/kfl0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/kfl0;-><init>(Ll/kfl0$a;Ll/wtx0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public b(Z)Ll/kfl0$a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/kfl0$a;->a:Z

    .line 2
    .line 3
    return-object p0
.end method
