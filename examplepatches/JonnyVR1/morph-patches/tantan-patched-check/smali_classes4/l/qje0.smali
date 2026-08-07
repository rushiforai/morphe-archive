.class public final synthetic Ll/qje0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rje0;


# direct methods
.method public synthetic constructor <init>(Ll/rje0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qje0;->a:Ll/rje0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qje0;->a:Ll/rje0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/rje0;->i0(Ll/rje0;Ljava/lang/Boolean;)V

    return-void
.end method
