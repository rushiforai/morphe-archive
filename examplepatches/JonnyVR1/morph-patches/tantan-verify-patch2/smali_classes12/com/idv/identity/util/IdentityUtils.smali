.class public Lcom/idv/identity/util/IdentityUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static s_instance:Lcom/idv/identity/util/IdentityUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "identityutils"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/idv/identity/util/IdentityUtils;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/idv/identity/util/IdentityUtils;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/idv/identity/util/IdentityUtils;->s_instance:Lcom/idv/identity/util/IdentityUtils;

    .line 12
    .line 13
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

.method public static native cpm([BI)Ljava/lang/String;
.end method

.method public static native gdsk()Ljava/lang/String;
.end method

.method public static getInstance()Lcom/idv/identity/util/IdentityUtils;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/util/IdentityUtils;->s_instance:Lcom/idv/identity/util/IdentityUtils;

    .line 2
    .line 3
    return-object v0
.end method

.method public static native gk()Ljava/lang/String;
.end method

.method public static native gs(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native sd([BLjava/lang/String;)Ljava/lang/String;
.end method

.method public static native se([BLjava/lang/String;)Ljava/lang/String;
.end method
