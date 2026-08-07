.class public final synthetic Ll/f0u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j0u;


# direct methods
.method public synthetic constructor <init>(Ll/j0u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f0u;->a:Ll/j0u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f0u;->a:Ll/j0u;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/j0u;->y0(Ll/j0u;Ljava/lang/Throwable;)V

    return-void
.end method
