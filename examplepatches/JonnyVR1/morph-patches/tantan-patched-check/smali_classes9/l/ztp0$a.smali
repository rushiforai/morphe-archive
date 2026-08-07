.class public Ll/ztp0$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ztp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:Ljava/lang/String;


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

.method public static bridge synthetic a(Ll/ztp0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ztp0$a;->c:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public b()Ll/ztp0;
    .locals 1

    .line 1
    new-instance v0, Ll/ztp0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ztp0;-><init>(Ll/ztp0$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c(Ljava/lang/String;)Ll/ztp0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ztp0$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
