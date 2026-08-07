.class public final synthetic Ll/m0u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r0u;


# direct methods
.method public synthetic constructor <init>(Ll/r0u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m0u;->a:Ll/r0u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m0u;->a:Ll/r0u;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/r0u;->s0(Ll/r0u;Ljava/lang/Throwable;)V

    return-void
.end method
