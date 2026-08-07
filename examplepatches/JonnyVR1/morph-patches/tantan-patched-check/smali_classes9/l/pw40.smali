.class public final synthetic Ll/pw40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vw40;


# direct methods
.method public synthetic constructor <init>(Ll/vw40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pw40;->a:Ll/vw40;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pw40;->a:Ll/vw40;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/vw40;->h4(Ll/vw40;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
