.class public final synthetic Ll/roi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/jni0;


# direct methods
.method public synthetic constructor <init>(Ll/jni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/roi0;->a:Ll/jni0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/roi0;->a:Ll/jni0;

    invoke-virtual {p0}, Ll/jni0;->g()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
