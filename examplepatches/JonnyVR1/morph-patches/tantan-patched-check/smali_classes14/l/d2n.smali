.class public final synthetic Ll/d2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j2n;


# direct methods
.method public synthetic constructor <init>(Ll/j2n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d2n;->a:Ll/j2n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d2n;->a:Ll/j2n;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/j2n;->U2(Ll/j2n;Ljava/lang/Boolean;)V

    return-void
.end method
