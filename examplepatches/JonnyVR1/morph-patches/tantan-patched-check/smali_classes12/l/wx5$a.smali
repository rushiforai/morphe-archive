.class public final Ll/wx5$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wx5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ll/ux5;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic b(Ll/wx5$a;)Ll/ux5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wx5$a;->c:Ll/ux5;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic c(Ll/wx5$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wx5$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/wx5$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wx5$a;->a:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a()Ll/wx5;
    .locals 2
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/wx5;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/wx5;-><init>(Ll/wx5$a;Ll/q9s0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
