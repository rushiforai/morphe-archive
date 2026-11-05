.class public final Le/d/b/a/p0/v$e;
.super Le/d/b/a/p0/v$c;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/d/b/a/p0/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation


# instance fields
.field public final a:I

.field public final requestUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/util/Map;Le/d/b/a/p0/m;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Le/d/b/a/p0/m;",
            ")V"
        }
    .end annotation

    const-string p2, "Response code: "

    invoke-static {p2, p1}, Le/b/a/a/a;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    invoke-direct {p0, p2, p4, p3}, Le/d/b/a/p0/v$c;-><init>(Ljava/lang/String;Le/d/b/a/p0/m;I)V

    iput p1, p0, Le/d/b/a/p0/v$e;->a:I

    iget-object p1, p4, Le/d/b/a/p0/m;->a:Landroid/net/Uri;

    iput-object p1, p0, Le/d/b/a/p0/v$e;->requestUri:Landroid/net/Uri;

    return-void
.end method
