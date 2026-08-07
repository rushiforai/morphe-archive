.class public final synthetic Ll/zra0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fsa0;


# direct methods
.method public synthetic constructor <init>(Ll/fsa0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zra0;->a:Ll/fsa0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zra0;->a:Ll/fsa0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    invoke-static {p0, p1}, Ll/fsa0;->e0(Ll/fsa0;Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
