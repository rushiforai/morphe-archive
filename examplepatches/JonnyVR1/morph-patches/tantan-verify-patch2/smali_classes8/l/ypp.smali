.class public final synthetic Ll/ypp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/eqp;


# direct methods
.method public synthetic constructor <init>(ZLl/eqp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/ypp;->a:Z

    iput-object p2, p0, Ll/ypp;->b:Ll/eqp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ypp;->a:Z

    iget-object p0, p0, Ll/ypp;->b:Ll/eqp;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/eqp;->t0(ZLl/eqp;Ljava/lang/Throwable;)V

    return-void
.end method
