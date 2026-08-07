.class public Ll/ond;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ra5;


# static fields
.field public static final a:Ll/ond;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ond;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ond;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ond;->a:Ll/ond;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/ra5;
    .locals 1

    .line 1
    sget-object v0, Ll/ond;->a:Ll/ond;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public currentTimeMillis()J
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method
