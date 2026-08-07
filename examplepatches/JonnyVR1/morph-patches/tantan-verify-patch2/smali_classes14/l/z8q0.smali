.class public final synthetic Ll/z8q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z8q0;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8q0;->a:Ll/x20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ccq0;->q1(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method
