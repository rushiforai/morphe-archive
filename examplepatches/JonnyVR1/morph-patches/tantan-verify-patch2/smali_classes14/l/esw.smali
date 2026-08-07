.class public final synthetic Ll/esw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fsw;


# direct methods
.method public synthetic constructor <init>(Ll/fsw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/esw;->a:Ll/fsw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/esw;->a:Ll/fsw;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/fsw;->k(Ll/fsw;Ljava/lang/Throwable;)V

    return-void
.end method
