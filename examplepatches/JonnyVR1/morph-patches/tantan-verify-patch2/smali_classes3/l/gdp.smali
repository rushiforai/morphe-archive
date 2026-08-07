.class public final synthetic Ll/gdp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/dum;

.field public final synthetic b:Ll/kdp;


# direct methods
.method public synthetic constructor <init>(Ll/dum;Ll/kdp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gdp;->a:Ll/dum;

    iput-object p2, p0, Ll/gdp;->b:Ll/kdp;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gdp;->a:Ll/dum;

    iget-object p0, p0, Ll/gdp;->b:Ll/kdp;

    invoke-static {v0, p0}, Ll/kdp;->W3(Ll/dum;Ll/kdp;)Ll/urn;

    move-result-object p0

    return-object p0
.end method
