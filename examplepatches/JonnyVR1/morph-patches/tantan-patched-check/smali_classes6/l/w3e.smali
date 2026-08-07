.class public final synthetic Ll/w3e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x3e;


# direct methods
.method public synthetic constructor <init>(Ll/x3e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w3e;->a:Ll/x3e;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w3e;->a:Ll/x3e;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/x3e;->a(Ll/x3e;Ljava/lang/String;)V

    return-void
.end method
