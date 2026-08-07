.class public final synthetic Ll/gx5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jx5;


# direct methods
.method public synthetic constructor <init>(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gx5;->a:Ll/jx5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gx5;->a:Ll/jx5;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/jx5;->b(Ll/jx5;Landroid/net/NetworkInfo;)V

    return-void
.end method
