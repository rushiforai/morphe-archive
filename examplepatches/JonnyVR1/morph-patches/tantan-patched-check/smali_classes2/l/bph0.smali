.class public Ll/bph0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pa5;


# static fields
.field private static final INSTANCE:Ll/bph0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/bph0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bph0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/bph0;->INSTANCE:Ll/bph0;

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

.method public static a()Ll/bph0;
    .locals 1

    .line 1
    sget-object v0, Ll/bph0;->INSTANCE:Ll/bph0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public now()J
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
