.class public final synthetic Ll/x7h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b8h;


# direct methods
.method public synthetic constructor <init>(Ll/b8h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x7h;->a:Ll/b8h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7h;->a:Ll/b8h;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/b8h;->G(Ll/b8h;Ljava/lang/Throwable;)V

    return-void
.end method
