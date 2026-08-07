.class public final synthetic Ll/mdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/cen;


# direct methods
.method public synthetic constructor <init>(Ll/cen;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mdn;->a:Ll/cen;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mdn;->a:Ll/cen;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/cen;->h(Ll/cen;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
