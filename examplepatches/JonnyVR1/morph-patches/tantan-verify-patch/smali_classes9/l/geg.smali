.class public final synthetic Ll/geg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/peg;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/peg;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/geg;->a:Ll/peg;

    iput-boolean p2, p0, Ll/geg;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/geg;->a:Ll/peg;

    iget-boolean p0, p0, Ll/geg;->b:Z

    check-cast p1, Ll/aeg;

    invoke-static {v0, p0, p1}, Ll/peg;->q4(Ll/peg;ZLl/aeg;)V

    return-void
.end method
