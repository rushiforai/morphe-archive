.class public final synthetic Ll/c1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c1a;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c1a;->a:Ll/y20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/j1a;->o(Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method
