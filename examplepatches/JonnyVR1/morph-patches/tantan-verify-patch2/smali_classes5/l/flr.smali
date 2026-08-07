.class public final synthetic Ll/flr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mlr;


# direct methods
.method public synthetic constructor <init>(Ll/mlr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/flr;->a:Ll/mlr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/flr;->a:Ll/mlr;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/mlr;->l0(Ll/mlr;Landroid/net/NetworkInfo;)V

    return-void
.end method
