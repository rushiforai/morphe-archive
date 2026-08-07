.class public final synthetic Ll/st;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/xt;

.field public final synthetic b:Ll/cvx;


# direct methods
.method public synthetic constructor <init>(Ll/xt;Ll/cvx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/st;->a:Ll/xt;

    iput-object p2, p0, Ll/st;->b:Ll/cvx;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/st;->a:Ll/xt;

    iget-object p0, p0, Ll/st;->b:Ll/cvx;

    invoke-static {v0, p0}, Ll/xt;->k0(Ll/xt;Ll/cvx;)V

    return-void
.end method
