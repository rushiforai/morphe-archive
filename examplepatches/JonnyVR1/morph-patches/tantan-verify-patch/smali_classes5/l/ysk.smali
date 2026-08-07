.class public final synthetic Ll/ysk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Ll/jl80$a;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Ll/jl80$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ysk;->a:Lv/VText;

    iput-object p2, p0, Ll/ysk;->b:Ll/jl80$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ysk;->a:Lv/VText;

    iget-object p0, p0, Ll/ysk;->b:Ll/jl80$a;

    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    invoke-static {v0, p0, p1}, Ll/qtk;->B0(Lv/VText;Ll/jl80$a;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V

    return-void
.end method
