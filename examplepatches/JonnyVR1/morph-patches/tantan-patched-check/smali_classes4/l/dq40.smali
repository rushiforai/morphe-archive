.class public final synthetic Ll/dq40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/iq40;


# direct methods
.method public synthetic constructor <init>(Ll/iq40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dq40;->a:Ll/iq40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq40;->a:Ll/iq40;

    check-cast p1, [I

    invoke-static {p0, p1}, Ll/iq40;->p(Ll/iq40;[I)V

    return-void
.end method
