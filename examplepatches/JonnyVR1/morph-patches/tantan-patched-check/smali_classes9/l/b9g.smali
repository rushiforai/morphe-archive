.class public final synthetic Ll/b9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d9g;


# direct methods
.method public synthetic constructor <init>(Ll/d9g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b9g;->a:Ll/d9g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b9g;->a:Ll/d9g;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/d9g;->g4(Ll/d9g;Ljava/lang/Throwable;)V

    return-void
.end method
