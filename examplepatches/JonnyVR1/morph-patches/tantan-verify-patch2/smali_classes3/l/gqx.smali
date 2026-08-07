.class public final synthetic Ll/gqx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/uqx;


# direct methods
.method public synthetic constructor <init>(Ll/uqx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gqx;->a:Ll/uqx;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqx;->a:Ll/uqx;

    invoke-static {p0}, Ll/uqx;->f(Ll/uqx;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
