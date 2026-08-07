.class public Ll/aae0$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/aae0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:Ljava/lang/String;

.field public d:Ll/aae0$b;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gk2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/aae0$a;)Ll/aae0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aae0$a;->d:Ll/aae0$b;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/aae0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aae0$a;->c:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public c()Ll/aae0;
    .locals 1

    .line 1
    new-instance v0, Ll/aae0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/aae0;-><init>(Ll/aae0$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d(Ll/aae0$b;)Ll/aae0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aae0$a;->d:Ll/aae0$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/aae0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aae0$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
