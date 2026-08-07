.class public final synthetic Ll/eaj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/haj0;


# direct methods
.method public synthetic constructor <init>(Ll/haj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eaj0;->a:Ll/haj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eaj0;->a:Ll/haj0;

    check-cast p1, Lkotlin/Pair;

    invoke-static {p0, p1}, Ll/haj0;->L3(Ll/haj0;Lkotlin/Pair;)V

    return-void
.end method
