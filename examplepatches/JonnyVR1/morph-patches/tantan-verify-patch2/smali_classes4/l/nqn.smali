.class public final synthetic Ll/nqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pqn;


# direct methods
.method public synthetic constructor <init>(Ll/pqn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nqn;->a:Ll/pqn;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nqn;->a:Ll/pqn;

    invoke-static {p0}, Ll/pqn;->a(Ll/pqn;)V

    return-void
.end method
