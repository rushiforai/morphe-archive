.class public final Ll/ovb$a;
.super Ll/vd1$a$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ovb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vd1$a$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/String;)Ll/vd1$a$a;
    .locals 0
    .annotation build Lcom/google/android/gms/common/internal/ShowFirstParty;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vd1$a$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic b()Ll/vd1$a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ovb$a;->c()Ll/ovb;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c()Ll/ovb;
    .locals 2

    .line 1
    new-instance v0, Ll/ovb;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/ovb;-><init>(Ll/ovb$a;Ll/six0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public final d()Ll/ovb$a;
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iput-object v0, p0, Ll/vd1$a$a;->b:Ljava/lang/Boolean;

    .line 4
    .line 5
    return-object p0
.end method
