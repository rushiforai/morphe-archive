.class public final synthetic Ll/tap0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/acp0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/acp0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tap0;->a:Ll/acp0;

    iput-boolean p2, p0, Ll/tap0;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tap0;->a:Ll/acp0;

    iget-boolean p0, p0, Ll/tap0;->b:Z

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/acp0;->W3(Ll/acp0;ZLjava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
