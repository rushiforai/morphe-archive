.class public final synthetic Ll/ib10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/i6t;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/i6t;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ib10;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/ib10;->b:Ll/i6t;

    iput-object p3, p0, Ll/ib10;->c:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib10;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/ib10;->b:Ll/i6t;

    iget-object p0, p0, Ll/ib10;->c:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, p0}, Ll/vb10;->d(Ljava/lang/String;Ll/i6t;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
