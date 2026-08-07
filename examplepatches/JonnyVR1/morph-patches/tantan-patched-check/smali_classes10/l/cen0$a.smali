.class public final Ll/cen0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cen0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:J

.field public d:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/den0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cen0$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ll/cen0;
    .locals 7

    .line 1
    new-instance v0, Ll/cen0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cen0$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cen0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v3, p0, Ll/cen0$a;->c:J

    .line 8
    .line 9
    iget-wide v5, p0, Ll/cen0$a;->d:J

    .line 10
    .line 11
    invoke-direct/range {v0 .. v6}, Ll/cen0;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public b(J)Ll/cen0$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/cen0$a;->d:J

    .line 2
    .line 3
    return-object p0
.end method

.method public c(J)Ll/cen0$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/cen0$a;->c:J

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/cen0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cen0$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/cen0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cen0$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
