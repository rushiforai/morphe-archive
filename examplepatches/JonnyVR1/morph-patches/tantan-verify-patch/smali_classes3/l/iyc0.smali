.class public Ll/iyc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hyc0;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iyc0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/iyc0;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Ll/iyc0;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Static"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "Online"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "Default"

    .line 16
    .line 17
    return-object p0
.end method

.method public asString()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Ll/iyc0;->b:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/iyc0;->b()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/iyc0;->a:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iyc0;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Value is null, and cannot be converted to the desired type."

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
