.class public final synthetic Ll/j16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/q16;


# direct methods
.method public synthetic constructor <init>(Ll/q16;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j16;->a:Ll/q16;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j16;->a:Ll/q16;

    invoke-static {p0}, Ll/q16;->g(Ll/q16;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
