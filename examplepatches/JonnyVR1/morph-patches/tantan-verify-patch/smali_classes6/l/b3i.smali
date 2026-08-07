.class public final synthetic Ll/b3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d3i;


# direct methods
.method public synthetic constructor <init>(Ll/d3i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b3i;->a:Ll/d3i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b3i;->a:Ll/d3i;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/d3i;->b(Ll/d3i;Ljava/lang/Throwable;)V

    return-void
.end method
