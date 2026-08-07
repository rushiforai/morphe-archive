.class public final synthetic Ll/l6v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o6v;


# direct methods
.method public synthetic constructor <init>(Ll/o6v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6v;->a:Ll/o6v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6v;->a:Ll/o6v;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/o6v;->Q2(Ll/o6v;Ljava/lang/String;)V

    return-void
.end method
