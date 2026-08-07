.class public final synthetic Ll/m020;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/q020;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/q020;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m020;->a:Ll/q020;

    iput-boolean p2, p0, Ll/m020;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m020;->a:Ll/q020;

    iget-boolean p0, p0, Ll/m020;->b:Z

    check-cast p1, Ll/d3q;

    invoke-static {v0, p0, p1}, Ll/q020;->m(Ll/q020;ZLl/d3q;)V

    return-void
.end method
