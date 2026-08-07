.class public final Ll/lfw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lfw0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lfw0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ll/lfw0;
    .locals 1

    .line 1
    const-string v0, "Name is null or empty"

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/tgw0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "Version is null or empty"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/tgw0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/lfw0;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/lfw0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfw0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfw0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
