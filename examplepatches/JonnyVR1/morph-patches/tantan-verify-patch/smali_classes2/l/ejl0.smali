.class public final synthetic Ll/ejl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/fc60;

.field public final synthetic b:Ll/ljl0;


# direct methods
.method public synthetic constructor <init>(Ll/fc60;Ll/ljl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ejl0;->a:Ll/fc60;

    iput-object p2, p0, Ll/ejl0;->b:Ll/ljl0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ejl0;->a:Ll/fc60;

    iget-object p0, p0, Ll/ejl0;->b:Ll/ljl0;

    invoke-static {v0, p0}, Ll/ljl0;->j(Ll/fc60;Ll/ljl0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
