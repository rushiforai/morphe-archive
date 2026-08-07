.class public final synthetic Ll/d9x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g9x;


# direct methods
.method public synthetic constructor <init>(Ll/g9x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d9x;->a:Ll/g9x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d9x;->a:Ll/g9x;

    check-cast p1, [I

    invoke-static {p0, p1}, Ll/g9x;->a(Ll/g9x;[I)V

    return-void
.end method
