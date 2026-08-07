.class public final synthetic Ll/lei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pei;


# direct methods
.method public synthetic constructor <init>(Ll/pei;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lei;->a:Ll/pei;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lei;->a:Ll/pei;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/pei;->k(Ll/pei;Ljava/lang/Boolean;)V

    return-void
.end method
