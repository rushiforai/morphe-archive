.class public final synthetic Ll/v9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y9h;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/y9h;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v9h;->a:Ll/y9h;

    iput-boolean p2, p0, Ll/v9h;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v9h;->a:Ll/y9h;

    iget-boolean p0, p0, Ll/v9h;->b:Z

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/y9h;->f(Ll/y9h;ZLl/pf60;)V

    return-void
.end method
