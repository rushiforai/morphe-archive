.class public final synthetic Ll/ur50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gs50;


# direct methods
.method public synthetic constructor <init>(Ll/gs50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ur50;->a:Ll/gs50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ur50;->a:Ll/gs50;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/gs50;->o(Ll/gs50;Ljava/lang/String;)V

    return-void
.end method
