.class public final synthetic Ll/g9w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g9w;->a:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9w;->a:Ljava/lang/Integer;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/haw;->J(Ljava/lang/Integer;Ll/uxj0;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
