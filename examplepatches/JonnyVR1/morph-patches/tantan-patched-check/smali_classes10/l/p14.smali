.class public final synthetic Ll/p14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r14;


# direct methods
.method public synthetic constructor <init>(Ll/r14;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p14;->a:Ll/r14;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p14;->a:Ll/r14;

    check-cast p1, Ll/jsv;

    invoke-static {p0, p1}, Ll/r14;->M3(Ll/r14;Ll/jsv;)V

    return-void
.end method
