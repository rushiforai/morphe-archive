.class public final Ll/bmr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:[B

.field public final c:J

.field public final d:J


# direct methods
.method public constructor <init>(Ljava/lang/String;[BJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bmr0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bmr0;->b:[B

    .line 7
    .line 8
    iput-wide p3, p0, Ll/bmr0;->c:J

    .line 9
    .line 10
    iput-wide p5, p0, Ll/bmr0;->d:J

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Ll/bmr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bmr0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic b(Ll/bmr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bmr0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic c(Ll/bmr0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmr0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/bmr0;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmr0;->b:[B

    .line 2
    .line 3
    return-object p0
.end method
