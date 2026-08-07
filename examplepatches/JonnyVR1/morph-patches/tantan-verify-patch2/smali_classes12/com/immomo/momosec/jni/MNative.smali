.class public Lcom/immomo/momosec/jni/MNative;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static instance:Lcom/immomo/momosec/jni/MNative;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "message_crypto_android"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static b()Lcom/immomo/momosec/jni/MNative;
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/momosec/jni/MNative;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/immomo/momosec/jni/MNative;->instance:Lcom/immomo/momosec/jni/MNative;

    if-nez v1, :cond_0

    new-instance v1, Lcom/immomo/momosec/jni/MNative;

    invoke-direct {v1}, Lcom/immomo/momosec/jni/MNative;-><init>()V

    sput-object v1, Lcom/immomo/momosec/jni/MNative;->instance:Lcom/immomo/momosec/jni/MNative;

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :cond_0
    :goto_0
    sget-object v1, Lcom/immomo/momosec/jni/MNative;->instance:Lcom/immomo/momosec/jni/MNative;

    monitor-exit v0

    return-object v1

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public native a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native a49kdEba83(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native a4YB80f4Zo(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
.end method

.method public native a9ehcDdu3j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native ec08UzcIZd(Ljava/lang/String;I)Ljava/lang/String;
.end method

.method public native ecdsaSign(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native en45Qw12Rt(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public native o()Ljava/lang/String;
.end method
