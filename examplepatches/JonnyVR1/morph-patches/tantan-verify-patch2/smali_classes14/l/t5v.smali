.class public final synthetic Ll/t5v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v5v;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/v5v;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5v;->a:Ll/v5v;

    iput-boolean p2, p0, Ll/t5v;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t5v;->a:Ll/v5v;

    iget-boolean p0, p0, Ll/t5v;->b:Z

    check-cast p1, Ll/j0v;

    invoke-static {v0, p0, p1}, Ll/v5v;->h0(Ll/v5v;ZLl/j0v;)V

    return-void
.end method
