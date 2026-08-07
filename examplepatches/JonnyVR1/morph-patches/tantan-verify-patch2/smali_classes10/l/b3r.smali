.class public final synthetic Ll/b3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f3r;


# direct methods
.method public synthetic constructor <init>(Ll/f3r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b3r;->a:Ll/f3r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b3r;->a:Ll/f3r;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/f3r;->Z3(Ll/f3r;Ljava/lang/Throwable;)V

    return-void
.end method
