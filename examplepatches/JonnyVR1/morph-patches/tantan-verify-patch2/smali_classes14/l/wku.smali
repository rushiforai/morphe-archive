.class public final synthetic Ll/wku;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/alu;


# direct methods
.method public synthetic constructor <init>(Ll/alu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wku;->a:Ll/alu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wku;->a:Ll/alu;

    check-cast p1, Ll/aiv$a;

    invoke-static {p0, p1}, Ll/alu;->V2(Ll/alu;Ll/aiv$a;)V

    return-void
.end method
