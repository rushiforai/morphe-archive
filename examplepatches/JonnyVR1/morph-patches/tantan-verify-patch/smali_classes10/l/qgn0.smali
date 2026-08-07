.class public final synthetic Ll/qgn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/wgn0;


# direct methods
.method public synthetic constructor <init>(Ll/wgn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qgn0;->a:Ll/wgn0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qgn0;->a:Ll/wgn0;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/wgn0;->W3(Ll/wgn0;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
