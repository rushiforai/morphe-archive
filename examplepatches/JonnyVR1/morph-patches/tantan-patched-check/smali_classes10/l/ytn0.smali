.class public final synthetic Ll/ytn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gun0;


# direct methods
.method public synthetic constructor <init>(Ll/gun0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ytn0;->a:Ll/gun0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ytn0;->a:Ll/gun0;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/gun0;->c4(Ll/gun0;Ljava/lang/Integer;)V

    return-void
.end method
