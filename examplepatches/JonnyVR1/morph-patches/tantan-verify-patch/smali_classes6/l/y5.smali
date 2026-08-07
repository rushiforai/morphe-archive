.class public final synthetic Ll/y5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b6;


# direct methods
.method public synthetic constructor <init>(Ll/b6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y5;->a:Ll/b6;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y5;->a:Ll/b6;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/b6;->b(Ll/b6;Ljava/lang/String;)V

    return-void
.end method
