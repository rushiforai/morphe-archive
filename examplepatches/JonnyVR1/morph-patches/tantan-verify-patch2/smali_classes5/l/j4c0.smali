.class public final synthetic Ll/j4c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/s4c0;


# direct methods
.method public synthetic constructor <init>(Ll/s4c0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j4c0;->a:Ll/s4c0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j4c0;->a:Ll/s4c0;

    check-cast p1, Ll/i1c0;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {p0, p1, p2}, Ll/s4c0;->l(Ll/s4c0;Ll/i1c0;Z)V

    return-void
.end method
