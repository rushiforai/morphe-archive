.class public final synthetic Ll/ngg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qgg;


# direct methods
.method public synthetic constructor <init>(Ll/qgg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ngg;->a:Ll/qgg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ngg;->a:Ll/qgg;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/qgg;->i0(Ll/qgg;Ljava/lang/Throwable;)V

    return-void
.end method
