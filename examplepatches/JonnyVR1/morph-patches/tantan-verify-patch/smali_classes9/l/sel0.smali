.class public final synthetic Ll/sel0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uel0;


# direct methods
.method public synthetic constructor <init>(Ll/uel0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sel0;->a:Ll/uel0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sel0;->a:Ll/uel0;

    check-cast p1, Ll/fik0;

    invoke-static {p0, p1}, Ll/uel0;->o6(Ll/uel0;Ll/fik0;)Ll/fik0$a;

    move-result-object p0

    return-object p0
.end method
