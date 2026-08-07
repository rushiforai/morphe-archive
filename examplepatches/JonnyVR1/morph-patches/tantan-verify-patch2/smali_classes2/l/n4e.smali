.class public final synthetic Ll/n4e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/o4e$a;

.field public final synthetic b:Ll/o4e;


# direct methods
.method public synthetic constructor <init>(Ll/o4e$a;Ll/o4e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n4e;->a:Ll/o4e$a;

    iput-object p2, p0, Ll/n4e;->b:Ll/o4e;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n4e;->a:Ll/o4e$a;

    iget-object p0, p0, Ll/n4e;->b:Ll/o4e;

    invoke-static {v0, p0}, Ll/o4e$a;->j(Ll/o4e$a;Ll/o4e;)Lcom/facebook/common/internal/ImmutableMap;

    move-result-object p0

    return-object p0
.end method
