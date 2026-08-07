.class public final synthetic Ll/p6h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t6h;


# direct methods
.method public synthetic constructor <init>(Ll/t6h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p6h;->a:Ll/t6h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6h;->a:Ll/t6h;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/t6h;->f(Ll/t6h;Ljava/lang/Throwable;)V

    return-void
.end method
