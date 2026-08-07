.class public final synthetic Ll/fr5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kr5;


# direct methods
.method public synthetic constructor <init>(Ll/kr5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fr5;->a:Ll/kr5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr5;->a:Ll/kr5;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/kr5;->h(Ll/kr5;Ljava/lang/Throwable;)V

    return-void
.end method
