.class public final synthetic Ll/a5x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b5x;


# direct methods
.method public synthetic constructor <init>(Ll/b5x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a5x;->a:Ll/b5x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5x;->a:Ll/b5x;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/b5x;->i0(Ll/b5x;Ljava/lang/Throwable;)V

    return-void
.end method
