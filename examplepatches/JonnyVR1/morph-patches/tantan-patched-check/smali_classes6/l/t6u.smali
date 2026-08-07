.class public final synthetic Ll/t6u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v6u;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/v6u;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t6u;->a:Ll/v6u;

    iput-boolean p2, p0, Ll/t6u;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t6u;->a:Ll/v6u;

    iget-boolean p0, p0, Ll/t6u;->b:Z

    check-cast p1, Ll/d3q;

    invoke-static {v0, p0, p1}, Ll/v6u;->f0(Ll/v6u;ZLl/d3q;)V

    return-void
.end method
