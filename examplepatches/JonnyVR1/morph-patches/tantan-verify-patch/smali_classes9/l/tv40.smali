.class public final synthetic Ll/tv40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dw40;


# direct methods
.method public synthetic constructor <init>(Ll/dw40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tv40;->a:Ll/dw40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tv40;->a:Ll/dw40;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ll/dw40;->o2(Ll/dw40;Ljava/util/ArrayList;)V

    return-void
.end method
