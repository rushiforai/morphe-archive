.class public final synthetic Ll/qso0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/sso0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/sso0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qso0;->a:Ll/sso0;

    iput-object p2, p0, Ll/qso0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qso0;->a:Ll/sso0;

    iget-object p0, p0, Ll/qso0;->b:Ljava/lang/String;

    check-cast p1, Ll/laj;

    invoke-static {v0, p0, p1}, Ll/sso0;->J(Ll/sso0;Ljava/lang/String;Ll/laj;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
