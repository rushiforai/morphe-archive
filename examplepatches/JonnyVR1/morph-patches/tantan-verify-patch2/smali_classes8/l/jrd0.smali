.class public final Ll/jrd0;
.super Ll/ird0;
.source "SourceFile"


# static fields
.field private static final INSTANCE:Ll/jrd0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jrd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jrd0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jrd0;->INSTANCE:Ll/jrd0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ird0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f()Ll/ird0;
    .locals 1

    .line 1
    sget-object v0, Ll/jrd0;->INSTANCE:Ll/jrd0;

    .line 2
    .line 3
    return-object v0
.end method
