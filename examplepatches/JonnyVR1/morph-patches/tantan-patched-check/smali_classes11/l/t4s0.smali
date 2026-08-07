.class public final Ll/t4s0;
.super Ll/e2s0;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final o:Ll/t4s0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/uzr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uzr0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/t4s0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/t4s0;-><init>(Ll/uzr0;)V

    .line 9
    .line 10
    .line 11
    sput-object v1, Ll/t4s0;->o:Ll/t4s0;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ll/uzr0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ll/e2s0;-><init>(Ll/uzr0;Ll/v0s0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ll/uzr0;Ll/l3s0;)V
    .locals 0

    const/4 p2, 0x0

    .line 6
    invoke-direct {p0, p1, p2}, Ll/e2s0;-><init>(Ll/uzr0;Ll/v0s0;)V

    return-void
.end method
