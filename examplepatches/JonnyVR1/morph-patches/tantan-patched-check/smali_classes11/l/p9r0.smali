.class public final synthetic Ll/p9r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public synthetic a:Ll/g9s0;


# direct methods
.method public synthetic constructor <init>(Ll/g9s0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p9r0;->a:Ll/g9s0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9r0;->a:Ll/g9s0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g9s0;->e()Ll/mpr0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
