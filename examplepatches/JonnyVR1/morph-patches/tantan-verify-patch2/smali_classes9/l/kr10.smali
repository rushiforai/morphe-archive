.class public final synthetic Ll/kr10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lr10;


# direct methods
.method public synthetic constructor <init>(Ll/lr10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kr10;->a:Ll/lr10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kr10;->a:Ll/lr10;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/lr10;->f(Ll/lr10;Ljava/lang/Long;)V

    return-void
.end method
