.class public final synthetic Ll/f3a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r2a;


# direct methods
.method public synthetic constructor <init>(Ll/r2a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f3a;->a:Ll/r2a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f3a;->a:Ll/r2a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-interface {p0, p1}, Ll/r2a;->a(Ljava/lang/Throwable;)V

    return-void
.end method
