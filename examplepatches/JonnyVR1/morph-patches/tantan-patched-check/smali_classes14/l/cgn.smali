.class public final synthetic Ll/cgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ggn;


# direct methods
.method public synthetic constructor <init>(Ll/ggn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cgn;->a:Ll/ggn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cgn;->a:Ll/ggn;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ggn;->g(Ll/ggn;Ljava/lang/Throwable;)V

    return-void
.end method
