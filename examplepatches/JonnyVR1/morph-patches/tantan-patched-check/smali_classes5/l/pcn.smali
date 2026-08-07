.class public final synthetic Ll/pcn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rcn;


# direct methods
.method public synthetic constructor <init>(Ll/rcn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pcn;->a:Ll/rcn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pcn;->a:Ll/rcn;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/rcn;->e(Ll/rcn;Ljava/lang/Boolean;)V

    return-void
.end method
