.class public final synthetic Ll/r5v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v5v;


# direct methods
.method public synthetic constructor <init>(Ll/v5v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r5v;->a:Ll/v5v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5v;->a:Ll/v5v;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/v5v;->i0(Ll/v5v;Ljava/lang/Boolean;)V

    return-void
.end method
