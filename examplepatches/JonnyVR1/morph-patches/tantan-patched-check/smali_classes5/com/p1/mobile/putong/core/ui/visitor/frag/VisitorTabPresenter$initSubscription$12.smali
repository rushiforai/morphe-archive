.class final synthetic Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;
.super Lkotlin/jvm/internal/FunctionReferenceImpl;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1019
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/FunctionReferenceImpl;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;

    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;->INSTANCE:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    const-string v4, "isExpired(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Z"

    const/4 v5, 0x0

    const/4 v1, 0x1

    const-class v2, Ll/joa;

    const-string v3, "isExpired"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/FunctionReferenceImpl;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/joa;->U3(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter$initSubscription$12;->invoke(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
