.class public final Ll/v6z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:J


# direct methods
.method public synthetic constructor <init>(IJLl/u6z0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/v6z0;->a:I

    .line 5
    .line 6
    iput-wide p2, p0, Ll/v6z0;->b:J

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/v6z0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/v6z0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic b(Ll/v6z0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/v6z0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public final c()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/v6z0;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    :goto_0
    return v0
.end method
