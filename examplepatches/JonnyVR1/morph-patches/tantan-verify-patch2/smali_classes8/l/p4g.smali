.class public final synthetic Ll/p4g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r4g;


# direct methods
.method public synthetic constructor <init>(Ll/r4g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p4g;->a:Ll/r4g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4g;->a:Ll/r4g;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/r4g;->e0(Ll/r4g;Ljava/lang/Throwable;)V

    return-void
.end method
