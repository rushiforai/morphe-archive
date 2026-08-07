.class public final synthetic Ll/p0w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/q0w;


# direct methods
.method public synthetic constructor <init>(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p0w;->a:Ll/q0w;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0w;->a:Ll/q0w;

    invoke-static {p0}, Ll/q0w;->a(Ll/q0w;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
