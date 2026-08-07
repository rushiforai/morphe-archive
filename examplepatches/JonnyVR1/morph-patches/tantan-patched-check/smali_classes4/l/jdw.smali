.class public final synthetic Ll/jdw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pdw;


# direct methods
.method public synthetic constructor <init>(Ll/pdw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdw;->a:Ll/pdw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdw;->a:Ll/pdw;

    check-cast p1, Ll/vg60;

    invoke-static {p0, p1}, Ll/pdw;->h0(Ll/pdw;Ll/vg60;)V

    return-void
.end method
