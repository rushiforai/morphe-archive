.class public final Lplm;
.super Lqlm;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "SECONDARY"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final d(Z)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final g(Z)Z
    .registers 2

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method
