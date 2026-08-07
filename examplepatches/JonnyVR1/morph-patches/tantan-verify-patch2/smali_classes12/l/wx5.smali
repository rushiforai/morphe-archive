.class public Ll/wx5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wx5$a;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/ux5;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public synthetic constructor <init>(Ll/wx5$a;Ll/q9s0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/wx5$a;->d(Ll/wx5$a;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iput-boolean p2, p0, Ll/wx5;->a:Z

    .line 9
    .line 10
    invoke-static {p1}, Ll/wx5$a;->c(Ll/wx5$a;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/wx5;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Ll/wx5$a;->b(Ll/wx5$a;)Ll/ux5;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/wx5;->c:Ll/ux5;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a()Ll/ux5;
    .locals 0
    .annotation build Landroidx/annotation/RecentlyNullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wx5;->c:Ll/ux5;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wx5;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/RecentlyNullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wx5;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
