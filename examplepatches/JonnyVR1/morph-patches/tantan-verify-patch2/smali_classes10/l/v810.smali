.class public final synthetic Ll/v810;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/e910;


# direct methods
.method public synthetic constructor <init>(Ll/e910;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v810;->a:Ll/e910;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v810;->a:Ll/e910;

    check-cast p1, Ll/c8t;

    invoke-static {p0, p1}, Ll/e910;->W3(Ll/e910;Ll/c8t;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
