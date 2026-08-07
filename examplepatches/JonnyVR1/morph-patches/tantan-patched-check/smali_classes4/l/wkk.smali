.class public final synthetic Ll/wkk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/clk;


# direct methods
.method public synthetic constructor <init>(Ll/clk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wkk;->a:Ll/clk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkk;->a:Ll/clk;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/clk;->i(Ll/clk;Ljava/lang/CharSequence;)V

    return-void
.end method
