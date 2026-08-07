.class public final synthetic Ll/ntn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qtn;


# direct methods
.method public synthetic constructor <init>(Ll/qtn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ntn;->a:Ll/qtn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ntn;->a:Ll/qtn;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/qtn;->Q2(Ll/qtn;Ljava/lang/Boolean;)V

    return-void
.end method
