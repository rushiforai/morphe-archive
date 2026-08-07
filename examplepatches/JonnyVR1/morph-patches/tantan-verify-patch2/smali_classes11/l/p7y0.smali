.class public final Ll/p7y0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:I

.field public final c:J

.field public final d:Ll/i2z0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/i2z0;IJLl/l7y0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p7y0;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p7y0;->d:Ll/i2z0;

    .line 7
    .line 8
    iput p3, p0, Ll/p7y0;->b:I

    .line 9
    .line 10
    iput-wide p4, p0, Ll/p7y0;->c:J

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Ll/p7y0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/p7y0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic b(Ll/p7y0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/p7y0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic c(Ll/p7y0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p7y0;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/p7y0;)Ll/i2z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p7y0;->d:Ll/i2z0;

    .line 2
    .line 3
    return-object p0
.end method
