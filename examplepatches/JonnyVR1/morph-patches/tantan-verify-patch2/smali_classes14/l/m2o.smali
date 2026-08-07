.class public final synthetic Ll/m2o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h3o;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/h3o;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m2o;->a:Ll/h3o;

    iput-boolean p2, p0, Ll/m2o;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m2o;->a:Ll/h3o;

    iget-boolean p0, p0, Ll/m2o;->b:Z

    check-cast p1, Ll/p5u;

    invoke-static {v0, p0, p1}, Ll/h3o;->x(Ll/h3o;ZLl/p5u;)V

    return-void
.end method
