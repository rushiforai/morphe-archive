.class public final synthetic Ll/m1u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r1u;


# direct methods
.method public synthetic constructor <init>(Ll/r1u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m1u;->a:Ll/r1u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m1u;->a:Ll/r1u;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/r1u;->W2(Ll/r1u;Ljava/lang/Throwable;)V

    return-void
.end method
