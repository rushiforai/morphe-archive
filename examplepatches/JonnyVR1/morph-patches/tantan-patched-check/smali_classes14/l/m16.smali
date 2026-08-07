.class public final synthetic Ll/m16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/q16;


# direct methods
.method public synthetic constructor <init>(Ll/q16;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m16;->a:Ll/q16;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m16;->a:Ll/q16;

    invoke-static {p0}, Ll/q16;->k(Ll/q16;)Ll/q16$b;

    move-result-object p0

    return-object p0
.end method
