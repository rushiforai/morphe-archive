.class public final synthetic Ll/jpp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eqp;


# direct methods
.method public synthetic constructor <init>(Ll/eqp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jpp;->a:Ll/eqp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpp;->a:Ll/eqp;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/eqp;->q0(Ll/eqp;Landroid/net/NetworkInfo;)V

    return-void
.end method
