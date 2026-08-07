.class public final synthetic Ll/kqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pqn;


# direct methods
.method public synthetic constructor <init>(Ll/pqn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kqn;->a:Ll/pqn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kqn;->a:Ll/pqn;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/pqn;->d(Ll/pqn;Ljava/lang/Boolean;)V

    return-void
.end method
