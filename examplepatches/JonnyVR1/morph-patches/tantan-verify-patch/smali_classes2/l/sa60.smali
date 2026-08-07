.class public final synthetic Ll/sa60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ab60;

.field public final synthetic b:Ll/dc60;

.field public final synthetic c:Ll/ab60$a;


# direct methods
.method public synthetic constructor <init>(Ll/ab60;Ll/dc60;Ll/ab60$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sa60;->a:Ll/ab60;

    iput-object p2, p0, Ll/sa60;->b:Ll/dc60;

    iput-object p3, p0, Ll/sa60;->c:Ll/ab60$a;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sa60;->a:Ll/ab60;

    iget-object v1, p0, Ll/sa60;->b:Ll/dc60;

    iget-object p0, p0, Ll/sa60;->c:Ll/ab60$a;

    invoke-static {v0, v1, p0}, Ll/ab60;->e(Ll/ab60;Ll/dc60;Ll/ab60$a;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
