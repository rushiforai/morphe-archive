.class public final synthetic Ll/fpx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jpx;


# direct methods
.method public synthetic constructor <init>(Ll/jpx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fpx;->a:Ll/jpx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fpx;->a:Ll/jpx;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/jpx;->X3(Ll/jpx;Ljava/util/List;)V

    return-void
.end method
