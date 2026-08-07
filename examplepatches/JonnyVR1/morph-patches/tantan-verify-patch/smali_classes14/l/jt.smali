.class public final synthetic Ll/jt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xt;

.field public final synthetic b:Ll/cvx;


# direct methods
.method public synthetic constructor <init>(Ll/xt;Ll/cvx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jt;->a:Ll/xt;

    iput-object p2, p0, Ll/jt;->b:Ll/cvx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jt;->a:Ll/xt;

    iget-object p0, p0, Ll/jt;->b:Ll/cvx;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/xt;->y0(Ll/xt;Ll/cvx;Ljava/util/List;)V

    return-void
.end method
