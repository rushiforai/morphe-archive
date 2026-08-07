.class public final synthetic Ll/vap0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/acp0;


# direct methods
.method public synthetic constructor <init>(ZLl/acp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/vap0;->a:Z

    iput-object p2, p0, Ll/vap0;->b:Ll/acp0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/vap0;->a:Z

    iget-object p0, p0, Ll/vap0;->b:Ll/acp0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/acp0;->y4(ZLl/acp0;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
