.class public final synthetic Ll/n5x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p5x;

.field public final synthetic b:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Ll/p5x;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n5x;->a:Ll/p5x;

    iput-object p2, p0, Ll/n5x;->b:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n5x;->a:Ll/p5x;

    iget-object p0, p0, Ll/n5x;->b:Ll/pf60;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/p5x;->e0(Ll/p5x;Ll/pf60;Ll/uxj0;)V

    return-void
.end method
