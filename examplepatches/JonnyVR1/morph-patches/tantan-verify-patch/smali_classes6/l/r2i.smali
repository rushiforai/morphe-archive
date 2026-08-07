.class public final synthetic Ll/r2i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s2i;


# direct methods
.method public synthetic constructor <init>(Ll/s2i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2i;->a:Ll/s2i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r2i;->a:Ll/s2i;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/s2i;->b(Ll/s2i;Ljava/lang/Throwable;)V

    return-void
.end method
