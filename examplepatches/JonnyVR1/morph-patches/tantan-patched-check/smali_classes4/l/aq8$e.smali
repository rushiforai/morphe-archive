.class public Ll/aq8$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/m1l0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/aq8;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Ll/aq8;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public key()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "privilege_see"

    .line 2
    .line 3
    return-object p0
.end method
