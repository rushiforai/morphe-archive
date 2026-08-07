.class public final synthetic Ll/ora0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tra0;


# direct methods
.method public synthetic constructor <init>(Ll/tra0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ora0;->a:Ll/tra0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ora0;->a:Ll/tra0;

    check-cast p1, Lcom/p1/mobile/putong/data/Answer;

    invoke-static {p0, p1}, Ll/tra0;->d(Ll/tra0;Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
