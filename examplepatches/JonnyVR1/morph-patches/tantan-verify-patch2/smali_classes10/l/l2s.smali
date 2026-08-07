.class public final synthetic Ll/l2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r2s;


# direct methods
.method public synthetic constructor <init>(Ll/r2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2s;->a:Ll/r2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2s;->a:Ll/r2s;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    return-void
.end method
