.class public final synthetic Ll/m4u0;
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
    iput-object p1, p0, Ll/m4u0;->a:Ll/g9s0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m4u0;->a:Ll/g9s0;

    .line 2
    .line 3
    new-instance v0, Ll/i3y0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/i3y0;-><init>(Ll/sdr0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
