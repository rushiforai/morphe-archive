.class public final synthetic Ll/jgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lgn;


# direct methods
.method public synthetic constructor <init>(Ll/lgn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jgn;->a:Ll/lgn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jgn;->a:Ll/lgn;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/lgn;->g0(Ll/lgn;Ljava/lang/Throwable;)V

    return-void
.end method
